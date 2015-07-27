# MacPorts Installer addition on 2011-05-04_at_10:58:56: adding an appropriate PATH variable for use with MacPorts.
export PATH=/usr/local/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

if [ -f `brew --prefix`/etc/bash_completion ]; then
      . `brew --prefix`/etc/bash_completion
fi


if [ -f ~/.bashrc ]; then
        source ~/.bashrc
fi

if [ -f ~/.profile ]; then
			source ~/.profile
fi
