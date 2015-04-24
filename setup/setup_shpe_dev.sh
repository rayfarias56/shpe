#vagrant
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

#Dependencies
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev -y
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev -y 
sudo add-apt-repository ppa:chris-lea/node.js -y
sudo apt-get update
sudo apt-get install nodejs -y
#install rvm and ruby
curl -sSL https://get.rvm.io | bash -s stable --ruby
source ~/.rvm/scripts/rvm 
source ~/.rvm/scripts/rvm >> .bashrc
rvm install 2.0
rvm use 2.0 --default
ruby -v

#Set up repo
ssh-keyscan github.com >> ~/.ssh/known_hosts
sudo gem install bundler
bundle install --without production staging
rake db:create
rake db:migrate
rake db:seed
rails s
