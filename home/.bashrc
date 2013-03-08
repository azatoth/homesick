# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If running interactively, then:
if [ "$PS1" ]; then
        ulimit -c unlimited
        export PATH=$HOME/bin:/var/lib/gems/1.8/bin:$PATH

        # don't put duplicate lines in the history. See bash(1) for more options
        export HISTCONTROL=ignoredups

        # check the window size after each command and, if necessary,
        # update the values of LINES and COLUMNS.
        shopt -s checkwinsize

        # Set PKG_CONFIG_PATH to handle local also

        export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/lib/pkgconfig:/usr/X11R6/lib/pkgconfig
        #export CC="ccache gcc"

		# set variable identifying the chroot you work in (used in the prompt below)
		if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
			debian_chroot=$(cat /etc/debian_chroot)
		fi
        # enable color support of ls and also add handy aliases
        if [ "$TERM" != "dumb" ]; then
                eval `dircolors -b`
                alias ls='ls --color=always'
                alias dir='ls --color=always --format=vertical'
                alias vdir='ls --color=always --format=long'
        fi

		alias svn-grep='grep --exclude-dir=".svn"'
        # some more ls aliases
        alias ll='ls -l'
        alias la='ls -A'
        alias l='ls -CF'
        alias lsd='ls -d *'
        hcat()
        {
                lynx -dump $1 | cat;
        }
        hless()
        {
                lynx -dump $1 | less;
        }
        # some other alias
        alias s='cd ..'
        alias rm='rm -i'
        alias df='df -h'
        alias DF="df -h 2>&- | grep --regexp='^\/dev' | xargs -0 echo -ne \"Filesystem Size Used Avail Use% Mountpoint\n\" | column -t"

        alias cvsstatus="cvs status | grep Status | grep -v 'Up-to-date'"


        # set a fancy prompt
        # [suspended:return_value][username@short_host dir]$ 
        # red-underline for root
        CLEAR="\[\e[0m\]"
        DARK_CYAN="\[\e[0;36m\]"
        LIGHT_CYAN="\[\e[1;36m\]"
        DARK_MAGENTA="\[\e[0;35m\]"
        DARK_GREEN="\[\e[0;32m\]"
        LIGHT_GREEN="\[\e[1;32m\]"
        LIGHT_YELLOW="\[\e[1;33m\]"
        LIGHT_BLUE="\[\e[1;34m\]"
        LIGHT_RED_UNDERLINE="\[\e[1;4;31;31m\]"

        case `id -u` in
                0) _uid=$LIGHT_RED_UNDERLINE"\u";;
                *) _uid=$LIGHT_GREEN"\u";;
        esac

PS1=${debian_chroot:+($debian_chroot)}\
$DARK_MAGENTA"["\
$DARK_CYAN"\j"\
$DARK_MAGENTA":"\
$DARK_CYAN"\$?"\
$DARK_MAGENTA"]"\
$DARK_GREEN"["\
$_uid\
$LIGHT_BLUE"@"\
$LIGHT_GREEN"\h"\
$LIGHT_YELLOW" \W"\
$DARK_GREEN"]"\
'$(__git_ps1 " «%s»")'\
$LIGHT_CYAN"\$ "\
$CLEAR

        # $_topic


        # enable programmable completion features (you don't need to enable
        # this, if it's already enabled in /etc/bash.bashrc).
        if [ -f /etc/bash_completion ]; then
                . /etc/bash_completion
        fi
fi
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="verbose git"


export EMAIL="carl@excito.com"
export DEBFULLNAME="Carl Fürstenberg"
export PATH="/usr/lib/ccache:$PATH"

export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::") 
export AWS_RDS_HOME="$HOME/RDSCli"
export PATH=$PATH:$AWS_RDS_HOME/bin
export EC2_REGION=eu-west-1
export AWS_CREDENTIAL_FILE=$AWS_RDS_HOME/.credentials
export EC2_HOME=~/.ec2
KEYNAME=OP6GYEFRZBIEEN6LEIMGZ5RNGJ3CDNGV
export EC2_PRIVATE_KEY=$EC2_HOME/pk-$KEYNAME.pem
export EC2_CERT=$EC2_HOME/cert-$KEYNAME.pem

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
