# tell ls to be colourful
export CLICOLOR=1

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# and now hit flounder .bashrc
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
#export JAVA_HOME=$(/usr/libexec/java_home)

# added by Anaconda 2.0.0 installer
export PATH="/Users/cmartin/anaconda/bin:$PATH"

# added by Anaconda 2.0.0 installer
export PATH="/Users/cmartin/anaconda/bin:$PATH"
