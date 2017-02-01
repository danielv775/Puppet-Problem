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
2. vagrant up --provider virtualbox
   
   The above command will start a VM using ubuntu 16.04, more specifically (ubuntu-16.04-64-puppet)
3. Using the Vagrantfile and the puppet_excercise.pp manifest file, the Nginx webserver will install on 
   the localhost and listen for requests on port 8000. 
4. To verify the correct webpage (https://raw.githubusercontent.com/puppetlabs/exercise-
   webpage/master/index.html) is being hosted, run the command "curl http://localhost:8000". This will return the html of the webpage.
5. Additonally, the command "systemctl status nginx" can be used to verify the server is running.
6. To reconfigure the server , run the command "puppet apply puppet_excercise.pp". Whatever the system 
   state, this will reconfigure everything as described in the manifest file.

#Questions 

1. Describe the most difficult/painful hurdle you had to overcome in implementing your solution.

    The most difficult hurdle was simply learning how to use all of the tools and how everything fit together. I had not used puppet, nginx, or vagrant before. I aimed to learn just enough about each to develop a solution to the problem. This involved lots of reading and looking through examples.

2. Please explain why requirement (ii) above might be important.

   ii. is important because the solution must be idempotent. Every execution of the solution must produce the same result. This requirement drove me to use a puppet manifest file to implement the solution. The puppet manifest file describes how the environment should be configured and it eliminates redundant steps on subsequent executions.

3. Where did you go to find information to help you in the build process?

   Reading through docs on puppet.com, vagrant.com, and googling unique and unexpected errors which would usually direct me to github.com or stackoverflow.com

4. Briefly explain what automation means to you, and why it is important to an organization's  
   infrastructure design strategy.

   To me automation is about making infrastructure design as efficient as possible. Specifically for technical organizations, automation is critical to an organization's infrastructure design strategy. If setting up a complex development environment can be as easy a executing one script, or using one puppet manifest file, more time can be spent on developing the product. 