#!/usr/bin/env bash

set -e

currentVersionCode=$(grep 'versionBuild = ' WykopMobilny/build.gradle | sed -r 's/versionBuild = //g;s/ //g');

newVersionCode=$((currentVersionCode+1))

echo "New version code is ($newVersionCode) replacing"

sed --in-place -r "s/versionBuild = ${currentVersionCode}/versionBuild = $newVersionCode/" WykopMobilny/build.gradle

export OWMBUILDVERSION=$((newVersionCode))
