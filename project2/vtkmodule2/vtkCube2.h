
#ifndef VTKCUBE_2_H_
#define VTKCUBE_2_H_

//Includes
#include "vtkCube1.h"

// Definitions - VTK defs go up to about 40
#define VTK_CUBE_2 101


/*!
 * Custom implementation of the vtkTracePanelData object
 */
class vtkCube2 : public vtkCube1
{
public:

	//! New method
	static vtkCube2 *New();

	//! Typedef
	vtkTypeMacro(vtkCube2,vtkCube1)

	//! Printself
	void PrintSelf(ostream &os, vtkIndent indent);

	//! From vtkType.h, a handle on what type of vtkDataObject this is.
	int GetDataObjectType() {return VTK_CUBE_2;}

	//! Retrieve an instance of this class from an information object.
	static vtkCube2* GetData(vtkInformation* info);

	//! Retrieve an instance of this class from an information object.
	static vtkCube2* GetData(vtkInformationVector* v, int i=0);


	virtual void CustomMethod2()
	{
		std::cout << "\tCustomMethod called from vtkCube2 " << std::endl;
	}

protected:

	//! Constructor
	vtkCube2(){}
	
	//! Destructor
	~vtkCube2(){}

private:

};


#endif /* VTKCUBE_2_H_. */
