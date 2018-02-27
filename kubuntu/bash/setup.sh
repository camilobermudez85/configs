#!/bin/bash

set -x

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd "${script_dir}"

pushd powerline-shell
cp ../powerline-shell-custom-theme.py powerline-shell/themes/custom.py
python setup.py install --user
rm powerline-shell/themes/custom.py
popd

echo -e "\n# Bash powerline\nif [ -f $(pwd)/bash-powerline.sh ]; then\n\tsource $(pwd)/bash-powerline.sh\nfi\n" >> ~/.bashrc
ln -s $(pwd)/powerline-shell.json ~/.powerline-shell.json

popd
