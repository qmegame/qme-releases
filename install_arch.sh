# Install jre-15 from yay

if [ $(whoami) = "root" ]; then
	echo "stop!, run as not root";
	exit;
fi

if [[ $(yay --version) == yay* ]]; then
	echo "yay installed";
else
	echo "yay is not installed, why? weirdo lol, installing yay";
	cd ~;
	git clone https://aur.archlinux.org/yay-git.git;
	sudo chown -R $(whoami):$(whoami) ./
	cd yay-git;
	yes | makepkg -si;
fi
echo "installing java runtime"
yes | yay -S jdk15-adoptopenjdk
yes | sudo pacman -S wget;

cd ~;
wget -nc https://github.com/qmegame/qme-launcher/releases/download/0.1.1/qme-launcher-0.1.1.jar
sudo archlinux-java set java-15-adoptopenjdk
java -jar qme-launcher-0.1.1.jar
