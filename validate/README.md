
Cue can turn Go types into Cue definitions.

- This is helpful when you have existing code and you want to validate Yaml or JSON that will be unmarshaled into these types.
- You can also generate Go helpers functions for validating these types from the Cue schema.
	- https://cuelang.org/docs/integrations/go/#generate-go-code

Before we can import Go to Cue:

1. we need to setup a file needed for Cue modules to work.

2. Download the Kubernetes API code (you need a local copy)
	```
	#"go get" the Kubernetes code
	go get -u k8s.io/api/... k8s.io/apimachinery/...
	```
3. Import the Go into Cue definitions
	```
	#"cue go get" to import into Cue defs
	cue get go k8s.io/api/... k8s.io/apimachinery/...
	```
4. Apply the Kubernetes Cue to our Cuetorials Cue
	```
	package cuetorials

	import (
		apps "k8s.io/api/apps/v1"
		core "k8s.io/api/core/v1"
		extn "k8s.io/api/extensions/v1beta1"
	)

	deployment: [string]: apps.#Deployment
	service: [string]: core.#Service
	ingress: [string]: extn.#Ingress

	// ...
	```
5. Validate that our config complies with the Kubernetes spec
	
	`cue eval ./...`
	
Cue has a module and package system like any proper language. With modules and packages, you also have imports.
Cue’s module system is very similar to Go’s, but has it’s differences.

- A module name has a particular format:
	- domain.com/name is the minimal
	- github.com/owner/repo is common
	- imports without a domain are assumed to be builtins from the standard library
	- You don’t actually need a domain or repository, it’s just a path naming requirement
- You must create a file (cue.mod/module.cue) to signify a module
- Modules are comprised of packages, Cue supports multiple packages in a directory
- Only absolute imports are allowed, no relative imports (for security reasons)
- You can rename imported packages at the time of import (like the k8s.io imports previously seen)
- Definitions and Values in the same package can be accessed across files without imports

While, Cue does not yet have a dependency management system, it will import and process them.


Cue dependencies are located in the `cue.mod/pkg/...` directory. From here, dependent modules are nested under directories mirroring their import path.
