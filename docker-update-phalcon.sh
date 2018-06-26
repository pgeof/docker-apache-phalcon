#! /bin/bash

builds="all"

function usage {
    echo "Usage $0 [all|v2|v3]"
    exit 1
}

[ $# -gt 1 ] && usage

function buildV2 {
    # Build phalcon v2
    (
        phalcon="phalcon-v2.0.13" 
        php="5.6"
        v="v2.0.13-php${php}"
        cd php${php}
        docker build --build-arg PHALCON_VERSION=${phalcon} -t pgeof/apache-phalcon:${v} .
        docker push pgeof/apache-phalcon:${v}
    )
}

function buildV3 {
    # Build phalcon v3
    for phalcon in "v3.3.2" ; do 
        for php in "5.6" "7.1" "7.0" "7.2"; do
            v="${phalcon}-php${php}"
            (
                cd php${php}
                docker build --build-arg PHALCON_VERSION=${phalcon} -t pgeof/apache-phalcon:${v} .
                docker push pgeof/apache-phalcon:${v}
            )
            latest=${v}
        done
    done
    if [ -n "$latest" ] ; then
        docker tag pgeof/apache-phalcon:${latest} pgeof/apache-phalcon:latest
        docker push pgeof/apache-phalcon:latest
    fi
}

case "$1" in
all)
    buildV2
    buildV3
    ;;
v3)
    buildV3
    ;;
v2)
    buildV2
    ;;
*)
    echo "Invalid parameters"
    usage
esac

exit 0
