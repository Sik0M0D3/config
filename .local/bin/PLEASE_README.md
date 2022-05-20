All of the scripts that have a color variables = {
  sb-clock
  sb-network
  sb-volume
  waldl
}
require a symlink to a theme in bar_themes/ , you can make your own or use the default ones.
use ln command to make the symlink like this e.g:
  "ln -s bar_themes/'cur_theme' cur_theme"

All scripts reference the file with the name 'cur_theme' e.g:
 "[ -f ~/.local/bin/cur_theme ] && . ~/.local/bin/cur_theme" <- this line.

So if you want to use another name for the symlink you can but you'll have to edit all the scripts to match it.
I do this to change the scripts and bar themes with only deleting the symlink and recreate it pointing to another
theme file e.g:
  "ln -s bar_themes/nord cur_theme"  <-  will give you this file  ->  "cur_theme -> bar_themes/nord"
