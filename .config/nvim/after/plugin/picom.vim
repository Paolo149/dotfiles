if system('pgrep -x picom > /dev/null && echo 1 || echo 0') == 1
	highlight Normal guibg=NONE
else
	highlight Normal guibg=#282A36
endif
