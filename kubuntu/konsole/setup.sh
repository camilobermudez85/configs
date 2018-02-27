#!/bin/bash

set -x

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for konsole_config in ~/.local/share/konsole ~/.kde/share/apps/konsole; do
	if [ -d "${konsole_config}" ]; then
		find ${script_dir} -name "*.colorscheme" -exec ln -s {} "${konsole_config}" \;
	fi
done
