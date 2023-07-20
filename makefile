git:
	git add .
	GIT_TRACE=1 git commit -m "$m" 
	git push -u origin
