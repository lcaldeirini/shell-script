#!/usr/bin/env bash

function get_falconcontainer_status() { 
    kubectl get falconcontainer falcon-container -o json | jq -r ".status.phase"
}


function show_falconcontainer_status() {
    falconcontainer_status=$(get_falconcontainer_status)
    
    if [[ "${falconcontainer_status}" =~ "DONE" ]]; then
        echo "$(date +'%Y-%m-%dT%H:%M:%S.%s') - INFO - status: [pass]"
    else
        echo "$(date +'%Y-%m-%dT%H:%M:%S.%s') - ERROR - status: [fail]"
    fi
}

show_falconcontainer_status






