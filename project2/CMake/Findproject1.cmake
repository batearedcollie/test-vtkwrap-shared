##################################################
# Work out the  install directory
set(project1_INSTALL_DIR "/usr/local")

message(STATUS "project1_INSTALL_DIR = ${project1_INSTALL_DIR}")

##################################################
# Include paths
find_path(project1_INCLUDE_DIR
  NAMES
  vtkCube1.h
  PATHS
  "${project1_INSTALL_DIR}/include"
)
message(STATUS "project1_INCLUDE_DIR = ${project1_INCLUDE_DIR}")

##################################################
# Libraries to link against
set(LIBLIST "vtkmodule1" )
foreach(LIB ${LIBLIST})

    # Find the C++ libraries
    find_library(project1_LIB_${LIB} 
        NAMES "TSTstd${LIB}" 
        PATHS ${project1_INSTALL_DIR}/lib)    
   
    if("${project1_LIB_${LIB}}" STREQUAL "project1_LIB_${LIB}-NOTFOUND")
        message(FATAL "Could not find project1 library ${LIB}")
    endif()
    list(APPEND project1_LIBRARIES "${project1_LIB_${LIB}}")
    
    # Find the python libraries
    ## shared .so
    find_path(SSLIB_PYTHON_${LIB} 
        NAMES "${LIB}.so" 
        PATHS "${project1_INSTALL_DIR}/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/dist-packages/stdpywrap1" 
               "${project1_INSTALL_DIR}/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages/stdpywrap1" )    
    
    if("${SSLIB_PYTHON_${LIB}}" STREQUAL "SSLIB_PYTHON_${LIB}-NOTFOUND")
        message(FATAL " Could not find project1 library ${LIB}")
    endif()
    list(APPEND project1_PYTHON_SHARED_LIBRARIES "${SSLIB_PYTHON_${LIB}}/${LIB}.so")    

    ## static PyhtonD.a
    find_path(SSLIB_PYTHOND_${LIB} 
        NAMES "lib${LIB}PythonD.a" 
        PATHS "${project1_INSTALL_DIR}/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/dist-packages/stdpywrap1" 
               "${project1_INSTALL_DIR}/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages/stdpywrap1"  )    

    if("${SSLIB_PYTHOND_${LIB}}" STREQUAL "SSLIB_PYTHOND_${LIB}-NOTFOUND")
        message(FATAL " Could not find SeisTK library ${LIB}")
    endif()
    list(APPEND project1_PYTHOND_STATIC_LIBRARIES "${SSLIB_PYTHOND_${LIB}}/lib${LIB}PythonD.a") 

    
endforeach()

message(STATUS "project1_LIBRARIES = ${project1_LIBRARIES}")
message(STATUS "project1_PYTHON_SHARED_LIBRARIES = ${project1_PYTHON_SHARED_LIBRARIES}")
message(STATUS "project1_PYTHOND_STATIC_LIBRARIES = ${project1_PYTHOND_STATIC_LIBRARIES}")

find_package_handle_standard_args(project1 DEFAULT_MSG 
                                project1_INCLUDE_DIR 
                                project1_LIBRARIES 
                                project1_PYTHON_SHARED_LIBRARIES
                                project1_PYTHOND_STATIC_LIBRARIES)
mark_as_advanced(project1_INCLUDE_DIR project1_LIBRARIES )

