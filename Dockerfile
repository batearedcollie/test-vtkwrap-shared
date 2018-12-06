
FROM ubuntu:18.04

###################################################################
# Install some basic pre-requisites
###################################################################
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends  \
    libc6-dev-i386 build-essential gcc g++ gfortran \
    python3-all-dev python3-pip python3-setuptools \
    wget \
    libsm6 xserver-xorg \
    cmake wget git \
    libgl1-mesa-dev libxt-dev libboost-dev && \
    apt-get -y clean

####################################################################
# VTK
####################################################################
RUN wget https://www.vtk.org/files/release/8.1/VTK-8.1.1.tar.gz && \
	tar xvf VTK-8.1.1.tar.gz && \
	rm VTK-8.1.1.tar.gz && \
	mkdir VTK-build && \
	cd VTK-build/ && \
	cmake \
 		-DCMAKE_BUILD_TYPE:STRING=Release \
   		-DVTK_WRAP_PYTHON:BOOL=TRUE \
		-DVTK_WRAP_PYTHON_SIP:BOOL=ON \
  		-DVTK_PYTHON_VERSION:STRING=3 \
   		-DCMAKE_INSTALL_PREFIX=/usr/local/ \
   		-DBUILD_TESTING:BOOL=OFF \
   		-DBUILD_EXAMPLES:BOOL=OFF \
 	/VTK-8.1.1/ && \
   	make install && \
 	cd / && \
 	rm -r VTK-build/ /VTK-8.1.1

####################################################################
# Environment - make sure we pick up python and vtk
####################################################################
ENV PYTHONPATH "${PYTHONPATH}:/usr/local/lib/python3.6/site-packages/"
ENV PYTHONPATH "${PYTHONPATH}:/usr/local/lib/python3.6/dist-packages/"
ENV LD_LIBRARY_PATH "${LD_LIBRARY_PATH}:/usr/local/lib/:/usr/local/lib/python3.6/dist-packages/:/usr/local/lib/python3.6/site-packages/"


####################################################################
# Project 1 - building on VTK
####################################################################
ADD ./project1 /src1
RUN cd /src1 && \
	cmake ./ && \
	make install

####################################################################
# Project 2 - building on Project 1
####################################################################
ADD ./project2 /src2
RUN cd /src2 && \
	cmake ./ && \
	make install
	
####################################################################
# Testing script 
####################################################################
ADD ./test_script.py /
CMD ["python3","/test_script.py"]

