# file-checker-practice

A simple file checker script.

## How to use:

```bash
Usage: filechecker <init|scan> [OPTIONS] <source_dir>
Options:
	--dbname <database>: Database file.
```

### Example:

```bash
filechecker init /etc ---> create db file
filechecker scan ---> scan db file to look for changing
```
