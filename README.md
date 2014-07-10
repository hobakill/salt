salt
====

This is a public repo for all my salt scripts, states, etc.

I created this script because I couldn't figure out a simple, straight-forward way to install the salt-minion binary on a VM cloned from a CentOS 6.5 template. In guest customization, there is no Linux version of "Runonce" that you see on the Windows side. This frustrated me and all the Google-ing in the world didn't help.

I'll continue to add to this README but if you have any questions feel free to ask. 

rc.local.salt:

Please rename this to "rc.local" or copy and paste into your existing /etc/rc.local file.

In my rather wordy and over-commented script file please remember to change a few things to make this work in your environment:

1 - Change the MAC address for your template
2 - Change the HOSTNAME for your template

This script is known-good for CentOS 6.5 x86_64 and VCenter 5.1

