
This project illustrates and issue with VTK python bindings.

We have 2 Projects:

* project1
  * Contains vtkmodule1
    * Extends vtkImageData to define the object vtkCube1
      * Implements a method CustomMethod1
 
* project2
  * Contains vtkmodule2
    * Extends vtkCube1 to define the object vtkCube2
      * Implements a method CustomMethod2

The script `test_script.py`

* Imports vtkmodule1
* Imports vtkmodule2
* Instanciates vtkCube2

The error occurs when we try to acess CustomMethod1 from vtkCube2.
However, if the initial import of vtkmodule1 is removed then this error goes away.

To Run (using docker):

	$ docker build -t test . && docker run -it test 
	
Or 

	$ docker run -it batearedcollie/vtkwrappingissue
	
**UPDATE** 

Issue has been fixed. See latest commit.  
Solution was to chnage the pythonD libraries from a static to a shared library  which are linked to by the python modules. 
Note this solution is probably system dependent and might be specific to Ubuntu. 