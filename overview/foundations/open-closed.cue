// Closed struct - By default structs are open
s: close({
	foo: "bar"
})

// Open definition - By default definitions are closed
#d: {
	foo: "bar"
	... // must be last
}


