
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}
purple(){
    echo -e "\033[35m\033[01m$1\033[0m"
}

# cài đặt WireGuard
function installwireguard(){
mkdir vpn && cd vpn
wget https://git.io/wireguard -O install.sh
chmod +x install.sh
./install.sh
red "đã cài đặt thành công WireGuard"
}

# cài đặt port
function setport(){
cd
ufw enable
ufw allow 22
ufw allow 22/tcp
ufw allow 22/udp
ufw allow 33333
ufw allow 33333/tcp
ufw allow 33333/udp
ufw reload
red "đã mở port 22, 33333 và reload thành công"
}

# tắt ipv6
function offipv6(){
echo "net.ipv6.conf.all.disable_ipv6 = 1" >>  /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >>  /etc/sysctl.conf
sysctl -p
red "đã tắt ipv6 thành công"
}

# menu lệnh
function start_menu() {
    clear
    red "Tool WireGuard Design Bởi PTT"
    red "Zalo: 0382.399.633 - 055.987.3663"
    yellow " ————————————————————————————————————————————————"
    green "1. Cài đặt WireGuard cho Ubuntu"
    green "2. Mở port 22, 33333"
    green "3. Tắt ipv6 cho VPS"
    green "4. Exit Tool"

    echo
    read -p "Vui lòng ấn số và Enter để chọn chức năng:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           installwireguard
	    ;;
        2 )
           setport
        ;;
        3 )
           offipv6
        ;;
        4 )
           exit 1
        ;;
        * )
            clear
            red "nhập đúng số đi sai rùi :)"
            start_menu
        ;;
    esac
}
start_menu "first"
