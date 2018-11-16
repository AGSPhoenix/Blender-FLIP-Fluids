@echo off
rem stolen from https://github.com/willyd/appveyor-cuda-test - thanks man
echo Downloading CUDA toolkit 10
appveyor DownloadFile  https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda_10.0.130_411.31_win10 -FileName cuda_10.0.130_411.31_win10.exe
echo Installing CUDA toolkit 10
cuda_10.0.130_411.31_win10.exe -s nvcc_10.0^
 cuobjdump_10.0^
 cupti_10.0^
 cublas_10.0^
 cublas_dev_10.0^
 cudart_10.0^
 cufft_10.0^
 cufft_dev_10.0^
 curand_10.0^
 curand_dev_10.0^
 cusolver_10.0^
 cusolver_dev_10.0^
 cusparse_10.0^
 cusparse_dev_10.0

dir "%ProgramFiles%"
dir "C:\Program Files"
dir "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA"
dir "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v8.0"
dir "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v8.0\bin"

if NOT EXIST "%ProgramFiles%\NVIDIA GPU Computing Toolkit\CUDA\v8.0\bin\cudart64_80.dll" ( 
echo "Failed to install CUDA"
exit /B 1
)

set PATH=%ProgramFiles%\NVIDIA GPU Computing Toolkit\CUDA\v8.0\bin;%ProgramFiles%\NVIDIA GPU Computing Toolkit\CUDA\v8.0\libnvvp;%PATH%

nvcc -V