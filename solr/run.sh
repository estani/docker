#!/bin/bash
script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

#first ist solr
ports=( 21001 21002 )

while getopts "i" opt; do
    case "$opt" in
        i) interactive=1; shift;;
    esac
done

port_param=
for port in "${ports[@]}"; do port_param="$port_param -v $port:$port"; done

echo "Starting solr on port ${ports[0]}"
cmd="docker run -ti --rm --add-host db:$(get_host_ip) -v $script_dir/tomcat:/cfn365/tomcat -v $script_dir/solr_data:/cfn365/solr_data $port_param "
if ((interactive)); then
    $cmd --entrypoint /bin/bash solr
else
    $cmd solr -p $port -s /data "$@"
fi

