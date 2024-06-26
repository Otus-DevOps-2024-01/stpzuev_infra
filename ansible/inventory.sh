#!/bin/bash

#if [[ $1 == "--list" ]]; then
#    APPHOST=$(yc compute instance get --name reddit-app-stage --format=json | jq -r '.network_interfaces[0].primary_v4_address.one_to_one_nat.address')
#    DBHOST=$(yc compute instance get --name reddit-db-stage --format=json | jq -r '.network_interfaces[0].primary_v4_address.address')
APPHOST=51.250.73.29
DBHOST=10.128.0.29

cat <<EOF
{
    "_meta": {
        "hostvars": {}
    },
    "app": {
        "hosts": ["${APPHOST}"],
    "vars": {
      "var1": "foo",
      "var2": "bar"
    },
    "db": {
        "hosts": ["${DBHOST}"],
        "vars": {
            "ansible_ssh_common_args": "-J ubuntu@${APPHOST}",
            "var1": "foobar",
            "var2": "barfoo"
        }
    }
}
EOF

#elif [[ $1 == "--host" ]]; then
#    echo '{"_meta": {"hostvars": {}}}' | jq -M
#else
#    echo '{}'
#fi
