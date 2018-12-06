
# Specify sources and library name
set(HDR_FILES vtkCube1.h
                )
set(SRC_FILES vtkCube1.cxx
                )
                
set(LIBNAME stdvtkmodule1)

#######################################
# Building the library
include_directories(BEFORE "${CMAKE_CURRENT_SOURCE_DIR}")

# C++ Libraries are prefixed with MSF
set(LIBNAME "TST${LIBNAME}")

add_library(${LIBNAME} SHARED ${SRC_FILES})
TARGET_LINK_LIBRARIES(${LIBNAME} 
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
