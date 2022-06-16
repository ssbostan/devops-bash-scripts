# simple-backup-script

A simple backup script to backup a directory to a compressed archive file.

## How to use:

```bash
Usage: backup [OPTIONS] <source_dir> <backup_name>
Options:
    -v              : Verbose mode.
    --date <format> : Add date to the backup filename.
                      Supported formats: time, date, datetime, timestamp
```

### Example:

```bash
backup --date datetime /opt mybackup.tar.gz
```
