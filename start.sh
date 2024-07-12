# /bin/bash
set -eux
# group/repo/version
# 记录当前目录
current_path=`pwd`
#下载GAI代码库
if [ ! -d "./SuperImageGenerationAI" ];then
git clone https://github.com/SuperImageAI/SuperImageGenerationAI
fi
#下载模型到当前目录
if [ ! -d "./superImageAI" ];then
git lfs install
git clone https://hf-mirror.com/DeepBrainChainAI/superImageAI
fi
# 将模型文件mv到SuperImageGenerationAI的superImageService空间
if  [ ! -d $current_path/SuperImageGenerationAI/superImageService/models ];then
mv -f $current_path/superImageAI/models  $current_path/SuperImageGenerationAI/superImageService
fi

image_name=test:wj02
container_name=wjtest

PORT=8080

MODLE_DIR=$current_path

docker run -d -it --name="cuda" --gpus "device=0" -p $PORT:1080  \
-v $MODLE_DIR:/mnt --name $container_name $image_name