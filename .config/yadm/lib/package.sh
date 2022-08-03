#!/bin/bash

PackageInstall() {
	case "$(unae -s)" in
	Darwin)
		local package="$1"
		brew install "$package"
		;;
	Linux)
		DISTRO_ID=$(lsb_release -is)
		SUPPORTED_DEBIAN_ID=("Pop Ubuntu Debian")
		SUPPORTED_REDHAT_ID=("Fedora")
		if [[ " ${SUPPORTED_DEBIAN_ID[*]} " =~ ${DISTRO_ID} ]]; then
			sudo apt-get install "$package" -y
		elif [[ " ${SUPPORTED_REDHAT_ID[*]} " =~ ${DISTRO_ID} ]]; then
			sudo dnf install "$package" --yes
		else
			echo"Linux distro not supported!"
		fi
		;;
	*)
		echo "Os not supported!"
		;;
	esac
}
