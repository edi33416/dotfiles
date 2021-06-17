source /home/edis/workspace/peda/peda.py
#add-auto-load-safe-path /usr/src/glibc/glibc-2.27/libio/

# auto-load directory in which we run gdb, so we can have a
# .gdbinit per project directory
add-auto-load-safe-path .
set directories /usr/src/glibc/glibc-2.27/libio/
show directories
set listsize 20
