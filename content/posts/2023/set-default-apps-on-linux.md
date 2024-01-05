---
title: "Set Default Apps On Linux"
date: 2024-01-01
url: /set-default-apps-on-linux/
image: images/2023-thumbs/my-first-post.jpg
categories:
  - Linux
tags:
  - Ubuntu
  - Arch Linux
draft: false
---

## Info
So all of us know how hard it is to change the default apps on linux.

this post will help you to change default apps on linux.


## Discovering the desktop file of apps
`ls /usr/share/applications`

## Media
So media plays is not a single .mp3 and .mp4 for it to be easy

I found a script that will help you to change default one for them all

**default-media-player.sh**
```sh
#!/usr/bin/env bash

help_string=$(cat <<EOF
Usage: $0 [-h|-l] APPLICATION
    Set a video player as the default.
Example:
    # List candidate desktop files for media players.
    $0 -l
    # Pick one and set it as the default.
    $0 mpv.desktop
See Also:
    <https://specifications.freedesktop.org/mime-apps-spec/latest/index.html>
EOF
)

hash xdg-mime || {
    echo "$0: xdg-mime is required to run this script (usually provided by xdg-utils package)."
    exit 127
}

desktop_path=(/usr/share/applications /usr/local/share/applications)
desktop=$1

if ! [[ ${desktop} =~ .desktop$ ]]; then
    echo -e "${help_string}\n"
    >&2 echo "$0: Expected a *.desktop file for the first argument."
    exit 1
fi

list_media_players() {
    for desktop_dir in ${desktop_path[@]}; do
        entries=$(find ${desktop_dir} -name "*.desktop")
        if [[ $? != 0 ]]; then
            exit $?
        fi
        for entry in ${entries[@]}; do
            if [[ ! -f ${entry} ]]; then
                continue
            fi

            grep -qE '^MimeType=.*video\/|MimeType=.*audio\/' ${entry}
            if [[ $? = 0 ]]; then
                echo $(basename ${entry})
            fi
        done
    done
}

if [[ -z ${desktop} ]] || [[ ${desktop} = "-h" ]] || [[ ${desktop} = "--help" ]]; then
    echo "$help_string"
    exit 0
fi

if [[ ${desktop} = "-l" ]]; then
    list_media_players
    exit 0
fi

found=0
for desktop_dir in ${desktop_path[@]}; do
    if [[ -n $(find ${desktop_dir} -name ${desktop}) ]]; then
        found=1
        break
    fi
done

if [[ ${found} == 0 ]]; then
    >&2 echo "$0: WARNING: desktop file does not exist: ${desktop}"
fi

mimetypes=(
    application/ogg application/x-ogg application/mxf application/sdp
    application/smil application/x-smil application/streamingmedia
    application/x-streamingmedia application/vnd.rn-realmedia
    application/vnd.rn-realmedia-vbr audio/aac audio/x-aac
    audio/vnd.dolby.heaac.1 audio/vnd.dolby.heaac.2 audio/aiff audio/x-aiff
    audio/m4a audio/x-m4a application/x-extension-m4a audio/mp1 audio/x-mp1
    audio/mp2 audio/x-mp2 audio/mp3 audio/x-mp3 audio/mpeg audio/mpeg2
    audio/mpeg3 audio/mpegurl audio/x-mpegurl audio/mpg audio/x-mpg
    audio/rn-mpeg audio/musepack audio/x-musepack audio/ogg audio/scpls
    audio/x-scpls audio/vnd.rn-realaudio audio/wav audio/x-pn-wav
    audio/x-pn-windows-pcm audio/x-realaudio audio/x-pn-realaudio
    audio/x-ms-wma audio/x-pls audio/x-wav video/mpeg video/x-mpeg2
    video/x-mpeg3 video/mp4v-es video/x-m4v video/mp4
    application/x-extension-mp4 video/divx video/vnd.divx video/msvideo
    video/x-msvideo video/ogg video/quicktime video/vnd.rn-realvideo
    video/x-ms-afs video/x-ms-asf audio/x-ms-asf application/vnd.ms-asf
    video/x-ms-wmv video/x-ms-wmx video/x-ms-wvxvideo video/x-avi video/avi
    video/x-flic video/fli video/x-flc video/flv video/x-flv video/x-theora
    video/x-theora+ogg video/x-matroska video/mkv audio/x-matroska
    application/x-matroska video/webm audio/webm audio/vorbis audio/x-vorbis
    audio/x-vorbis+ogg video/x-ogm video/x-ogm+ogg application/x-ogm
    application/x-ogm-audio application/x-ogm-video application/x-shorten
    audio/x-shorten audio/x-ape audio/x-wavpack audio/x-tta audio/AMR audio/ac3
    audio/eac3 audio/amr-wb video/mp2t audio/flac audio/mp4
    application/x-mpegurl video/vnd.mpegurl application/vnd.apple.mpegurl
    audio/x-pn-au video/3gp video/3gpp video/3gpp2 audio/3gpp audio/3gpp2
    video/dv audio/dv audio/opus audio/vnd.dts audio/vnd.dts.hd audio/x-adpcm
    application/x-cue audio/m3u
)

xdg-mime default ${desktop} ${mimetypes[@]}
exit $?
```
**chmod +x default-media-player.sh**

use it like

`./default-media-player.sh io.github.celluloid_player.Celluloid.desktop`

Replace `io.github.celluloid_player.Celluloid.desktop` with your media player .desktop file like for an example `mpv.desktop`

## File Manager
To check current default one use

`xdg-mime query default inode/directory`

to change it use
```sh
xdg-mime default org.kde.dolphin.desktop inode/directory application/x-gnome-saved-search
xdg-mime default org.kde.dolphin.desktop inode/directory
```

Replace `org.kde.dolphin.desktop` with your file manager .desktop file like for an example `org.gnome.Nautilus.desktop`

## Web Browsor
To check current default one use

`xdg-settings get default-web-browser`

to change it use

`xdg-settings set default-web-browser google-chrome.desktop`

Replace `google-chrome.desktop` with your file manager .desktop file like for an example `firefox.desktop`

## Torrent / magnet

To check current default one use

`xdg-mime query default x-scheme-handler/magnet`

to change it use

`xdg-mime default org.qbittorrent.qBittorrent.desktop x-scheme-handler/magnet`

Replace `org.qbittorrent.qBittorrent.desktop` with your Torrent appliction .desktop file like for an example `transmission-gtk.desktop`