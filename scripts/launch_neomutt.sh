#!/bin/bash

mv ~/.config/gtk-3.0/gtk.css ~/.config/gtk-3.0/gtk.css.old
i3-msg "exec --no-startup-id termite -e neomutt"; sleep 0.5
mv ~/.config/gtk-3.0/gtk.css.old ~/.config/gtk-3.0/gtk.css
