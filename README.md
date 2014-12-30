# Simple Shell CI Build System

### YAML Build Config

**shci** uses the yaml file **.shci.yml**. An example:

	pre-build:
    	- make clean
	build:
    	- make test
    	- make build
	    - make release
	post-build:
	    - echo 'Sending email to those that care'
	    - echo 'Sending a message to HipChat'

Save this in the root of your project/repository.

### Usage

Running shci with the example yaml build config from above:

	$ ./shci
	Performing pre
	Cleaning stuff up...
	pre success
	
	Performing build
	Running tests...
	Building c60694e75e8f5868c7135c17aab9ac41119f1791 on master
	build success
	
	Performing post
	Sending email to those that care
	Sending a message to HipChat
	post success

**shci** will look for the file **.shci.yml** in the root of your codebase/repository and run the commands specified in each section in the obvious order.

You can specify an alternative yaml build file with the **-f** option:

	$ ./shci -f build.yaml

You can also specify the location of the repository with the **-d** option:

	$ ./shci -d ~/Projects/myrepo

## Uses

Could be used with the excellent [phayes/hookserve](https://github.com/phayes/hookserve) for very simple Github based CI.

** Known Issues

- This isn't fully working yet
- Should be better at parsing yaml or just replace yaml
