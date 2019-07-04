#!/bin/bash

mv ~/.config/gtk-3.0/gtk.css ~/.config/gtk-3.0/gtk.css.old
i3-msg "exec --no-startup-id termite -t $1 -e $1"; sleep 0.5
mv ~/.config/gtk-3.0/gtk.css.old ~/.config/gtk-3.0/gtk.css
