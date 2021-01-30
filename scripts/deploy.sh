#!/bin/sh

echo "Starting deployment"
#move to the root directory
cd ../
echo "Moved to the root directory"
hugo --minify
ssh caparledev-deploy 'rm -rf osscameroon-blog/public_old && mv osscameroon-blog/{public,public_old}'
scp -r public caparledev-deploy:osscameroon-blog
echo "Oss Cameroon Blog deployment DONE"
