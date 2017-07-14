#!/bin/bash

# check root
if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root" 1>&2
        exit 1
fi

# update
echo "[ update system ]"
dnf update -y

# RPM Fusion
echo "[ enable RPMFusion ]"
dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-26.noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-26.noarch.rpm

# chrome
echo "[ add Google Chrome repo ]"
cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF

# steam
echo "[ add Steam repo ]"
dnf config-manager --add-repo=http://negativo17.org/repos/fedora-steam.repo

# node
echo "[ add nodeJS repo ]"
curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -

# spotify
echo "[ add spotify repo ]"
dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo

# atom 
echo "[ download Atom and install ]"
wget https://atom.io/download/rpm -O /tmp/atom.rpm
rpm -Uvh /tmp/atom.rpm

# softwares
echo "[ install stuff ]"
dnf install -y nodejs \
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
	tlp \
	zsh \
	vim \
	git \
	i3 \
	pandoc \
	autoconf \
	automake \
	mpd \
	ncmpcpp \
	scrot \
	feh \
	ImageMagick \
	i3lock \
	texlive-scheme-medium \
	redshift \
	mpv \
	dunst \
	rxvt-unicode-256color \
	network-manager-applet \
	arc-theme

# npm
echo "[ install nodeJs softwares ]"
wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo

dnf install -y yarn

#yarn global add react-native-cli eslint eslint-plugin-react eslint-plugin-react-native bower gulp-cli yo generator-jhipster

# ohmyzsh
echo "[ download oh-my-zsh ]"
wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -

# atom packages
echo "[ install Atom packages ]"
echo "run"
echo " apm install nuclide file-icons linter-eslint markdown-preview-plus markdown-writer minimap pigments todo-show "
echo ""
echo "to install atom packages"

# vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# vim +PluginInstall +qall
