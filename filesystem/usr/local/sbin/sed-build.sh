#!/bin/bash

echo "sed-build: applying changes from files ending with *.docker-build.sed"

for name in $(find / -type f -name *.docker-build.sed)
do
	echo "sed-build: Changing to directory $(dirname $name)"
	cd $(dirname $name)
	echo "sed-build: applying changes from file $(basename $name)"
	sed --file $name --in-place ${name%.docker-build.sed}
	rm $name
done
