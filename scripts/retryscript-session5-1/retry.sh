#!/bin/bash

VERBOSE=0
NUM=3
INTERVAL=5
SECCESS=1

function help {
  cat <<EOL
Usage: $0 [OPTIONS] COMMAND

Available Options:
    -h: Show this help output
    -v: Verbose mode
    -n: Number of tries (Default: 5)
    -i: Interval second (Deafult: 10)
Examples: 
  $0 -v COMMAND
  $0 -v -n 3 -i 2 COMMAND
  $0 -v -i 5 COMMAND
  $0 -i 5 -n 2 COMMAND

EOL
}

function check_number {
  if [[ "$1" =~ ^[0-9]+$ ]]; then
    return 0
  else
    return 1
  fi
}

if [[ $# -eq 0 ]]; then
  help
  exit 0
fi

while [[ $# -ne 0 ]]; do
  case $1 in
  -h)
    help
    exit 0
    ;;
  -v)
    VERBOSE=1
    shift
    ;;
  -n)
    check_number $2
    if [[ $? -ne 0 ]]; then
      help
      exit 1
    fi
    NUM=$2
    shift 2
    ;;
  -i)
    check_number $2
    if [[ $? -ne 0 ]]; then
      help
      exit 1
    fi
    INTERVAL=$2
    shift 2
    ;;
  *)
    COMMAND=$@
    break
    ;;
  esac
done

if [[ -z $COMMAND ]]; then
  help
  exit 0
fi

for i in $(seq 1 $NUM); do
  $($COMMAND)
  if [[ $? -eq 0 ]]; then
    SUCCESS=0
    break
  else
    if [[ $VERBOSE -eq 1 ]]; then
      echo "Try $i failed. Sleep for $INTERVAL second..."
    fi
    sleep $INTERVAL
  fi
done

if [[ $SECCESS -eq 0 ]]; then
  if [[ $VERBOSE -eq 1 ]]; then
    echo "Command got executed successfully."
  fi
  exit 0
else
  if [[ $VERBOSE -eq 1 ]]; then
    echo "Threshold reached and Command opration failed."
  fi
  exit 1
fi
