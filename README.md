# Calibrated Stereo Vision System

This is a **MATLAB project** that objective is to create a **disparity map** from a real scene, captured by a pair of cameras, **using calibration** (by the Zhang method). The disparity map is a map which shows the deep of elements presents in a scene. 

## Utilized Materials

- **MATLAB R2014b**, x64 version, available on: https://www.mathworks.com/products/matlab.html.
- A **calibration pattern**, printed in a plain surface.
- A **3D Webcam**, e.g. Minoru3D, available on: http://www.minoru3d.com/.

## Configuring MATLAB

1) Open MATLAB;
2) Type the command _supportPackageInstaller_ on MATLAB console and press Enter;
3) Once the Package Installer Manager is open, find these two libraries to install:
	- _USB Webcam_;
	- _OS Generic Video Interface_;
4) Set the MATLAB path to the folder that contains the project (probably the folder with this file);
5) Find the _ID_ (is a number, generally 1 and 2 to left and right cameras) of each webcam tu be used and change the values of _LEFT_CAM_/_RGHT_CAM_ with the _ID_ of each one. If you want to do a initial calibration, change the value of _USE_ZHANG_CL_ to 1;
6) Finally, you can run the _main.m_ script inside MATLAB IDE.

You will probably need a **MATLAB account** to **download and install** these packages (it's free to create).

## Licence

The available source codes here are under the MIT License (see the attached file _LICENSE_ for more details). Any questions can be submitted to my email: carloswdecarvalho@outlook.com.
