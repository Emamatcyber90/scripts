#!/bin/sh

FILENAME=iptables.firewall.rules
FILENAME_6=ip6tables.firewall.rules

RULES_FILE=/etc/$FILENAME
RULES_6_FILE=/etc/$FILENAME_6

# Thank you for this CWD script, @glenn-jackman
# http://stackoverflow.com/a/1820039/2780033
CWD=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

if [ ! -s $RULES_6_FILE ]; then
    echo "You need some IPv6 firewall rules for sure."
    if [ -s $CWD/$FILENAME_6 ]; then
        sudo cp $FILENAME_6 $RULES_6_FILE
        echo "I made you some default ones."
        echo "OK I got them from here:"
    else
        echo "Could not put some default ones where they need to go."
        echo "Check this out for details on how to do it manually:"
    fi
    echo "https://www.linode.com/docs/security/securing-your-server#basic-iptables-rulesets-for-ipv4-and-ipv6"
else 
    sudo ip6tables-restore < $RULES_6_FILE
    echo "IPv6 rules applied."
fi

if [ ! -s $RULES_FILE ]; then
    echo "You need some IPv4 firewall rules for sure."
    if [ -s $CWD/$FILENAME ]; then
        sudo cp $FILENAME $RULES_FILE
        echo "I made you some default ones."
        echo "OK I got them from here:"
    else
        echo "Could not put some default ones where they need to go."
        echo "Check this out for details on how to do it manually:"
    fi
    echo "https://www.linode.com/docs/security/securing-your-server#basic-iptables-rulesets-for-ipv4-and-ipv6"
else
    sudo iptables-restore < $RULES_FILE
    echo "IPv4 rules applied."
fi
