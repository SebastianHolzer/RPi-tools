#!/bin/bash
VERSION="3.6.3"

NAME="Python-$VERSION"
FILE="$NAME.tar.xz"
URL="https://www.python.org/ftp/python/$VERSION/$FILE"

echo "Installing prerequisites"
sudo apt update &&
sudo apt install -y libffi-dev libbz2-dev libssl-dev libncurses5-dev libncursesw5-dev libreadline-dev tk-dev libsqlite3-dev libgdbm-dev liblzma-dev libdb-dev zlib1g-dev libgdbm-dev libexpat1-dev liblzma-dev 

echo "Downloading archive and extracting files"
wget $URL &&
tar -xf $FILE &&
pushd $NAME 

echo "Compiling... get some coffee :)"
./configure --enable-optimizations --prefix=/usr &&
make -sj 4 &&
sudo make altinstall 

popd
exit 0