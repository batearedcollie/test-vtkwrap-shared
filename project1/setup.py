'''
Set up module 
'''

from distutils.core import setup
from setuptools.command.install import install
from setuptools.command.build_py import build_py


setup(
    name ='stdpywrap1',
    version ='1.0',
    description= 'test Python bindings',
    author ='',
    author_email = '',
    packages=['vtkmodule1'],
    exclude=[]    
    )
