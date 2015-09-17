#!/bin/bash

galaxy_dir="lib/galaxy/"
current_dir=$PWD

# Clone or pull galaxy code
cd $galaxy_dir
git pull 
cd $current_dir

cp -r tools/* $galaxy_dir/tools/

# Prepare galaxy tools
./src/prepare_galaxy_tools.sh $galaxy_dir

# Prepare galaxy config
cp config/* $galaxy_dir/config/

# Prepare galaxy tool_data
cp tool-data/* $galaxy_dir/tool-data

if [ ! -d $galaxy_dir/dependency_dir ]; then
    mkdir $galaxy_dir/dependency_dir
fi

# Prepare ftp directory
if [ ! -d $galaxy_dir/database/ftp ]; then
    mkdir $galaxy_dir/database/ftp
fi

# Launch galaxy
cd $galaxy_dir
sh run.sh