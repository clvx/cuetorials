CUE stands for Configure, Unify, Execute
Cue is a purpose built logical language for working with config, schemas, data, and executing on these things.
Cue is not a general purpose language and instead aims for Turing-incompleteness.
Cue is a superset of JSON. This means you can represent any JSON in Cue with a slightly different syntax.
Cue merges types and values into a single concept, the value lattice. This gives us the ability to define schemas, refine with constraints, and create valid data in the same file.
In Cue, types, values, and constraints are all the same. There is no difference (to Cue) between the schema, the data, or the rules
Cue has  value hierarchy which connects top (_), the any value, to bottom (_|_), the void value. Technically it is a lattice or partially ordered set of values where every pair of values has a unique upper bound and a greatest lower bound. The entire lattice starts from a singular root (top, _, any), ends with a single leaf (bottom, _|_, void), and all other values are between these two, partially ordered.

With Cue you are specifying something and Cue tells you if it is valid or not.  Under the hood, Cue analyzes your code with graph unification algorithms based in part on NLP techniques.

Cue can read all JSON and represent it, while not all Cue is representable as JSON. When representing JSON in Cue, the differences are:

• There are // single line comments
• Objects are called structs
• Object members are called struct fields
• Quotes can be omitted for field names without special characters
• You don’t need commas after struct fields
• You can place a comma after the last element in a list
• The outermost curly braces are optional

A value hierarchy which connects top (_), the any value, to bottom (_|_), the void value. Technically it is a lattice or partially ordered set of values where every pair of values has a unique upper bound and a greatest lower bound. The entire lattice starts from a singular root (top, _, any), ends with a single leaf (bottom, _|_, void), and all other values are between these two, partially ordered.

Every instance lives somewhere in Cue’s Value Lattice. The most open value is “top” or _ which matches any instance. The most restricted value is “bottom” or _|_ and represents invalid instances, conflicts, and errors. Every other instance is in between, and partially ordered when compared to other instances. 

Most languages do not make constraints or validation a first-class concept. Cue does, with constraints, which place rules or restrictions on values. Like all instances, they live in the value lattice between schemas and fully specified values.

Values cannot be changed. There are no overloads or overrides in Cue. This has implications on how you write and organize code.
Cue allows fields to be defined more than once as long as they are consistent with each other:
• basic data types must be the same
• you can make a field more restrictive, but not the other way
• structs fields are merged, list elements must match exactly
• the rules are applied recursively

Definitions are Cue’s way of specifying schemas. They have slightly different rules from structs.

• They are not output as data.
• They may remain incomplete or under.
• They “close” a struct, forbidding unknown or additional fields.

You indicate a definitions with #mydef: and can leave it open with ...

Conjunctions “meet” values together, combining their fields, rules, and data. They are like “and” and the & operator is used for them.
Disjunctions “join” values to create options or alternatives. They are like “or” and the | operator is used for them.

• enums (as values)
• sum-type (any of these types)
• null-coalescing (use this computation, or default to some value)

Cue supports setting defaults for values or marking a field optional.

An incomplete value is one which does not have all fields filled with data. Cue will not export incomplete values and instead return an error. By contrast, concrete is a fully specified value.

Open means a struct can be extended, closed means they cannot. By default structs are open and definitions are closed. 

In Cue, it is recommended to start small and build values up. This makes schemas reusable.

Cue’s unification system resolves values, schemas, and correctness regardless of order and which files may contain them.

Cue is Turing-incomplete, meaning you will not program like typical languages. Rather, you will provide values, types, definitions, and constraints; and Cue will tell you if what you have written is correct. 
• wrap code in data, not data in code
• no primitive recursion or inheritance
• the initial learning curve is worth the long-term maintenance
