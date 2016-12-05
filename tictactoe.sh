#!/bin/bash

echo Cleaning...
rm -rf ./dist
#make dist directory
mkdir dist
mkdir dist/public

if [ -z "$GIT_COMMIT" ]; then
  export GIT_COMMIT=$(git rev-parse HEAD)
  export GIT_URL=$(git config --get remote.origin.url)
fi

# Remove .git from url in order to get https link to repo (assumes https url for GitHub)
export GITHUB_URL=$(echo $GIT_URL | rev | cut -c 5- | rev)

#Make .env for docker_compose image to use GIT_COMMIT
echo GIT_COMMIT=$GIT_COMMIT > .env
echo Building app

#install npm in root
npm install
#install npm in client
cd client
npm install
cd ..
#build
npm run build

rc=$?
if [[ $rc != 0 ]] ; then
    echo "Npm build failed with exit code " $rc
    exit $rc
fi


cat > ./dist/githash.txt <<_EOF_
$GIT_COMMIT
_EOF_

cat > ./dist/public/version.html << _EOF_
<!doctype html>
<head>
   <title>App version information</title>
</head>
<body>
   <span>Origin:</span> <span>$GITHUB_URL</span>
   <span>Revision:</span> <span>$GIT_COMMIT</span>
   <p>
   <div><a href="$GITHUB_URL/commits/$GIT_COMMIT">History of current version</a></div>
</body>
_EOF_

cp ./Dockerfile ./build/

#cd dist
echo Building docker image

docker build -t asgeira13/tictactoe:latest -t asgeira13/tictactoe:$GIT_COMMIT .

rc=$?
if [[ $rc != 0 ]] ; then
    echo "Docker build failed " $rc
    exit $rc
fi

#docker push asgeira13/tictactoe:$GIT_COMMIT
docker push asgeira13/tictactoe
rc=$?
if [[ $rc != 0 ]] ; then
    echo "Docker push failed " $rc
    exit $rc
fi

echo "Done"
