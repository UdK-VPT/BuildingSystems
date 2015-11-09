/**
* @file Modelica3D.h
* @brief
* Provides functions allowing Modelica to create and visualize
* 3d objects in an external renderer or file writers.
*/

///@name Constructors and destructors for Modelica external object
///@{

/**
* @brief For setup, an external object is used
* @details The external objects are instantiated quite at the beginning
*  and their constructor called before the simulation starts.
* @param  logLevel  The loglevel for debugging output
*                    (0=none, 1=HighLevel, 2=MidLevel, 3=LowLevel)
* @param  send      If false, no network packets are send
* @param  rawFile   If true a packet dump M3D file will be written
* @return           A setup object
*/
void *M3D_New_Setup(int logLevel,int send, int rawFile);

/**
* @brief Destructor for setup
* @details This function should only be called in the destructor of an modelica
*           setup object.
* @param id         Unique id.
*/
void  M3D_Del_Setup(void *setup);

/**
* @brief For output configuration, an external object is used
* @details The external objects are instantiated quite at the beginning
*  and their constructor called before the simulation starts.
* @param  waitForSimulation  Start rendering when the simulation finished
* @param  minimalGUI         Use a view with minimal GUI
* @param  playAnim           Automatically play animation when simulation finished
* @param  renderAvi          Render simulation intpo an AVI file
* @param  aviPath            Pathname and prefix for the avi movie
* @return                    A config object
*/
void *M3D_New_Config(int waitForSimulation, int minimalGui, int playAnim, int renderAvi, const char *aviPath);

/**
* @brief Removes the config object
* @details This function should only be called in the destructor of
*  an modelica output object.
* @param id     Unique id.
*/
void  M3D_Del_Config(void *config);

/**
* @brief Initializes a unique id for 3D object management.
* @details The unique id is a parameter to all Modelica3d functions.
*  This function should only be called in the constructor of
*  an modelica external object.
* @param  name      Optional name (up to 12 chars in [a-z,A-Z,0-9] ).
* @return           The unique id
*/
void *M3D_New_ID(const char *name);

/**
* @brief Removes the unique id
* @details This function should only be called in the destructor of
*  an modelica external object.
* @param id     Unique id.
*/
void  M3D_Del_ID(void *objId);
///@}


///@name Modelica 3d geometric object creation
///@{

/**
* @brief Creates a 3D sphere object.
* @param objId      Objects unique id
* @param diameter   The diameter of the sphere.
*/
int M3D_New_Sphere(void *objId, double diameter);

/**
* @brief Creates a 3D cube object.
* @param objId      Objects unique id
* @param size       Length of the cube sides
*/
int M3D_New_Cube(void *id, double size);

/**
* @brief Creates a 3D box object.
* @param objId      Objects unique id
* @param l          Length of the box
* @param w          Width of the box
* @param h          Height of the box
*/
int M3D_New_Box(void *objId, double l, double w, double h);

/**
* @brief Creates a 3D cylinder object.
* @param objId      Objects unique id
* @param diameter   The diameter of the cylinder
* @param length     The Length of the cylinder
*/
int M3D_New_Cylinder(void *objId, double diameter, double length);

/**
* @brief Creates a 3D cone object.
* @param objId      Objects unique id
* @param diameter   The diameter of the cone
* @param length     The Length of the cone
*/
int M3D_New_Cone(void *objId, double diameter, double length);

/**
* @brief Creates a square plane object.
* @param objId      Objects unique id
* @param length     The length of the plane sides
*/
int M3D_New_Plane(void *objId, double length);

/**
* @brief Creates a group object that can contain other 3D objects
*  to build object hierarchies. The group itself has no graphical
*  representation
* @param objId      Objects unique id.
*/
int M3D_New_Group(void *objId);

/**
* @brief Creates a planar 3D text object.
* @param objId      The unique ID of the 3D object
* @param info       The string of the text
*/
int M3D_New_Text(void *objId, const char* info);

/**
* @brief Loads an custom 3D object into the scene..
* @details A detailed 3D modell will be loaded into the visulization tool.
*  The loaded modell will be packed in a group and can only be modified by the
*  objectId.
* @param objId              The unique ID of the 3D object
* @param filePathAndName    The filepath and name of the external file
*/
int M3D_New_Custom_Mesh(void *objId, const char* filePathAndName);

/**
* @brief Creates a camera object (looking in +z direction)
* @param objId      Objects unique id.
* @param fov        The field of view
*/
int M3D_New_Camera(void *objId, double fov);

/**
* @brief Creates a light object
* @param objId          Objects unique id.
* @param lightType      0=PointLight, 1=DirectionalLight, 2=SportLight
* @param r              Value of RED   (between 0 and 1)
* @param g              Value of GREEN (between 0 and 1)
* @param b              Value of BLUE  (between 0 and 1)
*/
int M3D_New_Light(void *objId, int lightType, double r, double g, double b);

///@}


///@name Functions working on M3D geometric objects
///@{

/**
* @brief Link a 3D object to a parent object.
* @details The child object is removed from the hierarchy and added back as
*  child of the parent object. An object can only be child of one parent.
*
*  The hierarchy can not be changed during the simulation - therefore
*  there is no timestamp parameter.
* @param childId    The unique ID of the (existing) 3D object
* @param parentId   The unique ID of the (existing) parent object
*/
int M3D_Link_To_Object(void *childId, void *parentId );

/**
* @brief Move / animate a 3D object to specific position at the given frame.
* @param objId      The unique ID of the (existing) 3D object
* @param x          X-coordinate of the new position
* @param y          Y-coordinate of the new position
* @param z          Z-coordinate of the new position
* @param frame      Frame number (starting with 1)
*/
int M3D_Translate(void *objId, double x, double y, double z, int frame);

/**
* @brief Rotate / animate a 3D object to specific degrees at the given frame.
* @details The angles are given in degrees.
* @param objId      The unique ID of the (existing) 3D object.
* @param x          X-angle of the object
* @param y          Y-angle of the object
* @param z          Z-angle of the object
* @param frame      Frame number (starting with 1)
*/
int M3D_Rotate(void *objId, double x, double y, double z, int frame);

/**
* @brief Scale / animate a 3D object to specific size at the given frame.
* @details Zero or negative scaling may result in rendering errors depending
*  on the visualization software used.
* @param objId      The unique ID of the (existing) 3D object.
* @param x          X-scaling of the object
* @param y          Y-scaling of the object
* @param z          Z-scaling of the object
* @param frame      Frame number (starting with 1)
*/
int M3D_Scale(void *objId, double x, double y, double z, int frame);

///@}


///@name Functions for  M3D material objects
///@{

/**
* @brief Creates a new material object.
* @details
* @param objId      The unique ID of the (existing) 3D object
* @param r          Value of RED   (between 0 and 1)
* @param g          Value of GREEN (between 0 and 1)
* @param b          Value of BLUE  (between 0 and 1)
*/
int M3D_New_Material(void *materialId, double r, double g, double b);

/**
* @brief Assigns a material to a geometric object.
* @details
* @param objId      The unique ID of the (existing) geometric object
* @param matId      The unique ID of the (existing) material object
*/
int M3D_Set_Object_Material(void *objId, void *matId);

/**
* @brief Set material color at a given frame.
* @details
* @param matId      The unique ID of the (existing) material object
* @param r          Value of RED   (between 0 and 1)
* @param g          Value of GREEN (between 0 and 1)
* @param b          Value of BLUE  (between 0 and 1)
* @param frame      Frame number (starting with 1)
*/
int M3D_Set_Material_Color(void *matId, double r, double g, double b, int frame);

///@}

/**
* @brief Set the time of a given frame
* @param frame      Frame number (starting with 1)
* @param time       Time at given frame
*/
int M3D_Set_Frame_Time(int frame, double time);
