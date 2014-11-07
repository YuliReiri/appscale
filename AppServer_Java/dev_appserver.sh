#!/bin/bash
# Copyright 2009 Google Inc. All Rights Reserved.
#
# Launches the Development AppServer.  This utility allows developers
# to test a Google App Engine application on their local workstation.
#
[ -z "${DEBUG}" ] || set -x  # trace if $DEBUG env. var. is non-zero
SDK_BIN="`dirname "$0" | sed -e "s#^\\([^/]\\)#${PWD}/\\1#"`" # sed makes absolute
SDK_LIB="$SDK_BIN/../lib"
JAR_FILE="$SDK_LIB/appengine-tools-api.jar:$SDK_LIB/appengine-api-1.0-sdk-1.8.0.jar:$SDK_LIB/appscale-smtp.jar:$SDK_LIB/appengine-api-labs-1.8.0.jar:$SDK_LIB/appscale-activation.jar:$SDK_LIB/jsr107cache-1.1.jar:$SDK_LIB/appengine-jsr107cache-1.8.0.jar:$SDK_LIB/appscale-mail.jar:$SDK_LIB/jstl-1.2.jar"

if [ ! -e "$SDK_LIB/appengine-tools-api.jar" ]; then
    echo "Repacked jar files not found"
    exit 1
fi

java -ea -cp "$JAR_FILE" \
  com.google.appengine.tools.KickStart \
  com.google.appengine.tools.development.DevAppServerMain "$@"
