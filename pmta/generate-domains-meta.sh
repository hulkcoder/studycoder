#!/bin/bash

echo "Get domains discard source."
DOMAINS_RAW_SOURCE_DISCARD_DAT=domains.raw.source.discard.dat
DOMAINS_RAW_SOURCE_DISCARD_SORT_DAT=domains.raw.source.discard.sort.dat
>$DOMAINS_RAW_SOURCE_DISCARD_DAT
sudo cat /var/log/pmta/pmta.log | grep "discard" | grep "done" > $DOMAINS_RAW_SOURCE_DISCARD_DAT
echo "Complete domains discard source."

echo "Get domains out source."
DOMAINS_RAW_SOURCE_OUT_DAT=domains.raw.source.out.dat
DOMAINS_RAW_SOURCE_OUT_SORT_DAT=domains.raw.source.out.sort.dat
>$DOMAINS_RAW_SOURCE_OUT_DAT
sudo cat /var/log/pmta/pmta.log | grep "out" | grep "done" > $DOMAINS_RAW_SOURCE_OUT_DAT
echo "Complete domains out source."

DOMAINS_RAW_SOURCE_MERGE_SORT_DAT=domains.raw.source.merge.sort.dat
DOMAINS_RAW_SOURCE_MERGE_DAT=domains.raw.source.merge.dat
DOMAINS_RAW_SOURCE_DAT=domains.raw.source.dat

>$DOMAINS_RAW_SOURCE_DAT
cat $DOMAINS_RAW_SOURCE_DISCARD_DAT >> $DOMAINS_RAW_SOURCE_DAT
cat $DOMAINS_RAW_SOURCE_OUT_DAT >> $DOMAINS_RAW_SOURCE_DAT
echo "Merge raw discard,out domains to $DOMAINS_RAW_SOURCE_DAT"

>$DOMAINS_RAW_SOURCE_MERGE_SORT_DAT
cat $DOMAINS_RAW_SOURCE_DISCARD_DAT | grep "done" | awk '{print $5}' > $DOMAINS_RAW_SOURCE_DISCARD_SORT_DAT
sort -u $DOMAINS_RAW_SOURCE_DISCARD_SORT_DAT > $DOMAINS_RAW_SOURCE_DISCARD_SORT_DAT
cat $DOMAINS_RAW_SOURCE_DISCARD_SORT_DAT >> $DOMAINS_RAW_SOURCE_MERGE_SORT_DAT

cat $DOMAINS_RAW_SOURCE_OUT_DAT | grep "done" | awk '{print $5}' > $DOMAINS_RAW_SOURCE_OUT_SORT_DAT
sort -u $DOMAINS_RAW_SOURCE_OUT_SORT_DAT > $DOMAINS_RAW_SOURCE_OUT_SORT_DAT
cat $DOMAINS_RAW_SOURCE_OUT_SORT_DAT >> $DOMAINS_RAW_SOURCE_MERGE_SORT_DAT
echo "Merge sorted, unique discard,out domains to $DOMAINS_RAW_SOURCE_MERGE_SORT_DAT"

echo "Diff between discard domains and out domains."
diff $DOMAINS_RAW_SOURCE_DISCARD_SORT_DAT $DOMAINS_RAW_SOURCE_OUT_SORT_DAT
