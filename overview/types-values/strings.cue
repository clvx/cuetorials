package stdlib

import "strings"

str: "hello world"
smile: "\U0001F60A"
quoted: "you can \"quote by escaping \\ \""
multiline: """
hello world
a "quoted string in a string"
down under
   - some author
"""

s: "HelloWorld"

u: strings.ToUpper(s)
l: strings.ToLower(s)

line: "Cue stands for configure, unify, execute"
words: strings.Split(line, " ")
lined: strings.Join(words, " ")

haspre: strings.HasPrefix(line, "Cue")
index:  strings.Index(line, "unify")


