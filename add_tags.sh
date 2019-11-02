#!/bin/bash
#
#Variables
version="janus/v1.2.3"
dev_suffix="janus/v1.2.3dev"
get_version_prod=$(git tag -l |grep "janus/v1.2.3")
get_version_dev=$(git tag -l |grep "janus/v1.2.3dev")

function add_tag_production {
	git tag $version
	git push origin $version
}

function add_tag_dev {
	git tag $dev_suffix
        git push origin $dev_suffix
}

function list_tag {
	git tag -l
}

if [[ "$get_version_prod" == "$version" || "$get_version_dev" == "$dev_suffix" ]]
then
	echo "=============== Type version ==============="
	echo $version  " -- production!"
	echo $dev_suffix " -- development!"
	echo "============================================"
else
	echo "No builds with such tags."
	add_tag_production
	add_tag_dev
	git tag -l
fi
