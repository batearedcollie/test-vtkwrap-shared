
# set the required version
cmake_minimum_required(VERSION 3.10)

# Create a project
project(project2)

#######################################
# Add to the module path
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/CMake ${CMAKE_MODULE_PATH})

#######################################
# Python Executable
find_package(PythonInterp 3 REQUIRED)
message("PYTHONINTERP_FOUND = ${PYTHONINTERP_FOUND}")
message("PYTHON_EXECUTABLE = ${PYTHON_EXECUTABLE}")
message("PYTHON_VERSION_STRING = ${PYTHON_VERSION_STRING}")

#######################################
# VTK
find_package(VTK REQUIRED)
include(${VTK_USE_FILE})

#######################################
# project1
find_package(project1 REQUIRED)
include_directories("${project1_INCLUDE_DIR}")

#######################################
# Python and vtk wrapping
find_package(PythonLibs 3.6 REQUIRED)
include(vtkWrapPython)
include_directories("${PYTHON_INCLUDE_PATH}")

#######################################
# build modules
add_subdirectory(vtkmodule2)

#######################################
# Install the python module

# Install logic 
set(INSTALL_CODE "execute_process(")
set(INSTALL_CODE "${INSTALL_CODE} COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/setup.py")
set(INSTALL_CODE "${INSTALL_CODE} install --prefix=${CMAKE_INSTALL_PREFIX} ")
set(INSTALL_CODE "${INSTALL_CODE} WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}")
set(INSTALL_CODE "${INSTALL_CODE} )")
message("INSTALL_CODE = ${INSTALL_CODE}")
install(CODE "${INSTALL_CODE}")

#######################################
# Standard python wrapping
add_subdirectory(stdpywrap2)



