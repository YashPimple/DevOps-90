## MASTER_CONFIG

- sudo apt-get update 
- curl -O https://apt.puppetlabs.com/puppet6-release-bionic.deb
- sudo dpkg -i puppet6-release-bionic.deb
- sudo apt-get update
-  sudo apt-get install puppetmaster
-   sudo apt-get install puppetserver -y
-     sudo vim /etc/hosts
-  sudo vi /etc/default/puppetserver
-    sudo systemctl enable puppetserver.service
-  sudo systemctl start puppetserver.service
-   sudo systemctl status puppetserver.service
- sudo puppet cert list
- sudo /opt/puppetlabs/bin/puppetserver ca list
- sudo systemctl restart puppetserver.service
- sudo apt-get install puppet
- sudo puppet cert list
- sudo /opt/puppetlabs/bin/puppetserver ca list
- sudo ufw allow 8140
- sudo /opt/puppetlabs/bin/puppetserver ca list
- sudo systemctl restart puppetserver.service
- sudo /opt/puppetlabs/bin/puppetserver ca list
- sudo ufw allow 8140/tcp
-  sudo systemctl restart puppetserver.service
- sudo systemctl enable puppetserver.service
- sudo /opt/puppetlabs/bin/puppetserver ca list
- sudo /opt/puppetlabs/bin/puppetserver ca sign --certname ip-172-31-32-223.ap-northeast-1.compute.interna
- sudo vi /etc/puppetlabs/code/environments/production/manifests/site.pp


## SLAVE_CONFIG

- curl -O https://apt.puppetlabs.com/puppet6-release-bionic.deb
- sudo dpkg -i puppet6-release-bionic.deb
- sudo apt-get update
- sudo apt-get install puppet
-   sudo vi /etc/hosts
-     sudo systemctl enable puppet
- sudo systemctl restart puppet
- sudo systemctl status puppet
    9  history
   10  sudo cat /etc/hosts
   11  sudo systemctl status puppet
   12  sudo systemctl restart puppet
   13  sudo systemctl status puppet
   14  sudo systemctl restart puppet
   15  sudo systemctl status puppet
   16  sudo systemctl restart puppet
   17  sudo systemctl enable puppet
   18  sudo systemctl restart puppet
   19  sudo systemctl status puppet
   20  sudo /opt/puppetlabs/bin/puppet agent --test
   21  sudo puppet agent --test
   22  sudo cat /tmp/puppet_test.txt
   23  sudo puppet agent --test
   24  sudo cat /tmp/puppet_test.txt
