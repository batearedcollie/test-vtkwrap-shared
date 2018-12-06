

# Comment out this line and it works
from stdpywrap1.vtkmodule1 import vtkCube1

# Second module import
print("\n**************\nStandard VTK wrapping object 2\n**************\n")
from stdpywrap2.vtkmodule2 import vtkCube2
cc = vtkCube2()
print('cc.__vtkname__=',cc.__vtkname__)
#print('dir=',cc.__dir__())
print("Calling Custom Method:")
cc.CustomMethod1()
cc.CustomMethod2()