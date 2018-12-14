# Calibrated Stereo Vision System

This is a **MATLAB project** that objective is to create a **disparity map** from a real scene, captured by a pair of cameras, **using calibration** (by the Zhang method). The disparity map is a map which shows the deep of elements presents in a scene. 

## Utilized Materials

- **MATLAB R2014b**, x64 version, available on: https://www.mathworks.com/products/matlab.html.
- A **calibration pattern**, printed in a plain surface.
- A **3D Webcam**, e.g. Minoru3D, available on: http://www.minoru3d.com/.

## Configuring MATLAB

1) Open MATLAB;

2) Type the command `supportPackageInstaller` on MATLAB console and press Enter;

3) Once the _Package Installer Manager_ is open, find these two libraries to install:
	- `USB Webcam`;
	- `OS Generic Video Interface`;

4) Set the MATLAB path to the folder that contains the project (probably the folder with this file);

5) Find the `ID` (is a number, generally 1 and 2 to left and right cameras) of each webcam tu be used and change the values of `LEFT_CAM`/`RGHT_CAM` with the `ID` of each one. If you want to do a initial calibration, change the value of `USE_ZHANG_CL` to 1;

6) Finally, you can run the `main.m` script inside the MATLAB IDE.

You will probably need a **MATLAB account** to **download and install** these packages (it's free to create).

## License

The available source codes here are under the MIT License (see the attached file `LICENSE` for more details). Any questions can be submitted to my email: carloswdecarvalho@outlook.com.
