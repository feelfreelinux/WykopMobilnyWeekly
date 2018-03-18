#!/usr/bin/env bash

set -e

currentVersionCode=$(grep 'versionBuild = ' WykopMobilny/build.gradle | sed -r 's/versionBuild = //g;s/ //g');
versionMajor=$(grep 'versionMajor = ' WykopMobilny/build.gradle | sed -r 's/versionMajor = //g;s/ //g');
versionMinor=$(grep 'versionMinor = ' WykopMobilny/build.gradle | sed -r 's/versionMinor = //g;s/ //g');
versionPatch=$(grep 'versionPatch = ' WykopMobilny/build.gradle | sed -r 's/versionPatch = //g;s/ //g');

newVersionCode=$((currentVersionCode+1))

echo "New version code is ($newVersionCode) replacing"

sed --in-place -r "s/versionBuild = ${currentVersionCode}/versionBuild = $newVersionCode/" WykopMobilny/build.gradle

export OWMVERSION="$versionMajor.$versionMinor.$versionPatch.$newVersionCode"
