Cue’s evaluation model prevents you from changing values and interacting with the outside world, where values can change between runs. This is done to enforce consistency. To work with the external world, Cue has a tooling layer where you can access the execute commands, read and write files, or make network calls.
• https://pkg.go.dev/cuelang.org/go@v0.3.0-alpha5/pkg/tool

 there are a couple of differences from regular cue:

• scripting files have a _tool.cue suffix
• commands are run with cue cmd <name>

You will also be able to use your “pure” Cue from these files, but not the other way around (as this would break the rules).

• Cue explicitly prevents computation
• But we need to often combine these configuarations and tasks in ops
• Cue scripting / workflow

Cue’s evaluation model prevents you from changing values and interacting with the outside world, where values can change between runs. This is done to enforce consistency. o work with the external world, Cue has a tooling layer where you can access the execute commands, read and write files, or make network calls.
To use this system, there are a couple of differences from regular cue:

• scripting files have a _tool.cue suffix
• commands are run with cue cmd <name>

Tool files have a common format:

• command: <name>: { ... } are the commands you can call with cue cmd.
• Each command has a number of tasks <task name>: <task type> & { ... }. The task types come from the tool/... builtins.
• Task types have different fields, some are inputs and others are outputs
• Tasks will run concurrently by default. They will be ordered into a DAG if there are references to other tasks.

