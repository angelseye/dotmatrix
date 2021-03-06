#!/bin/bash

# Initialize files/folders we want to work with
VIMRC=${HOME}/.vimrc
GVIMRC=${HOME}/.gvimrc
VIMFOLDER=${HOME}/.vim
BASHRC=${HOME}/.bashrc
BASHPROFILE=${HOME}/.bash_profile
GEMRC=${HOME}/.gemrc
HASHRC=${HOME}/.hashrc

# First remove existing files if they exist
# Remove VIMRC
if [ -h ${VIMRC} ]; then
	echo ".vimrc is a LINK, unlinking"
	unlink ${VIMRC}
elif [ -f ${VIMRC} ]; then
	echo ".vimrc is a FILE, deleting"
	rm -f ${VIMRC}
else
	echo "${VIMRC} was not found"
fi

# Remove GVIMRC
if [ -h ${GVIMRC} ]; then
	echo ".gvimrc is a LINK, unlinking"
	unlink ${GVIMRC}
elif [ -f ${GVIMRC} ]; then
	echo ".gvimrc is a FILE, deleting"
	rm -f ${GVIMRC}
else
	echo "${GVIMRC} was not found"
fi

# Remove Vim Folder
if [ -h ${VIMFOLDER} ]; then
	echo ".vim is a LINK, unlinking"
	unlink ${VIMFOLDER}
elif [ -f ${VIMFOLDER} ]; then
	echo ".vim is a FOLDER, deleting"
	rm -rf ${VIMFOLDER}
else
	echo "${VIMFOLDER} was not found"
fi

# Remove BASHRC
if [ -h ${BASHRC} ]; then
	echo ".bashrc is a LINK, unlinking"
	unlink ${BASHRC}
elif [ -f ${BASHRC} ]; then
	echo ".bashrc is a FILE, deleting"
	rm -f ${BASHRC}
else
	echo "${BASHRC} was not found"
fi

# Remove Bash Profile
if [ -h ${BASHPROFILE} ]; then
	echo ".bash_profile is a LINK, unlinking"
	unlink ${BASHPROFILE}
elif [ -f ${BASHPROFILE} ]; then
	echo ".bash_profile is a FILE, deleting"
	rm -f ${BASHPROFILE}
else
	echo "${BASHPROFILE} was not found"
fi

# Remove GEMRC
if [ -h ${GEMRC} ]; then
	echo ".gemrc is a LINK, unlinking"
	unlink ${GEMRC}
elif [ -f ${GEMRC} ]; then
	echo ".gemrc is a FILE, deleting"
	rm -f ${GEMRC}
else
	echo "${GEMRC} was not found"
fi

# Remove Hashrocket RC
if [ -h ${HASHRC} ]; then
        echo ".hashrc is a LINK, unlinking"
        unlink ${HASHRC}
elif [ -f ${HASHRC} ]; then
        echo ".hashrc is a FILE, deleting"
        rm -f ${HASHRC}
else
        echo "${HASHRC} was not found"
fi


#Create symbolic links to these files

echo "Linking .vimrc file"
ln -s `pwd`/vimrc $VIMRC

echo "Linking .gvimrc file"
ln -s `pwd`/gvimrc $GVIMRC

echo "Linking .vim folder"
ln -s `pwd`/vim $VIMFOLDER

echo "Linking .bashrc file"
ln -s `pwd`/bashrc $BASHRC

echo "Linking .bash_profile file"
ln -s `pwd`/bash_profile $BASHPROFILE

echo "Linking .gemrc file"
ln -s `pwd`/gemrc $GEMRC

echo "Linking .hashrc file"
ln -s ${HOME}/Utilities/hashrocket_dotmatrix/.hashrc $HASHRC

