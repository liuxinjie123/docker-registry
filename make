#!/bin/bash

script_dir=$(cd `dirname $0`; pwd);
source ../aegis-docker/bin/aegis-config;
export container_name=nexus;
export image_name=nexus;
export create_param="-v ${script_dir}/data:/";
export pwd=$(pwd);
mkdir -p data;

# 重写mbt!!!!!
mbt_rewrite;
stagingCreate() {
	if ! docker run -d --name nexus-dev $create_param --net host nexus > /dev/null; then
		echo "ERROR: docker run -d --name nexus -v ${script_dir}/data:/tmp/nexus --net host nexus";
        exit -1;
    fi
    echo "$container_name is created" | color green bold;
}
local()     { echo "ERROR: target not supported" | color red bold; }
debug()     { echo "ERROR: target not supported" | color red bold; }
devCreate() { echo "ERROR: target not supported" | color red bold; }
start()     { echo "ERROR: target not supported" | color red bold; } 

eval $@;

