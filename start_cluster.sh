#!/bin/bash
docker-compose up -d --scale datanode=3 --scale spark-worker=3 --scale nodemanager=3
docker-compose ps
