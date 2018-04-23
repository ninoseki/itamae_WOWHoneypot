## install requirements
"git python3 ufw".split.each { |name| package name }

## set ufw rules
["sudo ufw default DENY", "sudo ufw allow 80/tcp", "sudo ufw allow 8080/tcp", "sudo ufw allow 2222/tcp", "sudo ufw allow 22/tcp"].each do |command|
  execute command
end

remote_file "/etc/ufw/before.rules"

["yes | sudo ufw enable", "sudo ufw reload"].each { |command| execute command }

## install WOWHoneypot
git "/opt/wowhoneypot" do
  repository "https://github.com/morihisa/WOWHoneypot.git"
end

remote_file "/opt/wowhoneypot/config.txt"
remote_file "/opt/wowhoneypot/wowhoneypot.sh"
execute "chmod +x /opt/wowhoneypot/wowhoneypot.sh"

user "wowhoneypot"
execute "sudo chown -R wowhoneypot:wowhoneypot /opt/wowhoneypot"

remote_file "/etc/systemd/system/wowhoneypot.service"

directory "/var/log/wowhoneypot" do
  owner "wowhoneypot"
  group "wowhoneypot"
end

## start the service
["sudo systemctl daemon-reload", "sudo systemctl enable wowhoneypot", "sudo systemctl start wowhoneypot"].each do |command|
  execute command
end

