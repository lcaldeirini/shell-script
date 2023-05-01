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

function check_falcon-injector_pods() {
    kubectl get pods | grep -v Running
}


function check_falcon-injector() {
    kubens falcon-system
    falcon-injector_check_pods=$(check_falcon-injector_pods)
    
    if [[ "${falcon-injector_check_pods}" =~ "0" ]]; then
        echo "$(date +'%Y-%m-%dT%H:%M:%S.%s') - PODS - status: [running]"
    else
        echo echo "$(date +'%Y-%m-%dT%H:%M:%S.%s') - PODS - status: [not working]"
    fi
}


function show_falcontainer_logs() {
    echo
}


function check_falcon-operator() {
    echo
}


show_falconcontainer_status

check_falcon-injector




