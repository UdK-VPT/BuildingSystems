/*  ncDataReader2 - interpolating reading of 1D data sets
    Copyright (C) 2004  Joerg Raedler <joerg@dezentral.de>

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

#ifndef NCDATAREADER2_H
#define NCDATAREADER2_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdlib.h>
#include <stdio.h>

#define DLL_EXPORT __declspec(dllexport)

char DLL_EXPORT  *ncDataReader2Version();

#ifdef NC_NOCHECK
#define ncError(S) (S)
#define ncdrError(S, M) (S)
#else
/* type of a function to handle errors */
typedef void (* NcErrorHandler)(int , char *);

/* get/set/change handler function */
NcErrorHandler DLL_EXPORT ncSetErrorHandler(NcErrorHandler newHandler);

/* handle possible netcdf errors */
int DLL_EXPORT ncError(int status);

/* internal errors of this library */
#define NCDR_ENOMEM 10
#define NCDR_ENOMEM_TXT   "could not allocate memory"
#define NCDR_EINVAL 11
#define NCDR_EINVAL_TXT "invalid value specified"
#define NCDR_EFILEW 12
#define NCDR_EFILEW_TXT "could not open file for writing"

/* handle internal errors of this library */
int DLL_EXPORT ncdrError(int status, char *msg);

#endif /* NC_NOCHECK */


/* length of an array called 'large', longer
   arrays are not fully loaded with LtAuto */
#define LARGE_DATASET 10000

#ifndef __cplusplus
/* the boolean data type */
#ifndef BOOL_DEFINED
typedef enum {false=0, true=1} bool;
#define BOOL_DEFINED
#define CTOOLS_BOOL_DEFINED
#endif /* bool */
#endif /* __cplusplus */

/* netcdf attributes honoured by ncDataReader2 */
#define NCATT_SCALE_FACTOR    "scale_factor"
#define NCATT_ADD_OFFSET      "add_offset"

#define NCATT_EXTRAPOLATION   "extrapolation"
#define NCATT_EP_DEFAULT      "default"
#define NCATT_EP_PERIODIC     "periodic"
#define NCATT_EP_CONSTANT     "constant"

#define NCATT_INTERPOLATION   "interpolation"
#define NCATT_IP_AKIMA        "akima"
#define NCATT_IP_LINEAR       "linear"
#define NCATT_IP_DISCRETE     "discrete"
#define NCATT_IP_SINSTEPS     "sinsteps"
#define NCATT_IP_COSWIN       "coswin"

#define NCATT_LOAD_TYPE       "load_type"
#define NCATT_LT_AUTO         "auto"
#define NCATT_LT_FULL         "full"
#define NCATT_LT_NONE         "none"
#define NCATT_LT_CHUNK        "chunk"

#define NCATT_CHUNK_SIZE      "chunk_size"
#define NCATT_LOOKUP_CACHE    "lookup_cache"

#define NCATT_PARAMETER_CACHE "parameter_cache"
#define NCATT_VALUE_CACHE     "value_cache"
#define NCATT_SMOOTHING       "smoothing"
#define NCATT_WINDOW_SIZE     "window_size"

#define NCATT_CSA_NPMIN       "csa_npmin"
#define NCATT_CSA_NPMAX       "csa_npmax"
#define NCATT_CSA_K           "csa_k"
#define NCATT_CSA_NPPC        "csa_nppc"

#define NC_LOOKUP_CACHE_AUTO  -1

/* * * *       1D functions       * * * */

/* extrapolation types */
typedef enum {EpAuto, EpDefault, EpPeriodic, EpConstant} Extrapolation;

/* interpolation types */
typedef enum {IpAuto, IpAkima, IpLinear, IpDiscrete, IpSinSteps, IpCosWin} Interpolation;

/* load types */
typedef enum {LtAuto, LtFull, LtChunk, LtNone} LoadType;

/* dataSet options */
typedef enum {OpDataSetChunkSize, OpDataSetScaling, OpDataSetLookupCacheSize} DataSetOption;

/* a 1D dataset */
typedef struct {
    int fileId;            /* netcdf file id */
    int varId;             /* netcdf variable id */
    int refCount;          /* number of references from NcVar1D instances */
    size_t dim;            /* dimension/length of variable */
    double min;            /* first value */
    double max;            /* last value */
    double scale[2];       /* scale values */
    Extrapolation extra;   /* extrapolation type */
    LoadType loadType;     /* load type */
    double *cache;         /* cache for loaded data */
    size_t chunkSize;      /* size of chunks to load */
    size_t cacheIndex[2];  /* start and end index of cache */
    void *lookupCache;     /* lookup ring-cache for interval search */
    size_t lCacheStat[2];  /* lookup cache success statistics */
    size_t loadCount;      /* count of loading data/chunks */
} NcDataSet1D;

NcDataSet1D DLL_EXPORT *ncDataSet1DNew(const char *fileName, const char *varName, Extrapolation extra, LoadType loadType, int lookupCacheSize);
size_t      DLL_EXPORT  ncDataSet1DSearch(NcDataSet1D *dataSet, double *x);
double      DLL_EXPORT  ncDataSet1DGetItem(NcDataSet1D *dataSet, size_t i);
void        DLL_EXPORT  ncDataSet1DFree(NcDataSet1D *dataSet);
int         DLL_EXPORT  ncDataSet1DSetOption(NcDataSet1D *dataSet, DataSetOption option, ...);
void        DLL_EXPORT  ncDataSet1DDumpStatistics(NcDataSet1D *dataSet, FILE *f);

/* a 1D variable */
typedef struct {
    NcDataSet1D *dataSet;  /* dataset we depend on */
    int varId;             /* netcdf variable id */
    double smoothing;      /* smoothing value or window size */
    double scale[2];       /* scale values */
    double transition;     /* first value cached, may be needed by EpPeriodic */
    Interpolation inter;   /* interpolation type */
    LoadType loadType;     /* load type */
    double *cache;         /* cache for loaded data */
    size_t chunkSize;      /* size of chunks to load */
    size_t cacheIndex[2];  /* start and end index of cache */
    void *valueCache;      /* ring-cache for variable values */
    void *parameterCache;  /* ring-cache for some parameters */
    size_t vCacheStat[2];  /* value cache success statistics */
    size_t pCacheStat[2];  /* parameter cache success statistics */
    size_t loadCount;      /* count of loading data/chunks */
} NcVar1D;

/* variable options */
typedef enum {OpVarChunkSize, OpVarScaling, OpVarParameterCacheSize, OpVarValueCacheSize, OpVarSmoothing, OpVarWindowSize} VarOption;

NcVar1D DLL_EXPORT *ncVar1DNew(NcDataSet1D *dataSet, const char *varName, Interpolation inter, LoadType loadType);
double  DLL_EXPORT  ncVar1DGet(NcVar1D *var, double x);
double  DLL_EXPORT  ncVar1DGetItem(NcVar1D *var, size_t i);
void    DLL_EXPORT  ncVar1DFree(NcVar1D *var);
int     DLL_EXPORT  ncVar1DSetOption(NcVar1D *var, VarOption option, ...);
void    DLL_EXPORT  ncVar1DDumpStatistics(NcVar1D *var, FILE *f);

/* * * *       2D functions       * * * */

/* Scattered2D */
typedef struct {
    void   *_csa;            /* csa-struct pointer */
    size_t  nPoints;         /* number of points */
    bool    isInitialized;   /* flag if splines are already calculated */
    double *points;          /* contains the points */
    double  xScale[2];       /* scale values */
    double  yScale[2];       /* scale values */
    double  zScale[2];       /* scale values */
    double  xRange[2];       /* range of x-values */
    double  yRange[2];       /* range of y-values */
    double  zRange[2];       /* range of z-values */
} NcScattered2D;

/* Scatteredd2D options */
typedef enum {OpScattered2DK, OpScattered2DPointsMin, OpScattered2DPointsMax,
    OpScattered2DPointsPerCell, OpScattered2DScalingX, OpScattered2DScalingY,
    OpScattered2DScalingZ, OpScattered2DScaling
} Scattered2DOption;

NcScattered2D DLL_EXPORT *ncScattered2DNew(const char *fileName, const char *varName);
int           DLL_EXPORT  ncScattered2DSetOption(NcScattered2D *data, Scattered2DOption option, ...);
void          DLL_EXPORT  ncScattered2DInit(NcScattered2D *data);
void          DLL_EXPORT  ncScattered2DFree(NcScattered2D *data);
double        DLL_EXPORT  ncScattered2DGet(NcScattered2D *data, double x, double y);

/* * * *       Misc. functions       * * * */

/* get attributes, return default if not available */
double DLL_EXPORT  ncGetAttributeDoubleDefault(int ncF, int ncV, const char *name, double def);
long   DLL_EXPORT  ncGetAttributeLongDefault(int ncF, int ncV, const char *name, long def);
char   DLL_EXPORT *ncGetAttributeTextDefault(int ncF, int ncV, const char *name, const char *def);

/* set attributes */
void DLL_EXPORT ncSetAttributeDouble(int ncF, int ncV, const char *att, double val);
void DLL_EXPORT ncSetAttributeLong(int ncF, int ncV, const char *att, long val);
void DLL_EXPORT ncSetAttributeText(int ncF, int ncV, const char *att, const char *val);


#ifdef  __cplusplus
}
#endif

#endif /* NCDATAREADER2_H */
