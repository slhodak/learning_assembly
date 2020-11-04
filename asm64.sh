#!/bin/bash
# Simple assemble/link script.
if [ -z $1 ]; then
  echo "Usage:  ./asm64 <asmMainFile> (no extension)" exit 
  fi
#  Verify no extensions were entered
if [ ! -e "assembly/$1.asm" ]; then
  echo "Error, assembly/$1.asm not found." 
  echo "Note, do not enter file extensions."
  exit
fi
#  Compile, assemble, and link. 
yasm -Worphan-labels -g dwarf2 -f elf64 "assembly/$1.asm" -l "list_files/$1.lst" 
mv "$1.o" "object_files/$1.o"
ld -g -o $1 "object_files/$1.o"
mv $1 "bin/$1"