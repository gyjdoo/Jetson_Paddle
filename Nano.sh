
# check for updates
 sudo apt-get update
 sudo apt-get upgrade
# install dependencies
 sudo apt-get install cmake wget
 sudo apt-get install patchelf
# download Paddle Lite
 git clone https://github.com/PaddlePaddle/Paddle-Lite.git
 cd Paddle-Lite
# build Paddle Lite (± 2 Hours)
 ./lite/tools/build.sh \
  --build_cv=ON \
  --build_extra=ON \
  --arm_os=armlinux \
  --arm_abi=armv8 \
  --arm_lang=gcc \
  cuda \
  tiny_publish
# copy the headers and library to /usr/local/
 sudo mkdir -p /usr/local/include/paddle-lite
 sudo cp -r build.lite.armlinux.armv8.gcc/inference_lite_lib.armlinux.armv8/cxx/include/*.* /usr/local/include/paddle-lite

 sudo mkdir -p /usr/local/lib/paddle-lite
 sudo cp -r build.lite.armlinux.armv8.gcc/inference_lite_lib.armlinux.armv8/cxx/lib/*.* /usr/local/lib/paddle-lite
