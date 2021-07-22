Cue will reference a value from the nearest enclosing scope. Some quirks are:
- fields without quotes you can reference as identifiers and with dot,
- fields with quotes require index.
- fields defined across scopes require sufficient paths to resolve.

An alias defines a local value which is not part of the struct. They can be used for accessing shadowed fields, naming intermediate calculations or expressions, and more. They will not be output.

Hidden fields and values are prefixed with underscores. You can reference them in the current package and optionally show them when evaluating. Use quotes if you want a real label that begins with an underscore.

Cue can resolve many cycles, as long as they resolve to a final, concrete value.

Structural cycles and recursion are not allowed in Cue. We can define infinite structures as long as the data is finite.

