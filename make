#!/bin/bash

script_dir=$(cd `dirname $0`; pwd);
source ../aegis-docker/bin/aegis-config;
export container_name=registry-dev;
export image_name=registry;
export create_param="-v ${script_dir}/data:/tmp/registry";
export pwd=$(pwd);
mkdir -p data;

# 重写mbt!!!!!
mbt_rewrite;
stagingCreate() {
	if ! docker run -d --name registry-dev $create_param --net host registry > /dev/null; then
		echo "ERROR: docker run -d --name registry-dev -v ${script_dir}/data:/tmp/registry --net host registry";
        exit -1;
    fi
    echo "$container_name is created" | color green bold;
}
local()     { echo "ERROR: target not supported" | color red bold; }
debug()     { echo "ERROR: target not supported" | color red bold; }
devCreate() { echo "ERROR: target not supported" | color red bold; }
start()     { echo "ERROR: target not supported" | color red bold; } 

eval $@;

