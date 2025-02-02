#!/bin/bash
#   The folder containing the IBController files:
IBCDIR=/opt/ib/IBController/

#   The location and filename of the IBController configuration file. This file should
#   be in a folder in your personal filestore, so that other users of yur computer can't
#   access it. This folder and its contents should also be encrypted so that even users
#   with administrator privileges can't see the contents:

IBCINI=/opt/ib/IBController/IBController.ini

#   The folder where TWS is installed:
TWSDIR=/opt/ib/IBJts

#   The classpath for TWS. The value below is correct for version
#   942 (you can verify which version of TWS you are using by going
#   to the Help | About Trader Workstation menu in TWS).
#
#   For other versions of TWS, the information needed may change.
#   You can find the required information in the UNIX/MacOsX download instructions
#   for TWS on the IB website, which includes a sample command to start TWS.
#
#   You must include everything after "-cp " up to the 
#   first subsequent space character:
TWSCP=jts.jar:total.2013.jar

#   Other Java VM options for TWS. You can find this information in the 
#   UNIX/MacosX download instructions for TWS on the IB website. (Note that
#   jclient.LoginFrame is NOT part of the Java options, nor is anything 
#   that comes after it, so don't include that here):
JAVAOPTS="-Xmx800M -XX:MaxPermSize=256M"

# -- LAUNCH TWS
pushd $TWSDIR
java -cp  $TWSCP:$IBCDIR/IBController.jar $JAVAOPTS ibcontroller.IBController $IBCINI
popd
