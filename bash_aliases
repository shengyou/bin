alias ..="cd .."
alias ...="cd ../.."

alias h='cd ~'
alias c='clear'
alias art=artisan

alias phpspec='vendor/bin/phpspec'
alias phpunit='vendor/bin/phpunit'

alias xoff='sudo phpdismod -s cli xdebug'
alias xon='sudo phpenmod -s cli xdebug'

function artisan() {
    php artisan "$@"
}

function php56() {
    sudo update-alternatives --set php /usr/bin/php5.6
}

function php70() {
    sudo update-alternatives --set php /usr/bin/php7.0
}

function php71() {
    sudo update-alternatives --set php /usr/bin/php7.1
}

function php72() {
    sudo update-alternatives --set php /usr/bin/php7.2
}

function xphp() {
    (php -m | grep -q xdebug)
    if [[ $? -eq 0 ]]
    then
        XDEBUG_ENABLED=true
    else
        XDEBUG_ENABLED=false
    fi

    if ! $XDEBUG_ENABLED; then xon; fi

    php \
        -dxdebug.remote_host=192.168.10.1 \
        -dxdebug.remote_autostart=1 \
        "$@"

    if ! $XDEBUG_ENABLED; then xoff; fi
}

function flip() {
    bash ~/bin/ring/stop.sh
    sleep 5
    bash ~/bin/ring/start.sh
}

function ring() {
    case "$1" in
        status)
            bash ~/bin/ring/status.sh ;;
        start)
            bash ~/bin/ring/start.sh ;;
        stop)
            bash ~/bin/ring/stop.sh ;;
        install)
            bash ~/bin/ring/install.sh ;;
        restore)
            bash ~/bin/ring/install.sh ;;
        provision)
            bash ~/bin/ring/provision.sh ;;
        *)
            echo "Usage: ring [command]" ;;
    esac
}
