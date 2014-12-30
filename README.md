Simple Shell CI Build System
----------------------------



**.shci.yml** example file

	pre-build:
    	- make clean
	build:
    	- make test
    	- make build
	    - make release
	post-build:
	    - echo 'Sending email to those that care'
	    - echo 'Sending a message to HipChat'

Running shci:

	$ ./shci

This will look for the file **.shci.yml** in the root of your codebase/repository

** Known Issues

- Should be better at parsing yaml
