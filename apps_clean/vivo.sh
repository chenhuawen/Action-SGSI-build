#!/bin/bash

LOCALDIR=`cd "$( dirname $0 )" && pwd`
cd $LOCALDIR

systemdir=$1

apps_dir="
Email
VivoTips
vivoOffice
VideoPlayer
vivoWallet
iReader
BBKCloud
BuiltInPrintService
VLife_vivo
VivoDaemonService
vivospace-v2
Updater
VivoShare
UpnpServer
EasyShare
"
for delete_dir in $apps_dir ;do
  find $systemdir -type d -name "$delete_dir" | xargs rm -rf
done

# Google gms精简需要的prop属性
sed -i '/ro.com.google.gmsversion/d' $systemdir/product/build.prop

media_dir="$systemdir/media"
delete_files=$(find $media_dir -maxdepth 1 -type f -name "*" | grep -v "bootanimation.zip")
rm -rf $delete_files
