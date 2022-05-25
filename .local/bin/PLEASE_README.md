All of the scripts that have color variables are:
  sb-clock,
  sb-network,
  sb-volume and
  waldl

They all require a symlink to a theme file in "bar_themes/", you can make your own or use the default ones
i have in the repo.

Use the "ln" command to make the symlink like this e.g:
  "ln -s bar_themes/'x_theme' cur_theme" <- this 'cur_theme' is the name of the symlink

All the scripts before mentioned reference a file with the name 'cur_theme' at their beginning:
  "[ -r ~/.local/bin/cur_theme ] && . ~/.local/bin/cur_theme" || exit <- in this line.
  The exit command and the end of the line is to avoid the script from running if there is no 'cur_theme'.

So if you want to use another name for the symlink you can but you'll have to edit all of the scripts
to match that particular name instead of 'cur_theme' or else the scripts WILL NOT RUN!!!

I do this to simplify the process of changing the theme of all scripts by only deleting the current symlink
and creating another one with the same name pointing to theme file in "bar_theme/" dir.

Theme file and cmd e.g:
  "ln -s  bar_themes/nord  cur_theme" <- This will give you -> "cur_theme" that points to -> "bar_themes/nord"
