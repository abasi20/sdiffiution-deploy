# /bin/bash

#启动interface
if [ ! -d "/mnt/log" ];then
    mkdir -p /mnt/log
fi

#启动interface

cd /mnt/SuperImageGenerationAI/superImageService &&nohup python launch.py --nowebui  --port 1080 --listen --api --xformers --device-id 0 >/mnt/log/lauch_server.log 2>&1 &
cd /mnt/SuperImageGenerationAI &&nohup python interface_job.py > /mnt/log/interface_log.log 2>&1 &
tail -f /mnt/log/lauch_server.log