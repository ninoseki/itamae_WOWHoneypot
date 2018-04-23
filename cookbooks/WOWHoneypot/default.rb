"git python3 ufw".split.each { |name| package name }

["sudo ufw default DENY", "sudo ufw allow 80/tcp", "sudo ufw allow 8080/tcp", "sudo ufw allow 2222/tcp", "sudo ufw allow 22/tcp"].each do |command|
  execute command
end

remote_file "/etc/ufw/before.rules"

["yes | sudo ufw enable", "sudo ufw reload"].each { |command| execute command }

git "/opt/wowhonypot" do
  repository "https://github.com/morihisa/WOWHoneypot.git"
end

