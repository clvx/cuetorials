package inject

// @tag() is how we inject data
username: string @tag(username)
password: string @tag(password)

// A schema for database with some defaults
#DB: {
	host: string
	port: string | *"5432"
	db:   string | *"mydb"
	user: username
	pass: password

	//interpolate the fields into the connection string
	conn: "postgres://\(user):\(pass)@\(host):\(port)/\(db)"
}

//setup our databases
database: [Env=string]: #DB
database: {
	dev: host:   "postgres.dev"
	stage: host: "postgres.stage"
	prod: host:  "postgres.prod"
}

//# -t key=value  -e to eval a specific value
//$ cue eval inject.cue -t username="someone" -t password="abc123" -e database.dev.conn
