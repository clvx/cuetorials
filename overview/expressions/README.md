
Cue has the typical math operations for numbers. Multiplication also works for strings and lists. Additional math operations can be found in the Cue’s math package .
- https://pkg.go.dev/cuelang.org/go@v0.3.0-alpha6/pkg/math

Cue has the expected relative comparison operators and semantics. Equality checks are handled by value unification.

Cue has the following predefined bounds for sized numbers
int8      >=-128 & <=127
int16     >=-32_768 & <=32_767
int32     >=-2_147_483_648 & <=2_147_483_647
int64     >=-9_223_372_036_854_775_808 & <=9_223_372_036_854_775_807
int128    >=-170_141_183_460_469_231_731_687_303_715_884_105_728 &
              <=170_141_183_460_469_231_731_687_303_715_884_105_727

uint      >=0
uint8     >=0 & <=255
uint16    >=0 & <=65536
uint32    >=0 & <=4_294_967_296
uint64    >=0 & <=18_446_744_073_709_551_615
uint128   >=0 & <=340_282_366_920_938_463_463_374_607_431_768_211_455

rune      >=0 & <=0x10FFFF

Cue supports regular expression constraints with the =~ and !~ operators.
They are based on Go’s regular expressions. Cue also has some additional regexp helpers .:w
• https://golang.org/pkg/regexp/
• https://pkg.go.dev/cuelang.org/go@v0.3.0-alpha6/pkg/regexp


Cue supports interpolation in strings and bytes with \(<expr>)
• For more complicated scenarios, you can use the text/template package.
• https://pkg.go.dev/cuelang.org/go@v0.3.0-alpha6/pkg/text/template
• You can also interpolate field names.


Cue has list comprehensions to dynamically create lists. You can iterate over both lists and struct fields.

[ for key, val in <iterable> [condition] { production } ]

• key is the index for lists and the label for fields

Cue also has the ability to comprehend fields.

Conditional fields, or guarded fields (if technically means guard), are another form of field comprehension.
Some important notes to make from the usual understanding of if’s:
• there is not an else statement, you have to have two with opposite conditions
• there is no shortcircuiting of booleans, all conditions will be evaluated

