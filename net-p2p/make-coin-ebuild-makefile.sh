#!/bin/bash
lower=`echo $1 | awk '{print tolower($0)}'`
upper=`echo $1 | awk '{print toupper($0)}'`
mixed=`echo $1 | awk '{print substr(toupper($0),1,1)substr(tolower($0),2,length($0)-1)}'`

cp -r bitgemd ${lower}d
cd ${lower}d
for i in bitgemd-9999.ebuild files/*
do 
  mv $i `echo $i | sed "s/bitgem/${lower}/"`
  sed -i "s/bitgem/${lower}/g;s/Bitgem/${mixed}/g;s/BITGEM/${upper}/g" `echo $i | sed "s/bitgem/${lower}/"`
done
f2=$(echo $2 | sed "s/\//\\\\\//g")
sed -i "s/^HOMEPAGE=.*/HOMEPAGE=\"https:\/\/github.com\/${f2}\"/;s/^EGIT_REPO_URI=.*/EGIT_REPO_URI=\"https:\/\/github.com\/${f2}\"/" *.ebuild
ebuild *.ebuild digest
cd ..

