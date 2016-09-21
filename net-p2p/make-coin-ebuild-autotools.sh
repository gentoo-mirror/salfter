#!/bin/bash
lower=`echo $1 | awk '{print tolower($0)}'`
upper=`echo $1 | awk '{print toupper($0)}'`
mixed=`echo $1 | awk '{print substr(toupper($0),1,1)substr(tolower($0),2,length($0)-1)}'`

cp -r digitalcoind ${lower}d
cd ${lower}d
for i in digitalcoind-9999.ebuild files/*
do 
  mv $i `echo $i | sed "s/digitalcoin/${lower}/"`
  sed -i "s/digitalcoin/${lower}/g;s/Digitalcoin/${mixed}/g;s/DIGITALCOIN/${upper}/g" `echo $i | sed "s/digitalcoin/${lower}/"`
done
f2=$(echo $2 | sed "s/\//\\\\\//g")
sed -i "s/^HOMEPAGE=.*/HOMEPAGE=\"https:\/\/github.com\/${f2}\"/;s/^EGIT_REPO_URI=.*/EGIT_REPO_URI=\"https:\/\/github.com\/${f2}\"/;s/DB_VER=\"5.1\"/DB_VER=\"4.8\"/" *.ebuild
ebuild *.ebuild digest

cd ..

cp -r digitalcoin-cli ${lower}-cli
cd ${lower}-cli
for i in digitalcoin-cli-9999.ebuild files/*
do 
  mv $i `echo $i | sed "s/digitalcoin/${lower}/"`
  sed -i "s/digitalcoin/${lower}/g;s/Digitalcoin/${mixed}/g;s/DIGITALCOIN/${upper}/g" `echo $i | sed "s/digitalcoin/${lower}/"`
done
f2=$(echo $2 | sed "s/\//\\\\\//g")
sed -i "s/^HOMEPAGE=.*/HOMEPAGE=\"https:\/\/github.com\/${f2}\"/;s/^EGIT_REPO_URI=.*/EGIT_REPO_URI=\"https:\/\/github.com\/${f2}\"/" *.ebuild
ebuild *.ebuild digest

cd ..
