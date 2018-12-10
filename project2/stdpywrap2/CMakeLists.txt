# Installation directory
set(PYTHON_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/dist-packages/stdpywrap2")

# Module list to work though - these will be built for python compatibility
set(PYTHON_MODULES "vtkmodule2")

# Modules that will be linked but not built for python
#set(LINKED_MODULES "" )

# Listof VTK modules used
set(VTK_MODULES_USED vtkCommonDataModel vtkCommonCore vtkCommonExecutionModel) 
set(VTK_PYTHOND_LIBS)
foreach(TMP_LIB ${VTK_MODULES_USED})  
  set(pythonD ${TMP_LIB}PythonD)
  set(VTK_PYTHOND_LIBS ${VTK_PYTHOND_LIBS} ${pythonD})
endforeach()

# Add the includes
foreach(MOD ${PYTHON_MODULES})
    include_directories("${CMAKE_CURRENT_SOURCE_DIR}/../${MOD}/")
endforeach()

#Dummy target for all python builds
add_custom_target(pythonWrapping ALL)

# Make sure that -fPIC is included in the CXX_FLAGS and C_FLAGS
add_compile_options(-fPIC)
add_compile_options(-std=c++11)

# Work through modules and create python bindings
foreach(MOD ${PYTHON_MODULES})

    # Get a list of the source files for this module
    file(GLOB SRC_FILES "${CMAKE_CURRENT_SOURCE_DIR}/../${MOD}/*.cxx")

    # Wrapping    
    vtk_wrap_python3(${MOD} PY_SRC_FILES "${SRC_FILES}")
    
    # PythonD target
    add_library(${MOD}PythonD SHARED ${PY_SRC_FILES} ${SRC_FILES})
    #add_library(${MOD}PythonD ${PY_SRC_FILES} ${SRC_FILES})
    target_link_libraries(${MOD}PythonD    
                            vtkWrappingPythonCore 
                            )

    # Shared library target
    add_library(${MOD} MODULE ${MOD}Init.cxx)
    
    #
    # FIX - we have to link against the shared pythonD libraries not the static libraries
    #       we will also install these in /sur/local not in the python module.
    #
#    target_link_libraries(${MOD} 
#                        ${MOD}PythonD  
#                        ${project1_PYTHOND_STATIC_LIBRARIES}
#                        ${VTK_PYTHOND_LIBS}
#                        )
    target_link_libraries(${MOD} 
                        ${MOD}PythonD  
                        ${project1_PYTHOND_SHARED_LIBRARIES}
                        ${VTK_PYTHOND_LIBS}
                        )
          
    set_target_properties(${MOD} PROPERTIES PREFIX "")

    # Add a dependecy to the main target
    add_dependencies(pythonWrapping ${MOD})

    # Install targets
    install(TARGETS ${MOD} 
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION ${PYTHON_INSTALL_DIR}
        ARCHIVE DESTINATION ${PYTHON_INSTALL_DIR}
        )

    install(TARGETS ${MOD}PythonD 
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/
        ARCHIVE DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/
        )


    # Append to previous modules
    list(APPEND PREVMODS ${MOD}PythonD)
            
endforeach()

install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/__init__.py DESTINATION ${PYTHON_INSTALL_DIR})


    
    