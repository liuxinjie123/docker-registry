#!/bin/bash

script_dir=$(cd `dirname $0`; pwd);
source ../aegis-docker/bin/aegis-config;
export container_name=registry-dev
export project_name=registry
export image_name=registry
export ip=${registry_ip};
export create_param="-p 5000:5000 -v ${script_dir}/data:/tmp/registry";

mbt_rewrite;
image()   { echo "ERROR: target not supported" | color red bold; }
local()   { echo "ERROR: target not supported" | color red bold; }
debug()   { echo "ERROR: target not supported" | color red bold; }

eval $@;

