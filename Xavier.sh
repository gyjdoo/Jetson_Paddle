sudo apt-get update
sudo apt-get upgrade

sudo apt-get install gcc g++ make cmake git vim unrar python3 python3-dev python3-venv python3-pip swig wget patchelf libopencv-dev 
sudo apt-get install libfreetype6-dev libjpeg-dev zlib1g-dev liblapack-dev  gfortran libpng-dev  
sudo pip3 install virtualenv cython
sudo pip3 install numpy protobuf wheel setuptools 


#install NCCL

git clone https://github.com/NVIDIA/nccl.git
cd nccl
make -j4
sudo make install


sudo apt-get install \
    python3-pip \
    gcc \
    g++ \
    make \
    cmake \
    git \
    vim \
    unrar \
    python3-dev \
    python3-pip \
    swig \
    wget \
    patchelf \
    libopencv-dev
    
sudo -H pip3 install numpy protobuf wheel setuptools
    
echo "export PATH=/usr/local/cuda/bin:\$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda:\$LD_LIBRARY_PATH" >> ~/.bashrc

# Increase the number of files open limit to 102400. It is required to cope up with 'Too many files open' issue.
ulimit -n 102400

#Swap space is really helpful on Xavier NX

sudo fallocate -l 5G /var/swapfile
sudo chmod 600 /var/swapfile
sudo mkswap /var/swapfile
sudo swapon /var/swapfile
sudo bash -c 'echo "/var/swapfile swap swap defaults 0 0" >> /etc/fstab'

#Start compiling:
sudo nvpmodel -m 0 && sudo jetson_clocks #(max power mode)
git clone https://github.com/PaddlePaddle/Paddle.git
cd Paddle
mkdir build
cd build
sudo cmake -D PY_VERSION=3.8 \
        -D WITH_CONTRIB=OFF \
        -D WITH_MKL=OFF \
        -D WITH_MKLDNN=OFF \
        -D WITH_NV_JETSON=ON \
        -D WITH_XBYAK=OFF \
        -D WITH_GPU=ON \
        -D WITH_TESTING=OFF \
        -D ON_INFER=ON \
        -D CMAKE_CUDA_COMPILER=/usr/local/cuda-11.4/bin/nvcc \
        -D CMAKE_BUILD_TYPE=Release ..
        
sudo make -j4
