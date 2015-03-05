#!/bin/bash
lower=`echo $1 | awk '{print tolower($0)}'`
upper=`echo $1 | awk '{print toupper($0)}'`
mixed=`echo $1 | awk '{print substr(toupper($0),1,1)substr(tolower($0),2,length($0)-1)}'`

f2=$(echo $2 | sed "s/\//\\\\\//g")
sed "s/github.com\/bitcoin\/bitcoin/github.com\/${f2}/g;s/bitcoin/${lower}/g;s/Bitcoin/${mixed}/g;s/BITCOIN/${upper}/g;s/DB_VER=\"5.1\"/DB_VER=\"4.8\"/" /var/lib/layman/bitcoin/eclass/bitcoincore.eclass >../eclass/${lower}core.eclass

cp -r /var/lib/layman/bitcoin/net-p2p/bitcoind ${lower}d
cd ${lower}d
for i in bitcoind-9999.ebuild files/*
do 
  mv $i `echo $i | sed "s/bitcoin/${lower}/"`
  sed -i "s/bitcoin/${lower}/g;s/Bitcoin/${mixed}/g;s/BITCOIN/${upper}/g;s/virtual\/${lower}-leveldb/virtual\/bitcoin-leveldb/" `echo $i | sed "s/bitcoin/${lower}/"`
done
#f2=$(echo $2 | sed "s/\//\\\\\//g")
#sed -i "s/^HOMEPAGE=.*/HOMEPAGE=\"https:\/\/github.com\/${f2}\"/;s/^EGIT_REPO_URI=.*/EGIT_REPO_URI=\"https:\/\/github.com\/${f2}\"/;s/DB_VER=\"5.1\"/DB_VER=\"4.8\"/" *.ebuild
rm bitcoind-*.ebuild
ebuild *.ebuild digest

cd ..

cp -r /var/lib/layman/bitcoin/net-p2p/bitcoin-cli ${lower}-cli
cd ${lower}-cli
for i in bitcoin-cli-9999.ebuild 
do 
  mv $i `echo $i | sed "s/bitcoin/${lower}/"`
  sed -i "s/bitcoin/${lower}/g;s/Bitcoin/${mixed}/g;s/BITCOIN/${upper}/g;s/virtual\/${lower}-leveldb/virtual\/bitcoin-leveldb/" `echo $i | sed "s/bitcoin/${lower}/"`
done
#f2=$(echo $2 | sed "s/\//\\\\\//g")
#sed -i "s/^HOMEPAGE=.*/HOMEPAGE=\"https:\/\/github.com\/${f2}\"/;s/^EGIT_REPO_URI=.*/EGIT_REPO_URI=\"https:\/\/github.com\/${f2}\"/" *.ebuild
rm bitcoin-cli-*.ebuild
ebuild *.ebuild digest

cd ..

