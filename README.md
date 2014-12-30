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

This will look for the file **.shci.yml** in the root of your codebase/repository and run the commands specified in each section in the obvious order.

You can specify an alternative yaml build file with the **-f** option:

	$ ./shci -f build.yaml

You can also specify the location of the repository with the **-d** option:

	$ ./shci -d ~/Projects/myrepo

** Known Issues

- This isn't fully working yet
- Should be better at parsing yaml
