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

#ifndef NCDATAREADEREA_H
#define NCDATAREADEREA_H

#define DLL_EXPORT __declspec(dllexport)

char DLL_EXPORT  *ncDataReader2Version();

double DLL_EXPORT ncEasyGet1D(const char *fileName, const char *varName, double x);

double DLL_EXPORT ncEasyGetScattered2D(const char *fileName, const char *varName, double x, double y);

void   DLL_EXPORT ncEasyFree();

#define NC_DOUBLE_NOVAL -123456789.0
#define NC_LONG_NOVAL   -123456789
#define NC_STRING_NOVAL ""

double DLL_EXPORT  ncEasyGetAttributeDouble(const char *fileName, const char *varName, const char *attName);
long   DLL_EXPORT  ncEasyGetAttributeLong  (const char *fileName, const char *varName, const char *attName);
char   DLL_EXPORT *ncEasyGetAttributeString(const char *fileName, const char *varName, const char *attName);

int    DLL_EXPORT  ncEasyDumpStatistics(const char *fileName);

#endif /* NCDATAREADEREA_H */
