Top and Bottom are special values in Cue. They form the opposite ends of the value lattice.
• “_” is top and matches all values
• “_|_” is bottom and represents an error

Errors result in bottom with a message attached. You can get errors for incomplete types when exporting Cue to data or for conflicts and invalid semantics in your code.

Null coalescing allows us to provide fallback values when errors occur. This is technically error coalescing since null is a vaid value. This works by using disjunctions and defaults.

Cue defines two number kinds:

• int are whole numbers, implemented as BigInt to represent any value, and can be constrained for byte size (like int64)
• number are decimals numbers, (also not bounded by byte size, also constrainable?), ints are also numbers.

Cue has syntactic sugar for writing numbers too:

• 0x, 0o, 0b for hex, octal, and binary
• K, M, G, T, P for sizing with optional i
• e/E for decimal exponents
• Underscores for visual readability for large numbers

Cue strings are valid UTF-8 sequences with some escaping options, the escape sequence are:
\a   U+0007 alert or bell
\b   U+0008 backspace
\f   U+000C form feed
\n   U+000A line feed or newline
\r   U+000D carriage return
\t   U+0009 horizontal tab
\v   U+000b vertical tab
\/   U+002f slash (solidus)
\\   U+005c backslash
\'   U+0027 single quote  (valid escape only within single quoted literals)
\"   U+0022 double quote  (valid escape only within double quoted literals)

\nnn   for octals         (valid escape only within single quoted literals)
\xnn   for hex            (valid escape only within single quoted literals)

\uXXXX  for unicode
\UXXXXXXXX for longer unicode

Cue allows you to modify the string delimiters so you can avoid escaping. Use any number of # on both ends of normal strings

Bytes are single quoted and base64 encoded when output.

Cue lists have arbitrary elements of mixed types. They can optionally be open and predefine some elements. Mismatched elements result in errors.

Structs are like JSON objects. They are the primary composite type in Cue. They have a set of fields (label: value). By default, they are open and you can add more fields.

Definitions are very similar to structs and are primarily used for schemas. They are closed by default and are not emitted by Cue when exporting.

You can embed structs and definitions within each other as a method to build up values. 

Pattern matching allows you to specify constraints for labels which match a pattern. 
	- https://github.com/cuelang/cue/issues/165
