#!/bin/zsh

for file in ~/Descargas/*;do
	file1=$(echo $file | sed -e 's/[[:space:]]/\\ /g')
	file2=$(echo $file1 | cut -d'/' -f5)
	termination=$(echo $file2 | rev | cut -d'.' -f1 | rev)
	case $termination in
		"tgz" || "TGZ" || "gz" || "GZ" || "xz" || "txz" || "TXZ" || "XZ" || "tar" || "TAR") 
		[ ! -d ~/Descargas/tarFiles ] && mkdir ~/Descargas/tarFiles
		mv $file ~/Descargas/tarFiles/
		;;
		"pdf" || "PDF") [ ! -d ~/Descargas/pdfFiles ] && mkdir ~/Descargas/pdfFiles
		mv $file ~/Descargas/pdfFiles/
		;;
		"txt" || "TXT") [ ! -d ~/Descargas/txtFiles ] && mkdir ~/Descargas/txtFiles
		mv $file ~/Descargas/txtFiles/
		;;
		"rar" || "RAR") [ ! -d ~/Descargas/rarFiles ] && mkdir ~/Descargas/rarFiles
		mv $file ~/Descargas/rarFiles/
		;;
		"zip" || "ZIP") [ ! -d ~/Descargas/zipFiles ] && mkdir ~/Descargas/zipFiles
		mv $file ~/Descargas/zipFiles/
		;;
		"jpg" || "JPG" || "jpeg" || "JPEG") [ ! -d ~/Descargas/jpgFiles ] && mkdir ~/Descargas/jpgFiles
		mv $file ~/Descargas/jpgFiles/
		;;
		"jar" || "JAR") [ ! -d ~/Descargas/jarFiles ] && mkdir ~/Descargas/jarFiles
		mv $file ~/Descargas/jarFiles/
		;;
		"mp4" || "MP4" || "mp3" || "MP3" || "AVI" || "avi") [ ! -d ~/Descargas/mp4Files ] && mkdir ~/Descargas/mp4Files
		mv $file ~/Descargas/mp4Files/
		;;
		*) 
		[ ! -d ~/Descargas/dirFolders ] && mkdir ~/Descargas/dirFolders
		[ ! -d ~/Descargas/otherFiles ] && mkdir ~/Descargas/otherFiles
		[ ! -d $file ] && mv $file ~/Descargas/otherFiles/
		if [ -d $file ]; then
			filterFolder=0
			for folder in $(cat ~/.config/scripts/folders.txt); do
				[[ "$folder" == "$file2"  ]] && filterFolder=1
			done
				(( $filterFolder == 0 )) &&	mv $file ~/Descargas/dirFolders/
		fi
		;;
 esac
done



