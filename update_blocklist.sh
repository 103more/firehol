#! /bin/bash

ipaddrs=()
FILE=`mktemp`
CODE=`mktemp`
LIST=`mktemp`

cat > ${FILE} <<EOF1
127.0.0.1
XXX.XXX.XXX.XXX
EOF1

cat > ${CODE} <<EOF2
400
401
402
403
404
EOF2

grep -v -f ${FILE} /var/log/apache2/access.log | grep -f ${CODE} | cut -d' ' -f1 | sort | uniq>${LIST}

while IFS= read -r ipaddr
do
        ipaddrs+=("${ipaddr}")
done < ${LIST}

for ipaddr in ${ipaddrs[@]}
do
        echo ""
        echo ""
        echo ""
        echo ""
        echo "-=-=-=-=-=-  Access Log of ${ipaddr} -=-=-=-=-=-"
        grep ${ipaddr} /var/log/apache2/access.log
        read -n1 -p "Do you add the ip addr( ${ipaddr} ) into blocklist_original? (y/N): " yn
        case "${yn}" in
                [yY]) ipset a blocklist_original ${ipaddr};;
        esac
        echo ""
done

rm -f ${FILE} ${CODE} ${LIST}
