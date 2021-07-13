import "time"

#Album: {
	artist: string
	title: string
	date: string & time.Format("2006-01-02")                        
//	date: string                        //same as above ...
//	date: time.Format("2006-01-02")     // ...
}

album: #Album

