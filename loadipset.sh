#! /bin/bash

IPSET=${1:-cn}

ipset flush ipip_country_${IPSET}
while IFS= read -r ipaddr
do
	ipset a ipip_country_${IPSET} ${ipaddr}
done < /etc/firehol/ipsets/ipip_country/ipip_country_${IPSET}.netset
