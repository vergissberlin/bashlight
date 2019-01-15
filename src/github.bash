#!/usr/bin/env bash

####################################################################################
# Bashlight     : 0.2.0
# Copyright     : 2019, MIT
# Author        : TheDevMinerTV <tobigames200@gmail.com>
# Repository    : https://github.com/vergissberlin/bashlight
####################################################################################


# Function for github releases
function ghr() {

	# These variables pick the arguments up
	version=$1
	name=$2
	text=$3

	# We store the current branch
	branch=$(git rev-parse --abbrev-ref HEAD)

	# We get the url to the repo
	url=$(git config --get remote.origin.url)
    
    # We store a regex which only returns the username and repo into a variable
	# shellcheck disable=SC1117
	re="^(https|git)(:\/\/|@)([^\/:]+)[\/:]([^\/:]+)\/(.+).git$"
  
    # We match the regex with the url 
	if [[ $url =~ $re ]]; then
		user=${BASH_REMATCH[4]}
		repo=${BASH_REMATCH[5]}
	fi

	# We assemble the gathered data into json
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

	echo "Create release \"$version\" with name \"$name\" for repo \"$user/$repo\" on branch \"$branch\""
	
	# Check if  is set to "--simulate"
	# if unset, then jump into the else block and create a release on github,
	# otherwise just simulate this with the output
	# "T35T-R4N-5Ucc355Fu11y on version "v0.2.0" "GitHub-releases" with description "This is a bats test.""
	# which means that the test ran successfully

	if [ "$4" = "--simulate" ]; then
		
		echo "T35T-R4N-5Ucc355Fu11y on version \"$version\" \"$name\" with description \"$text\""

	else
		# We POST the data about the release to the github api
		# shellcheck disable=SC1117
		curl -s -u "$user" --data "$(generate_post_data)" "https://api.github.com/repos/$user/$repo/releases" > /dev/null 

	fi
}
