Standard library:
• https://pkg.go.dev/cuelang.org/go@v0.3.0-alpha6/pkg
There are broadly two types of packages
• Hermetic functions which you can use from pure.cue files.
• Non-hermetic functions which interact with the outside world. These are for the scripting layer in _tool.cue files.

Pure Packages

    crypto/...: Hash calculations
    encoding/...: To / from [base64, csv, hex, json, yaml]
    html: For (un)escaping HTML strings
    list: For working with lists
    math: Extra advanced functions
    net: Constraints for network releated values
    path: Work with filepaths with OS awareness
    regexp: More advanced regexp functions
    strconv: Format and parse numbers, quote and unquote runes
    strings: Advanced helpers for working with strings
    struct: Set min and max fields allowed
    text/tabwriter: Write tabular data
    text/template: Advanced string templates
    time: Format, parse, and constraint times and durations
