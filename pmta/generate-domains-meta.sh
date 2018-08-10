#!/bin/bash
DOMAINS_RAW_SOURCE_DISCARD_DAT=domains.raw.source.discard.dat
DOMAINS_RAW_SOURCE_DISCARD_SORT_DAT=domains.raw.source.discard.sort.dat
>$DOMAINS_RAW_SOURCE_DISCARD_DAT
sudo cat /var/log/pmta/pmta.log | grep "discard" | grep "done" > $DOMAINS_RAW_SOURCE_DISCARD_DAT
sort -u $DOMAINS_RAW_SOURCE_DISCARD_DAT > $DOMAINS_RAW_SOURCE_DISCARD_SORT_DAT

DOMAINS_RAW_SOURCE_OUT_DAT=domains.raw.source.out.dat
DOMAINS_RAW_SOURCE_OUT_SORT_DAT=domains.raw.source.out.sort.dat
>$DOMAINS_RAW_SOURCE_OUT_DAT
sudo cat /var/log/pmta/pmta.log | grep "out" | grep "done" > $DOMAINS_RAW_SOURCE_OUT_DAT
sort -u $DOMAINS_RAW_SOURCE_DISCARD_DAT > $DOMAINS_RAW_SOURCE_OUT_SORT_DAT

diff $DOMAINS_RAW_SOURCE_DISCARD_SORT_DAT $DOMAINS_RAW_SOURCE_OUT_SORT_DAT
