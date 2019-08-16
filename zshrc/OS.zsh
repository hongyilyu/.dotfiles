if [ -e /proc/version ]
then
    if cat /proc/version | grep -i -e ubuntu -e debian -e raspbian > /dev/null 2>&1 ; then
        alias update="sudo apt-get update && sudo apt-get upgrade &&
                      nvim +PlugUpgrade +qall && echo 'vim upgrade' &&
                      nvim +PlugUpdate +qall && echo 'vim update' &&
                      nvim +PlugClean +qall && echo 'vim cleanup'"
    fi
else
    alias update="brew update && echo 'brew update' &&
                  brew upgrade && echo 'brew upgrade' &&
                  brew cleanup && echo 'brew cleanup' &&
                  nvim +PlugUpgrade +qall && echo 'vim upgrade' &&
                  nvim +PlugUpdate +qall && echo 'vim update' &&
                  nvim +PlugClean +qall && echo 'vim cleanup'"
    alias finder="open -a finder ."
    alias sendiot="scp -i ~/.ssh/id_rsa web_server.py dns_callback.py IoT_Classification.py manual_change_ip.py update_ip.py fetch_ip.py sniffer.py iptable_controller.py root@192.168.2.1:/jffs/workspace/"
    alias sendser="scp -i ~/.ssh/id_rsa g_pkl.sh send_email.py generate_policy.py policies_compare.py generate_mud.py  mud_server@192.168.2.118:~/Desktop/MUDgeneration/"
fi

