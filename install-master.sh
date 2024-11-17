#!/bin/bash
echo "Configurando o MASTER do docker swarm"
docker swarm init --advertise-addr 192.168.1.210
docker swarm join-token worker | grep docker > /vagrant/worker.sh