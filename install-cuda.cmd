@echo off
rem stolen from https://github.com/willyd/appveyor-cuda-test - thanks man
echo Downloading CUDA toolkit 8
appveyor DownloadFile  https://developer.nvidia.com/compute/cuda/8.0/prod/local_installers/cuda_8.0.44_windows-exe -FileName cuda_8.0.44_windows.exe
echo Installing CUDA toolkit 8
cuda_8.0.44_windows.exe -s compiler_8.0 ^
                           cublas_8.0 ^
                           cublas_dev_8.0 ^
                           cudart_8.0 ^
                           curand_8.0 ^
                           curand_dev_8.0

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