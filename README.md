# fish-rename
A plugin to rename files.

# Usage
Here is the help message
```
rename: Rename file by command
Usage: rename [options] <file...>

Options:
  -c/--command <command> eval command to generate new filename
  -i/--interactive       prompt before overwrite
  -h/--help              print this help message
```

It's very easy to use. You only need to tell the `rename` a command to eval new filename, the all the files will rename to the new name. 

So, the `command` should read from the stdin and output a string to stdout. 
For example:
```
rename -c "string replace -a 'l' 'foo'" hello.txt world.txt
```

# install 
Install using Fisher(or other plugin manager):
```
fisher install tenfyzhong/fish-rename
```
