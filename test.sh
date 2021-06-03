#!/bin/bash
docker run  \
 --rm -v $(pwd)/../../AEA/docker-stata/stata.lic.14:/usr/local/stata14/stata.lic  \
 -v $(pwd)/code:/code   \
 -v $(pwd)/data:/data   \
 -v $(pwd)/results:/results \
 -p 4200:4200 larsvilhuber/siab \
 shellinaboxd -s '/:statauser:stata:/:/usr/local/stata14/stata-mp'
