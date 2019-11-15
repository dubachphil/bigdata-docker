# BigData with Docker on CentOS 8

## Building
- git clone https://github.com/dubachphil/bigdata-docker.git
- cd bigdata-docker
- sh ./build_images.sh

## Deployment
- cd bigdata-docker
- docker-compose up -d
- Open Webbrowser http://"Host IP Address":9870
  
## Stop System
- docker-compose down
