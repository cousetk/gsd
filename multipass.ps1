multipass --version
multipass get local.privileged-mounts
multipass set local.privileged-mounts=Yes

Stop-Service Multipass
New-Item -ItemType Directory -Path "D:\Hyper-V\Multipass"
Copy-Item -Path "C:\ProgramData\Multipass\*" -Destination "D:\Hyper-V\Multipass" -Recurse
# Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
setx /M MULTIPASS_STORAGE "D:\Hyper-V\Multipass"



multipass find

multipass launch docker --name node1

multipass delete node1
multipass delete --purge node1

multipass info node1

multipass shell node1
docker -v

docker swarm init --advertise-addr 172.31.197.250

# ubuntu@node1:~$ docker swarm init --advertise-addr 172.31.197.250
# Swarm initialized: current node (gyq5ss426obvtauqua44zoax7) is now a manager.

# To add a worker to this swarm, run the following command:

#     docker swarm join --token SWMTKN-1-5tasqr2t2ohxnf5top9waetl61kfls1a5didb47encfdx7w2jn-e7008efm1rgmndfqv0huqhzcy 172.31.197.250:2377

# To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

# ubuntu@node1:~$ docker swarm join-token manager
# To add a manager to this swarm, run the following command:

#     docker swarm join --token SWMTKN-1-5tasqr2t2ohxnf5top9waetl61kfls1a5didb47encfdx7w2jn-bjohwv5f0u35gw5tx5kifqqi5 172.31.197.250:2377

# ubuntu@node1:~$

docker swarm join-token worker

# ubuntu@node3:~$ docker swarm join-token worker
# To add a worker to this swarm, run the following command:

#     docker swarm join --token SWMTKN-1-5tasqr2t2ohxnf5top9waetl61kfls1a5didb47encfdx7w2jn-e7008efm1rgmndfqv0huqhzcy 172.31.197.137:2377

# ubuntu@node3:~$


docker node ls
docker node update --availability drain node1
docker node update --availability drain node2
docker node update --availability drain node3

docker service create --name web -p 8080:8080 --replicas 3 nigelpoulton/gsd:web2023
docker service ls
docker container ls
docker service ps web

multipass list

docker service scale web=10

docker container ls


docker container rm cf982a1b4942 e3d9557c1455 3537b53731a6 88e1160e8c5a e316934cd45c -f


docker service rm web

