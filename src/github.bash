#!/usr/bin/env bash

####################################################################################
# Bashlight     : 0.2.0
# Copyright     : 2019, MIT
# Author        : TheDevMinerTV <tobigames200@gmail.com>
# Repository    : https://github.com/vergissberlin/bashlight
####################################################################################


# Function for github releases
function ghr() {
	version=$1
	name=$2
	text=$3

	branch=$(git rev-parse --abbrev-ref HEAD)
	repo_full_name=$(git config --get remote.origin.url)
	url=$repo_full_name
	re="^(https|git)(:\/\/|@)([^\/:]+)[\/:]([^\/:]+)\/(.+).git$"


	if [[ $url =~ $re ]]; then
		protocol=${BASH_REMATCH[1]}
		separator=${BASH_REMATCH[2]}
		hostname=${BASH_REMATCH[3]}
		user=${BASH_REMATCH[4]}
		repo=${BASH_REMATCH[5]}
	fi


	generate_post_data() {
		cat <<EOF
{
  "tag_name": "$version",
  "target_commitish": "$branch",
  "name": "$name",
  "body": "$text",
  "draft": false,
  "prerelease": false
}
EOF
	}

	echo "Create release $version with name $name for repo: $user/$repo branch: $branch"
	curl -u "$user" --data "$(generate_post_data)" "https://api.github.com/repos/$user/$repo/releases"
}
