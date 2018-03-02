#!/bin/bash

set -x

sudo apt-get install fonts-powerline
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd "${script_dir}/powerline-shell"
cp ../powerline-shell-custom-theme.py powerline_shell/themes/custom.py
python setup.py install --user
rm powerline_shell/themes/custom.py
popd

cat << EOF >> ~/.bashrc

# Bash powerline
if [ -f ${script_dir}/bash-powerline.sh ]; then
	source ${script_dir}/bash-powerline.sh
fi
EOF
ln -s ${script_dir}/powerline-shell.json ~/.powerline-shell.json

cat << EOF >> ~/.bashrc

# Aliases configuration
if [ -d ${script_dir}/aliases ]; then
	for f in ${script_dir}/aliases/*; do
		source "\$f"
	done
fi
EOF
