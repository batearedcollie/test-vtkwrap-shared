/**************************************/
// Includes
#include "vtkObjectFactory.h"
#include "vtkCube1.h"

/**************************************/
// Definitions



/**************************************/
// Public Methods

// New method
vtkStandardNewMacro(vtkCube1)

// Print self
void vtkCube1::PrintSelf(ostream& os, vtkIndent indent)
{
	os << indent << "vtkCube1:\n";
	this->Superclass::PrintSelf(os, indent.GetNextIndent());
	os << indent << "End vtkCube1" << endl;
}

// Get Data
vtkCube1* vtkCube1::GetData(vtkInformation* info)
{
  return info? vtkCube1::SafeDownCast(info->Get(DATA_OBJECT())) : 0;
}

// Get Data
vtkCube1* vtkCube1::GetData(vtkInformationVector* v, int i)
{
	return vtkCube1::GetData(v->GetInformationObject(i));
}

