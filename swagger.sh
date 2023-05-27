#!/bin/bash

sites=($(cat "$1"))
paths=($(cat "$2"))

check_url() {
    url="$1"
    protocols=("https" "http")
    for protocol in "${protocols[@]}"; do
        full_url="${protocol}://${url}"
        response=$(echo "$full_url" | httpx -silent -cl -mc 200,302 -title)
        if [[ $response ]]; then
            if echo "$response" | grep -q "Swagger UI"; then
                echo -e "\033[0;32m[Swagger UI 200]\033[0m at $full_url"
            else
                echo -e "\033[0;33m[Swagger UI 404]\033[0m at $full_url"
            fi
            return
        fi
    done
    echo -e "\033[0;31m[No Response 404]\033[0m from $url"
}

export -f check_url

generate_urls() {
    for site in "${sites[@]}"; do
        for path in "${paths[@]}"; do
            echo "$site$path"
        done
    done
}

generate_urls | xargs -I {} -P 5 bash -c 'check_url "$@"' _ {}
