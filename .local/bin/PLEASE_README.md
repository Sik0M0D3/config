All of the scripts that have color variables are: sb-clock, sb-network, sb-volume and waldl.

They all require a symlink to a theme file in "bar_themes/", you can choose to make your own theme file
or use the default ones i have in this repo.

Use the "ln" command to make the symlink like this e.g:
  "ln -s  bar_themes/'x_theme'  cur_theme"  <- this 'cur_theme' is the name of the symlink.

All of the scripts before mentioned reference a file with the name 'cur_theme' at their beginning:
  "[ -r ~/.local/bin/cur_theme ] && . ~/.local/bin/cur_theme" || exit <- this line.
  The exit command at the EOF is to not run the script if there's no 'cur_theme' or if it's unreadable.

So if you want to use another name for the symlink you can :D but you'll have to edit all of the scripts D:
to match that particular name instead 'cur_theme' or else the scripts WILL NOT RUN!!!

I do this to simplify the process of changing the themes of all scripts by only deleting the current symlink
and creating another one with the same name pointing to the theme file in "bar_themes/".

Symlink and CMD e.g:
  "ln -s  bar_themes/nord  cur_theme" <- This will give you a symlink that points to "bar_themes/nord".
