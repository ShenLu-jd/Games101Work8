# Install script for directory: D:/Code/Games101WorksProjects/Games101Work8/Games101Work8/CGL/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/CGL")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/Code/Games101WorksProjects/Games101Work8/Games101Work8/CGL/build/src/Debug/CGL.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/Code/Games101WorksProjects/Games101Work8/Games101Work8/CGL/build/src/Release/CGL.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/Code/Games101WorksProjects/Games101Work8/Games101Work8/CGL/build/src/MinSizeRel/CGL.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/Code/Games101WorksProjects/Games101Work8/Games101Work8/CGL/build/src/RelWithDebInfo/CGL.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/CGL" TYPE FILE FILES
    "D:/Code/Games101WorksProjects/Games101Work8/Games101Work8/CGL/src/CGL.h"
    "D:/Code/Games101WorksProjects/Games101Work8/Games101Work8/CGL/src/vector2D.h"
    "D:/Code/Games101WorksProjects/Games101Work8/Games101Work8/CGL/src/vector3D.h"
    "D:/Code/Games101WorksProjects/Games101Work8/Games101Work8/CGL/src/vector4D.h"
    "D:/Code/Games101WorksProjects/Games101Work8/Games101Work8/CGL/src/matrix3x3.h"
    "D:/Code/Games101WorksProjects/Games101Work8/Games101Work8/CGL/src/matrix4x4.h"
    "D:/Code/Games101WorksProjects/Games101Work8/Games101Work8/CGL/src/quaternion.h"
    "D:/Code/Games101WorksProjects/Games101Work8/Games101Work8/CGL/src/complex.h"
    "D:/Code/Games101WorksProjects/Games101Work8/Games101Work8/CGL/src/color.h"
    "D:/Code/Games101WorksProjects/Games101Work8/Games101Work8/CGL/src/osdfont.h"
    "D:/Code/Games101WorksProjects/Games101Work8/Games101Work8/CGL/src/osdtext.h"
    "D:/Code/Games101WorksProjects/Games101Work8/Games101Work8/CGL/src/viewer.h"
    "D:/Code/Games101WorksProjects/Games101Work8/Games101Work8/CGL/src/base64.h"
    "D:/Code/Games101WorksProjects/Games101Work8/Games101Work8/CGL/src/tinyxml2.h"
    "D:/Code/Games101WorksProjects/Games101Work8/Games101Work8/CGL/src/renderer.h"
    )
endif()

