#!/bin/bash
PORT=4200
echo "Go to https://localhost:$PORT to see Stata in a web browser"
docker run  \
 --rm -it \
 -v $(pwd)/../../AEA/docker-stata/stata.lic.14:/usr/local/stata14/stata.lic  \
 -v $(pwd)/code:/code   \
 -v $(pwd)/data:/data   \
 -v $(pwd)/results:/results \
 -p $PORT:4200 larsvilhuber/siab 


