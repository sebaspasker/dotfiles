#!/bin/zsh

for file in ~/Downloads/*;do
	file1=$(echo $file | sed -e 's/[[:space:]]/\\ /g')
	file2=$(echo $file1 | cut -d'/' -f5)
	termination=$(echo $file2 | rev | cut -d'.' -f1 | rev)
	case $termination in
		"tgz" || "TGZ" || "gz" || "GZ" || "xz" || "txz" || "TXZ" || "XZ" || "tar" || "TAR") 
		[ ! -d ~/Downloads/tarFiles ] && mkdir ~/Downloads/tarFiles
		mv $file ~/Downloads/tarFiles/
		;;
		"pdf" || "PDF") [ ! -d ~/Downloads/pdfFiles ] && mkdir ~/Downloads/pdfFiles
		mv $file ~/Downloads/pdfFiles/
		;;
		"txt" || "TXT") [ ! -d ~/Downloads/txtFiles ] && mkdir ~/Downloads/txtFiles
		mv $file ~/Downloads/txtFiles/
		;;
		"rar" || "RAR") [ ! -d ~/Downloads/rarFiles ] && mkdir ~/Downloads/rarFiles
		mv $file ~/Downloads/rarFiles/
		;;
		"zip" || "ZIP") [ ! -d ~/Downloads/zipFiles ] && mkdir ~/Downloads/zipFiles
		mv $file ~/Downloads/zipFiles/
		;;
		"jpg" || "JPG" || "jpeg" || "JPEG" || "png" || "PNG") [ ! -d ~/Downloads/jpgFiles ] && mkdir ~/Downloads/jpgFiles
		mv $file ~/Downloads/jpgFiles/
		;;
		"jar" || "JAR") [ ! -d ~/Downloads/jarFiles ] && mkdir ~/Downloads/jarFiles
		mv $file ~/Downloads/jarFiles/
		;;
		"mp4" || "MP4" || "mp3" || "MP3" || "AVI" || "avi") [ ! -d ~/Downloads/mp4Files ] && mkdir ~/Downloads/mp4Files
		mv $file ~/Downloads/mp4Files/
		;;
		*) 
		[ ! -d ~/Downloads/dirFolders ] && mkdir ~/Downloads/dirFolders
		[ ! -d ~/Downloads/otherFiles ] && mkdir ~/Downloads/otherFiles
		[ ! -d $file ] && mv $file ~/Downloads/otherFiles/
		if [ -d $file ]; then
			filterFolder=0
			for folder in $(cat ~/.config/scripts/folders.txt); do
				[[ "$folder" == "$file2"  ]] && filterFolder=1
			done
				(( $filterFolder == 0 )) &&	mv $file ~/Downloads/dirFolders/
		fi
		;;
 esac
done
