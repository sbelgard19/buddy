git:
	export GPG_TTY=$(tty)
	git add .
	GIT_TRACE=1 git commit -S -m "$m" 
	git push -u origin
