#!/bin/bash
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
set -ex

BUILD_OPTS="-Divy.home=${HOME}/.ivy2 -Dsbt.ivy.home=${HOME}/.ivy2 -Duser.home=${HOME} \
            -Drepo.maven.org=$IVY_MIRROR_PROP \
            -Dreactor.repo=file://${HOME}/.m2/repository \
            -DskipTests -DrecompileMode=all"

export MAVEN_OPTS="-Xmx2g -XX:ReservedCodeCacheSize=512m -XX:PermSize=1024m -XX:MaxPermSize=1024m"
./gradlew -PscalaVersion=${SCALA_VERSION} clean releaseTarGz -x signArchives

#m -rf build
#kdir build

#p core/build/distributions/kafka_*.tgz build/`basename core/build/distributions/kafka* .tgz`.tar.gz
