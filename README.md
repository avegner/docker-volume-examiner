# docker-volume-examiner
Simple tool to examine content of a local docker volume

# Usage
```bash
git clone https://github.com/avegner/docker-volume-examiner.git
cd docker-volume-examiner
./examine-volume.sh <volume-name>
```

# How Does It Work?
* minimal Alpine Linux image is used as a base
* local volume is read-only mounted to `/ro-volume`
* Busybox tools can be used to examine volume content

# Docker Configuration
You may need to perform post-installation configuration for Docker to eliminate usage of sudo. [Here](https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user#manage-docker-as-a-non-root-user) are the instructions.
