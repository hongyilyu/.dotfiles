if [ -e /proc/version ]
then
    if cat /proc/version | grep -i -e ubuntu -e debian -e raspbian > /dev/null 2>&1 ; then
        alias update="sudo apt-get update && sudo apt-get upgrade &&
                      vimupdate"
    fi
else
    alias update="brew update && echo 'brew update' &&
                  brew upgrade && echo 'brew upgrade' &&
                  brew cleanup && echo 'brew cleanup' &&
                  vimupdate"
    alias finder="open -a finder ."
fi

