package function

import "strings"

// An input schema
#Input: {
	count: int
	msg:   string
}

// An output schema
#Output: {
	val: string
}

#Transform: {
	// Input for the caller
	_in: #Input
	// output for the caller
	out: #Output

	// intermediate fields
	_upper: strings.ToUpper(_in.msg)
	_msg:   strings.Join([_upper]*_in.count, " ")

	// set output
	out: val: _msg
}

// Call transform
loudly: #Transform & {_in: {msg: "ra", count: 3}}
