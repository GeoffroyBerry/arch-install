#!/bin/sh
echo "What username do you want (will be added to wheel group)?"
read superuser
echo "Creating user $superuser with groups $superuser (main group) and wheel"
useradd -mU $superuser
usermod -G wheel $superuser 
echo "CHANGING $superuser PASSWORD"
passwd $superuser
echo "NOW manually edit sudoers : visudo /etc/sudoers (uncomment the desired setting)"
echo "and then? You good to go! You can login as $superuser and start owning"
