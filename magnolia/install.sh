#!/bin/bash
MAGNOLIA_APACHE_HOME=/opt/magnolia-5.3/apache-tomcat-7.0.47
LOG=$MAGNOLIA_APACHE_HOME/logs/catalina.out

wait_for() {
    local log="$1"
    local wait_for=${2:-3}
    local word="$3"
    local lc="$(wc -l<"$log")"    

    while :; do
        sleep 1
        if (($(date +%s) - $(stat -c %Y "$log") > wait_for)); then
            if [[ "$word" ]]; then
                #check the last 10 lines that *has been written anew*
                local new_lc=$(wc -l<"$log")
                if ((new_lc > lc + 10)); then
                    local from=$((new_lc-10))
                else
                    local from=$((lc-10))
                fi
                if ((from<0)); then from=1 ; fi
                sed -n "$from,\$ p"  "$log" | grep -q "$word" && break
            else
                break
            fi
        fi
    done
}


$MAGNOLIA_APACHE_HOME/bin/magnolia_control.sh start

wait_for "$LOG" 5 "INFO: Server startup in"

echo Installing updates for author site
curl http://localhost:8080/magnoliaAuthor/.magnolia/installer/start
wait_for "$LOG" 5
curl http://localhost:8080/magnoliaAuthor/.magnolia/installer/finish

echo Installing updates for public site
curl http://localhost:8080/magnoliaPublic/.magnolia/installer/start
wait_for "$LOG" 5
curl http://localhost:8080/magnoliaPublic/.magnolia/installer/finish

#done, we just need to shut it down properly
wait_for "$LOG" 5
$MAGNOLIA_APACHE_HOME/bin/magnolia_control.sh stop 
wait_for "$LOG" 5 "INFO: Destroying ProtocolHandler"
