#ifndef VTKCUBE_1_H_
#define VTKCUBE_1_H_

//Includes
#include "vtkImageData.h"
#include "vtkInformation.h"
#include "vtkInformationVector.h"

#include <iostream>
#include <vector>

// Definitions - VTK/SEISTK defs go up to about 40
#define VTK_CUBE_1 100


/*!
 * Custom implementation of the vtkTracePanelData object
 */
class vtkCube1 : public vtkImageData
{
public:

	//! New method
	static vtkCube1 *New();

	//! Typedef
	vtkTypeMacro(vtkCube1,vtkImageData)

	//! Printself
	void PrintSelf(ostream &os, vtkIndent indent);

	//! From vtkType.h, a handle on what type of vtkDataObject this is.
	int GetDataObjectType() {return VTK_CUBE_1;}

	//! Retrieve an instance of this class from an information object.
	static vtkCube1* GetData(vtkInformation* info);

	//! Retrieve an instance of this class from an information object.
	static vtkCube1* GetData(vtkInformationVector* v, int i=0);

	virtual void CustomMethod1()
	{
		std::cout << "\tCustomMethod called from vtkCube1 " << std::endl;
	}

protected:

	//! Constructor
	vtkCube1(){}
	
	//! Destructor
	~vtkCube1(){}

private:

};


#endif /* VTKCUBE_1_H_ */
