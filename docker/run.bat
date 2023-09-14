docker run --rm -ti ^
           -v %~dp0/..:$WORKDIR ^
           $IMAGE:latest ^
           %*
