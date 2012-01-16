function cake() {
    if [[ -a "$app_root/cake/lib/Cake/VERSION.txt" ]]; then
        /usr/local/bin/php -c $app_root/../cgi/php.ini -q $app/Console/cake.php -working "$app" -root "$app_root" -app "$app" "$@"
    elif [[ -a "$app_root/cake/cake/VERSION.txt" ]]; then
        $app_root/cake/cake/console/cake $@ -app $app -working $app -root $app_root/cake -core $app_root/cake
    else
        echo Failed to load cake console
    fi
}
