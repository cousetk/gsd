docker --version

docker image build -t cousetk/gsd:ctr2023 .

docker image ls

docker image push cousetk/gsd:ctr2023

# docker buildx build `
#     --platform linux/arm64/v8,linux/amd64 `
#     --push `
#     --tag cousetk/gsd:ctr2023 `
#     .

docker image rm cousetk/gsd:ctr2023

docker container run -d --name web -p 8000:8080 cousetk/gsd:ctr2023

docker container ls
docker container ls -a

docker container stop web
docker container start web
docker container rm web

docker container run -it --name test alpine sh
docker container rm test -f
