# simple-retry-script

A simple script to retry any command with specified switches.

## How to use:

```bash
Usage: retry.sh [OPTIONS] COMMAND
Options:
    -v              : Verbose mode.
    -n              : Number of tries.
    -i              : Interval second.
    -h              : Show help output
```

### Example:

```bash
  retry.sh COMMAND
  retry.sh -v COMMAND
  retry.sh -v -i 3 COMMAND
  retry.sh -v -i 3 -n 2 COMMAND
```
