#!/bin/sh
eval $IMPORTS

ptrace_scope="$(cat /proc/sys/kernel/yama/ptrace_scope 2>/dev/null)"
if [ $? -eq 0 ]; then
    if [ $ptrace_scope -eq 0 ]; then
        ptrace_scope=$($JO type="checkbox" passed=true query="ptrace_scope enabled")
    else
        ptrace_scope=$($JO type="checkbox" passed=false query="ptrace_scope enabled")
    fi
    if [ $(command -v gdb 2>/dev/null) ]; then
        gdb=$($JO type="checkbox" passed=true query="gdb installed")
    else
        gdb=$($JO type="checkbox" passed=false query="gdb installed")
    fi
    echo "[$ptrace_scope,$gdb]"
    exit 0
fi

exit 1