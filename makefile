git:
	git add .
	GIT_TRACE=1 git commit -a -m "$m" 
	git push -u origin
