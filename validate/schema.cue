#labels: [string]: string

#metadata: {
	name:       string
	namespace?: string // optional
	labels:     #labels
	//labels:     #labels // template and defines labels as a 
	// struct with string fields with string values.
	annotations?: [string]: string // optional list of strings
	...
}

// require the following keys for labels
#requiredLabels: #labels & {
	app:  string
	env:  string
	team: string
}

// for env, limit the choices and default to dev with '*'
#defaultLabels: #requiredLabels & {
	env: *"dev" | "stg" | "prd"
}

// set concrete values to be reused
#myLabels: #defaultLabels & {
	app:  "cuetorials"
	team: "hofstadter"
}

//cue vet object.yaml schema.cue -d "#Schema"
//The extra -d "<path>" tells Cue the value we want to use to validate each Yaml 
//entry against. We have to do this because Cue defaults to using top-level 
//information, but we have three different schemas, one for each resource, and 
//so we needed the disjunction and selector to make this work.
#Schema: #Deployment | #Service | #Ingress

// Additionally apply our labels buildup to the resources
#Schema: {
	metadata: #metadata & {labels: #myLabels}
}

#Deployment: {
	ApiVersion: "apps/v1"
	kind:       "Deployment"
	metadata:   #metadata
	spec: {
		selector: {
			matchLabels: metadata.labels
		}
		strategy: {...}  // empty struct
		minReadySeconds: uint
		template: {...} // empty struct
	}
	...
}

#Service: {
	apiVersion: "v1"
	kind:       "Service"
	metadata:   #metadata
	spec: {
		selector: metadata.labels //ensures that the labels are the same between 
		//the respective sections of the resources.
		type: string
		ports: [...{...}] // list of structs. Think as [...int], in this

		// case is a list of empty structs
	}
	...
}

#Ingress: {
	apiVersion: "extensions/v1beta1"
	kind:       "Ingress"
	metadata:   #metadata
	spec: {...} // empty struct
	...
}
