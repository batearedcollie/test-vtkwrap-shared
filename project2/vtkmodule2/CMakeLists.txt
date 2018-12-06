
# Specify sources and library name
set(HDR_FILES vtkCube2.h
                )
set(SRC_FILES vtkCube2.cxx
                )
                
set(LIBNAME stdvtkmodule2)

#######################################
# Building the library
include_directories(BEFORE "${CMAKE_CURRENT_SOURCE_DIR}")


# C++ Libraries are prefixed with MSF
set(LIBNAME "MSF${LIBNAME}")

add_library(${LIBNAME} SHARED ${SRC_FILES})
TARGET_LINK_LIBRARIES(${LIBNAME} 
                                ${project1_LIBRARIES}
                                ${PYTHON_LIBRARIES} 
                                ${VTK_LIBRARIES}
                                )

#######################################
# Installation
install(TARGETS ${LIBNAME} 
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        )

foreach(hdr ${HDR_FILES})
    install(FILES "${hdr}" DESTINATION include)
endforeach()
