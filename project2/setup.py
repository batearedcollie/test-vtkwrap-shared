'''
Set up module 
'''

#from distutils.command.build_py import build_py as _build_py
from distutils.core import setup
from setuptools.command.install import install
from setuptools.command.build_py import build_py


setup(
    name ='stdpywrap2',
    version ='1.0',
    description= '',
    author ='',
    author_email = '',
    packages=['vtkmodule2'],
    exclude=[]    
    )
