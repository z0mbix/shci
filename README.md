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
	    - echo 'Uploading build artifact to S3'
	    - make clean
	success:
	    - echo 'Sending celebratory email to the boss'
	    - echo 'Sending happy message to HipChat'
	failure:
	    - echo 'Sending email to those that care'
	    - echo 'Sending sad message to HipChat'

Save this in the root of your project/repository.

### Usage

Running shci with the example yaml build config from above:

	$ ./shci
	Performing pre
	Cleaning stuff up...

	Performing build
	Running tests...
	Building 2b4ccc8cdfc42a81ddced3e2ea9015881787fc61 on master
	Creating tarball release: shci-2b4ccc8cdfc42a81ddced3e2ea9015881787fc61.tar.gz

	Performing post
	Uploading build artifact to S3
	Cleaning stuff up...

	build_result: post success:
	Sending celebratory email to the boss
	Sending happy message to HipChat

**shci** will look for the file **.shci.yml** in the root of your codebase/repository and run the commands specified in each section in the obvious order.

You can specify an alternative yaml build file with the **-f** option:

	$ ./shci -f build.yaml

You can also specify the location of the repository with the **-d** option:

	$ ./shci -d ~/Projects/myrepo

## Build Failures

	$ ./shci
	Performing pre
	Cleaning stuff up...

	Performing build
	Running tests...
	shci: line 111: unexpected EOF while looking for matching `''
	shci: line 112: syntax error: unexpected end of file
	make: *** [test] Error 1
	build_result: build failure: make test
	Sending email to those that care
	Sending sad message to HipChat

## Uses

Could be used with the excellent [phayes/hookserve](https://github.com/phayes/hookserve) for very simple Github based CI.

** Known Issues

- This isn't fully working yet
- Should be better at parsing yaml or just replace yaml
- Only supports git

