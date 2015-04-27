#!/bin/bash

# this must be executed from bash (not /bin/sh), make sure env is handed in (source?)

if [ -f "/usr/local/sbin/docker-env.sh" ]; then
	source docker-env.sh
fi

echo "dcarray: $dcarray"

echo "sed-run: applying changes from files ending with *.docker-run.sed"

set -e

for name in $(find / -type f -name *.docker-run.sed)
do
	echo "sed-run: applying changes from file $name"
	# substitute variables, write result into temporary file
	# from http://stackoverflow.com/questions/415677/how-to-replace-placeholders-in-a-text-file
	eval "echo \"$(< $name)\"" > $name.tmp
	# call sed with the content of the temporary file
	if sed --file $name.tmp --in-place ${name%.docker-run.sed}; then
		# remove the temp file
		rm $name $name.tmp
	fi
done
