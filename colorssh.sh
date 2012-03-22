#!/bin/bash
# http://stackoverflow.com/questions/1905645/whats-an-easy-way-to-have-terminal-use-a-different-color-based-on-ssh-host-name

function setTerminalColors {
    osascript \
        -e "tell application \"Terminal\"" \
        -e "tell selected tab of front window" \
        -e "set normal text color to $1" \
        -e "set background color to $2" \
        -e "end tell" \
        -e "end tell"
}


for ARG in $*
do
    case "$ARG" in
        bnter.com)
          setTerminalColors "{65535,65535,65535}" "{32767,0,0}";;
        banters.com)
            setTerminalColors "{65535,65535,65535}" "{32767,0,0}";;
        banters.com1)
            setTerminalColors "{65535,65535,65535}" "{32767,0,0}";;
        banters.com2)
            setTerminalColors "{65535,65535,65535}" "{32767,0,0}";;
        banters.com3)
            setTerminalColors "{65535,65535,65535}" "{32767,0,0}";;
        banters.com4)
            setTerminalColors "{65535,65535,65535}" "{32767,0,0}";;
        bnterdev.com)
            setTerminalColors "{65535,65535,65535}" "{6425,6425,28784}";;
        sandbox.banters.com)
            setTerminalColors "{65535,65535,65535}" "{38550,19275,0}";;
    esac
done

ssh $*

# back to normal
setTerminalColors "{0,65535,0}" "{0,0,0}" 
