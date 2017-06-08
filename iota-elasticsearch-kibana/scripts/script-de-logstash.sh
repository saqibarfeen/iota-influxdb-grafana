mkdir ~/workspace && cd ~/workspace
git clone https://saqibarfeen:cloud9net@github.com/cloud9network/observer9.git
cd observer9
mkdir -p /etc/logstash/conf.d
cp ./logging/logstash_config/* /etc/logstash/conf.d
