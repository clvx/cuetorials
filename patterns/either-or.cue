#First: {
	foo: string
}

#Other: {
	msg: string
}

#Either: #First | #Other

#Thing: {
	name: string
	#Either
}

thing1: #Thing & {
	name: "thing1"
	foo:  "bar"
}

thing2: #Thing & {
	name: "thing2"
	msg:  "hello"
}

// this will fail #Either
//thing3: #Thing & {
//    name: "thing3"
//    random: "lol"
//}
