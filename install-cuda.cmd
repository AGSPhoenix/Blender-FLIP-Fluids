@echo off
rem stolen from https://github.com/willyd/appveyor-cuda-test - thanks man
echo Downloading CUDA toolkit 10
appveyor DownloadFile  https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda_10.0.130_411.31_win10 -FileName cuda_10.0.130_411.31_win10.exe
echo Installing CUDA toolkit 10
cuda_10.0.130_411.31_win10.exe -s nvcc_10.0

dir "%ProgramFiles%"
dir "C:\Program Files"
dir "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA"
dir "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.0"
dir "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.0\bin"

set PATH=%ProgramFiles%\NVIDIA GPU Computing Toolkit\CUDA\v10.0\bin;%PATH%

nvcc -V