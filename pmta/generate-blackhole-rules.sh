#!/bin/bash

DOMAINS_SOURCE_DAT="domains.source.dat"
DOMAINS_RAW_SOURCE_DAT="domains.raw.source.dat"

echo "Extract domain."
>$DOMAINS_SOURCE_DAT
cat $DOMAINS_RAW_SOURCE_DAT | grep "done" | awk '{print $5}' > $DOMAINS_SOURCE_DAT
sed -i 's/\/qa-mta//' $DOMAINS_SOURCE_DAT
sed -i 's/\/mta-LA4QMTA02//' $DOMAINS_SOURCE_DAT
sed -i 's/\/{default}//' $DOMAINS_SOURCE_DAT

DOMAINS_SORT_DAT="domains.sort.dat"

echo "Remove duplicate domain and sort domain."
>$DOMAINS_SORT_DAT
sort -u $DOMAINS_SOURCE_DAT > $DOMAINS_SORT_DAT

sed -i '/^gmail.com$/d' $DOMAINS_SORT_DAT
sed -i '/^yahoo.com$/d' $DOMAINS_SORT_DAT
sed -i '/^experian.com$/d' $DOMAINS_SORT_DAT

DOMAINS_SORT_RULES_DAT="domains.sort.rules.dat"

echo "Generate pmta blockhole rules."
>$DOMAINS_SORT_RULES_DAT
while IFS= read -r line;do
    if [ -n "$line" ]; then
        echo "relay-domain $line" >> $DOMAINS_SORT_RULES_DAT
        echo "<domain $line>" >> $DOMAINS_SORT_RULES_DAT
        echo "  type discard" >> $DOMAINS_SORT_RULES_DAT
        echo "</domain>" >> $DOMAINS_SORT_RULES_DAT
    fi
done < "$DOMAINS_SORT_DAT"

echo "Replace /etc/pmta/global/domains_blackhole.dat."
sudo cp $DOMAINS_SORT_RULES_DAT /etc/pmta/global/domains_blackhole.dat
sudo chown pmta:pmta /etc/pmta/global/domains_blackhole.dat
echo "Restart pmta service."
sudo service pmta restart
echo "Completed."
