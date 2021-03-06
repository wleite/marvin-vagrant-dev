#!/usr/bin/env bash

# Copyright [2017] [B2W Digital]
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

echo '----------------------------------------------'
echo ' INSTALLING HIVE'
echo '----------------------------------------------'

sudo wget https://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key -O archive.key | sudo apt-key add -
sudo wget 'https://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/cloudera.list' \ -O /etc/apt/sources.list.d/cloudera.list

sudo wget https://archive.cloudera.com/cdh5/one-click-install/trusty/amd64/cdh5-repository_1.0_all.deb
sudo dpkg -i cdh5-repository_1.0_all.deb

sudo apt-get -qq update

sudo apt-get install -y hive
sudo apt-get install -y hive-metastore
sudo apt-get install -y hive-server2

sudo update-rc.d hive-metastore defaults
sudo update-rc.d hive-server2 defaults

sudo service hive-metastore restart
sudo service hive-server2 restart

hive --version

