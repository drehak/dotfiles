# export PS1="\[\e[93m\]\t\[\e[m\] \[\e[97m\]\u\[\e[m\]\[\e[91m\]@\[\e[m\]\[\e[97m\]\h\[\e[m\] \[\e[96m\]\w\[\e[m\] "
export PS1="\[\e[93m\]\t\[\e[m\] \[\e[96m\]\w\[\e[m\] "
alias bashrc="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias yt="youtube-dl"
alias ytx="youtube-dl -x"

function n() {
	local threshold=16
	local file=~/notes
	local lines

	if [ "$1" != "" ]; then
		echo "$@" >> $file
		return 0
	fi
	if [ ! -f $file ]; then
		echo " === no notes ===" 
		return 1
	fi
	lines=$(cat $file | wc -l)
	if [ $(( $lines > $threshold )) = 1 ]; then
		echo " === last $threshold lines ===" 
	fi
	tail -n $threshold $file
	return 0
}
