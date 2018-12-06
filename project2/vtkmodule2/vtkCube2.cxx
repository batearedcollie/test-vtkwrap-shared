/**************************************/
// Includes
#include "vtkObjectFactory.h"
#include "vtkCube2.h"

/**************************************/
// Definitions



/**************************************/
// Public Methods

// New method
vtkStandardNewMacro(vtkCube2)

// Print self
void vtkCube2::PrintSelf(ostream& os, vtkIndent indent)
{
	os << indent << "msfTraces:\n";
	this->Superclass::PrintSelf(os, indent.GetNextIndent());
	os << indent << "End msfTraces" << endl;
}

// Get Data
vtkCube2* vtkCube2::GetData(vtkInformation* info)
{
  return info? vtkCube2::SafeDownCast(info->Get(DATA_OBJECT())) : 0;
}

// Get Data
vtkCube2* vtkCube2::GetData(vtkInformationVector* v, int i)
{
	return vtkCube2::GetData(v->GetInformationObject(i));
}

