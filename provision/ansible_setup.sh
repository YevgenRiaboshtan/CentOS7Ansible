#!/usr/bin/env bash
set -x

# CentOS
sudo sed -i -b -e "s/keepcache=0/keepcache=1/g" /etc/yum.conf
if ! hash ansible 2>/dev/null; then
    #sudo rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
	sudo yum install epel-release -y
    sudo yum install ansible -y
    sudo yum install libselinux-python -y
else
    echo "Ansible already installed";
fi

# W przypadku, gdy hostem jest Windows, pliki w katalogu /vagrant
# (montowane przez shared folders VBox'a) mają uprawnienia 777,
# a ansible ma problem z użyciem pliku hosts z uprawnieniem execute
LOCAL_ANSIBLE_HOSTS=/home/vagrant/.ansible_hosts

cp -f /vagrant/provision/ansible_hosts $LOCAL_ANSIBLE_HOSTS
chmod 600 $LOCAL_ANSIBLE_HOSTS

mkdir -p /home/vagrant/.ssh
cp -f /vagrant/.vagrant/machines/default/virtualbox/private_key /home/vagrant/.ssh/private_key
chmod 700 /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/private_key

cd /vagrant/provision
export PYTHONUNBUFFERED=1
export ANSIBLE_HOST_KEY_CHECKING=False
export ANSIBLE_FORCE_COLOR=true
ansible-playbook -i $LOCAL_ANSIBLE_HOSTS main.yml --limit localhost -vv
