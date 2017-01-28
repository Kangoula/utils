!#/bin/bash

# check root

# update
dnf update -y

# RPM Fusion
dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-25.noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-25.noarch.rpm

# chrome
cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF

# steam
dnf config-manager --add-repo=http://negativo17.org/repos/fedora-steam.repo

# owncloud 
dnf config-manager --add-repo http://download.opensuse.org/repositories/isv:ownCloud:desktop/Fedora_25/isv:ownCloud:desktop.repo

# atom 
cd  ~
wget https://atom.io/download/rpm -O atom.rpm

# softwares
dnf install -y nodejs \
	npm \
	wget \
	docker \
	docker-compose \
	google-chrome-stable \
	spotify-client \
	gnome-tweak-tool \
	vlc \
	java-openjdk \
	gimp \
	youtube-dl \
	unzip \
	geary \
	steam \
	filezilla \
	~/atom.rpm \
	tlp \
	owncloud-client \
	zsh \
	vim \
	git \
	i3 \
	pandoc \
	texlive-scheme-full

# atom packages
apm install nuclide file-icons linter-eslint markdown-preview-plus markdown-writer minimap pigments todo-show  

# react-native 
npm i -g react-native-cli eslint bower 

# watchman

# SDK android

# ohmyzsh
wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -

# mydotfiles
# git clone https://github.com/Kangoula/mydotfiles.git 

# vim plugins
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# vim +PluginInstall +qall


