#!/bin/bash
set -e

echo "Use ZRTP"
cd /sources/zsrtp
git clone https://github.com/wernerd/ZRTP4PJ
cd ZRTP4PJ/zsrtp
sh getzrtp.sh
cd /sources/zsrtp
mv ZRTP4PJ /sources/pjsip/third_party
cd /sources/pjsip/third_party/ZRTP4PJ/build/zsrtp
sed -e 's#'~/devhome/pjproject.git'#'"/tmp/pjsip"'#' Makefile > updatedMakefile
cd ../../zsrtp
sed -i '' -e 's/#define THIS_FILE "transport_zrtp.c"/#define THIS_FILE "transport_zrtp.c"\
#define DYNAMIC_TIMER 1/' transport_zrtp.c > transport_zrtp.c
