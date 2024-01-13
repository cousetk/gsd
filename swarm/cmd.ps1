multipass shell node1

git --version
git clone https://github.com/cousetk/gsd.git

cd gsd/swarm
docker image build -t cousetk/gsd:swarm2023 .

docker image ls

docker image push cousetk/gsd:swarm2023
docker login

docker stack deploy -c compose.yml counter
docker stack ls
docker stack services counter
docker stack ps counter

vi compose.yml

multipass delete node5

docker stack rm counter

multipass delete node1 node2 node3 node4 node5
multipass purge
multipass list

docker swarm leave --force


