source /home/edis/workspace/pwndbg/gdbinit.py

# Default: set context-sections regs disasm code stack backtrace
set context-sections regs disasm code stack

# auto-load directory in which we run gdb, so we can have a
# .gdbinit per project directory
add-auto-load-safe-path .
set directories /usr/src/glibc/glibc-2.27/libio/:/usr/src/glibc/glibc-2.27/stdio-common/
show directories
set listsize 20
