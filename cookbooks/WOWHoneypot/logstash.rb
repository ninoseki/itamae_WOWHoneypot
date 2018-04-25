"openjdk-8-jdk wget".split.each { |name| package name }

execute "wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -"
execute "sudo apt-get install apt-transport-https"

remote_file "/etc/apt/sources.list.d/elastic-6.x.list"

execute "sudo apt-get update"
package "logstash"

remote_file "/etc/logstash/conf.d/wowhoneypot.conf"

execute "chown -R logstash:logstash /etc/logstash"

execute "sudo systemctl start logstash"
