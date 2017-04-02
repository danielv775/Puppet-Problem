# Puppet-Problem
Automate installation and configuration of Nginx Webserver

# How to Apply Solution

Assumptions:

Tested on a ubuntu-16.04-64-puppet vagrantbox

Tested with Vagrant Version 1.9.1

Tested with Virtualbox Version 5.1.14

Only works with Virtualbox VM

Local Machine OS: Mac OSX El Capitan Version 10.11.6

1. Pull the source code from this repo. Ensure you have "envenv/sub_env/manifests/puppet\_excercise.pp" 
   and "Vagrantfile" in the same directory.
2. <code>vagrant up --provider virtualbox</code>
   
   The above command will start a VM using ubuntu 16.04, more specifically (ubuntu-16.04-64-puppet)
3. Using the Vagrantfile and the puppet_excercise.pp manifest file, the Nginx webserver will install on 
   the localhost and listen for requests on port 8000. 
4. <code>vagrant ssh</code>
5. To verify the correct 
   [webpage](https://raw.githubusercontent.com/puppetlabs/exercise-webpage/master/index.html) is being  
   hosted, run the command <code>curl http://localhost:8000</code>. This will return the html of the webpage.
6. Additonally, the command <code>systemctl status nginx</code> can be used to verify the server is 
   running.
7. To reconfigure the server , run the command <code>puppet apply puppet_excercise.pp</code>. Whatever
   the system state, this will reconfigure everything as described in the manifest file.
