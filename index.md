# Install Manjaro Linux with i3, and make it pretty

### Step 1

First, you have to get a manjaro ISO. I recommend getting one with a DE, as it will come with all of the default programs that you will need. The download can be found [here](https://manjaro.org/download/). For this guide, I will be using the XFCE edition.

### Step 2

Next, you have to flash the ISO to a disk or USB drive. I recommend balena-etcher for this, as it is simple and works well.

### Step 3

Now that you have the ISO on a USB drive (or disk), it's time to boot into that drive. Restart your PC, and while it is restarting, push the boot menu key. Most computers will say which key it is in the startup screen, but if not, you can try F10, F12, Delete, and other such keys. Then, select your install media when it asks what to boot into.

### Step 4

At this point, simply follow the on-screen instructions to install Manjaro, or just try it out first as a live boot.

### Step 5

Before we get all the nice-looking programs, you will first want to enable AUR and Snap in the package manager, if they aren't enabled already. They can be found in the settings menu.

## Programs

### i3

Now we're getting to the real stuff: what programs to install. First, you will want to install i3-gaps. It is in the standard repositories. When it finishes installing, log out to the desktop manager, then select i3 as your desktop environment. When you log in and start it up, you will be asked to choose a modifier key (pick Mod4, the windows key so it doesnt conflict with other keybinds) and then you will be dumped onto a blank screen. You will immediately find that there is no bar to speak of, and that there is no way to even open programs. i3 uses a sifferent approach with keyboard shortcuts: Mod+Enter opend a terminal, and Mod+d opens dmenu. Dmenu is a simple, text-based application launcher, and is how you will be starting most of your programs. When you open dmenu, simply start typing the name of your program, and the list will narrow down as you type. Use the arrow keys and Enter to navigate the list.

##### Configuring i3

When you install i3, there will be a default config loaded into `etc/xdg/i3/config`. Copy this into `~/.config/i3/config`, and you can edit it. This file houses all of the keyboard shortcuts for i3, and manages automatic application launching on startup. This is also where you configure your gaps and borders. To set gaps and remove borders, add this to your config:

```bash
gaps inner 7
default_border none
default_floating_border none
for_window [class="^.*"] border pixel 0
```

i3-gaps will not work well with borders on, and turning them off makes the desktop cleaner.


### pamac

If you don't have it already, you will want to install pamac. It is a package manager that makes everything easier, and you can turn on AUR and Snap support.

### picom

To get all the fancy transparency and blurring that people have, you will need a compositor. Picom is the most common one, and it is pretty easily configurable.

##### Configuring picom

Similar to i3, the default config file for picom is located in `etc/xdg/picom.conf`. This will handle all of the defaults, and your user config file only needs to include what is different from the system-wide config. Create `~/.config/picom.conf`, and add the following information:

```
shadow = false;
shadow-opacity = 0.0;
inactive-opacity = 0.8;
menu-opacity = 0.65;
corner-radius = 13;
blur-method = "kernel"
blur-background = true;
blur-kern = "7x7box";
```

- Shadows do not work well with rounded corners, so I have them off.
- `inactive-opacity` is how you make windows transparent, and `menu-opacity` makes menus transparent, which I really like.
- `corner-radius` is what rounds the corners.
- `blur-method` must be set to `kernel`, otherwise it won't work. The other methods are not officially supported.
- `blur-background` simply turns the blurring on and off.
- `blur-kern` sets the kernel for blurring. I like the `7x7box` preset, but a more comprehensive guide can be found [here](https://man.archlinux.org/man/picom.1.en#BLUR) if you want to change it.

### micro

Micro is a really good terminal text editor. It has most of the features you would expect in a basic code editor, such as syntax highlighting and auto-indent, but it runs in the terminal. If you want it to be your default text editor, you have to set it as your $EDITOR. The way I did this is by adding the following line to my ~/.bashrc:
```export EDITOR=micro```

That way, it is set as the default editor for every bash session.

### xplr

If you are anything like me, you love beautiful terminal applications, and XPLR is one such application. The keybinds take a little bit to get used to, but it's worth it.

### btop

Btop is a beautiful task manager that runs in the terminal. You can set many different themes for it, or you can create one of your own/edit an existing one.

##### Configuring btop

There should be a folder for btop in `~/.config`, and you can create `btop.conf` in that folder. In there, you can permanently set all the options found in the settings menu. A default config can be found [here](https://github.com/aristocratos/btop) in the readme file.

In `~/.config/btop`, there should also be a folder for themes. It will be empty at first until you make your own, or you can copy some of the defaults from `usr/share/btop/themes/` to edit them.

### playerctl

If you don't have it already, install playerctl. It lets you control your music from scripts, or keybinds in your i3 config, and it works with almost every music and video player out there.

### Song info display

I made a script to print song info to the terminal using playerctl, you can find it in [my dotfiles repo](https://github.com/lowpoly1/dotfiles). To display it in the same terminal as my visualizer, I use `screen`, a terminal multiplexer, then open up two panels, one for my script and one for `cava`. If you download the script and put it in the home directory, you can run it with `./print-song-info.sh`.

### screen

Screen is a terminal multiplexer, which means that it can split a single terminal window into two. By default, there are title bars for each pane, but I (kind of) turned them off by adding `caption string "%{= 99} "` to `~/.screenrc`. What this does is sets the background color and text color of the title bar to color 9 in my terminal, which happens to be my background color. Then, it sets the caption as an empty string.

### pasystray

While you were setting upou may have noticed that you don't have a way to control your volume. pasystray (Pulse Audio SYStem TRAY) fixes that. Install it, and it will appear in your tray. You can now scroll while hovering over the icon, and it will adjust the volume.

### polybar

The bar is probably one of the hardest things to set up, but you can start with [my config](https://github.com/lowpoly1/dotfiles/tree/main/polybar). Put this config in `~/.config/polybar`, then run polybar with `polybar example`. To detach it from the terminal, run `nohup polybar example < /dev/null &> /dev/null &`. This routes all output and input to `/dev/null`, and detaches the process from the terminal.

### feh

You may notice that there is no way to change the wallpaper in i3. `feh` is a simple image viewer that can also be used to set wallpapers, and you can put its command in your i3 config, so it runs at startup.

### other fun applications

- calcurse - terminal-based calculator and todo list
- 6cord - discord in your terminal
- cbonsai - makes cool little bonsai trees in your terminal
- pipes.sh - generates infinite pipes as a terminal screensaver
- unimatrix - upgraded version of cmatrix
- chafa - render images in the terminal. It can also be used as a backend for neofetch.
- neofetch - display system info with ASCII art of your distro, or any ASCII file of your choice.

### firefox extensions

I use [Dark Reader](https://addons.mozilla.org/en-US/firefox/addon/darkreader/) to make everything dark mode, [Stylus](https://addons.mozilla.org/en-US/firefox/addon/styl-us) to set my own themes for certain websites (my stylesheets can be found in [my dotfiles](https://github.com/lowpoly1/dotfiles/)), and [Tabliss](https://addons.mozilla.org/en-US/firefox/addon/tabliss) for a custom new tab page. For my firefox theme, I use a slightly modified version of the [Nord Polar Dark](https://addons.mozilla.org/en-US/firefox/addon/nord-polar-night-theme/) theme. For instructions on how to customize a firefox theme, see (i havent made the guide yet).


