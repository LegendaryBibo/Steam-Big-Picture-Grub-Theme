#Steam Big Picture: Grub theme

Okay so for the first steps you're going to want to determine what resolutions grub supports, this can be found by installing/building `hwinfo`, and running

```
hwinfo --framebuffer
```

with root, or by rebooting and at the grub menu, open up the command line with 'C', and enter

```
vbeinfo
```

The outputs may be different. So after you find out your supported resolutions, download the one that matches your highest supported resolution (or the next one below it). Now to install it, just extract the tar.gz and run the `install.sh` script with root in a terminal. It'll ask you a few questions then install everything in its proper location.

###FAQ:

1.  **Why don't you make widescreen versions?**

    From experience, even when grub supports a widescreen resolution, the theme looks wonky. Also, I stick to the standard VESA BIOS Extension resolutions as a safe bet. However, you're free to experiment with any resolution independent themes.

2.  **How do I disable it?**

    Open up `/etc/default/grub` with root in your text editor of choice and find the line that says `GRUB_THEME=/some/directory`, then comment it out (put a '#' at the beginning of the line) or erase it, then save it. 

    Then either do an `update-grub` with root (it's probably Ubuntu only), or run grub's `mkconfig` script with root (found in either `/grub`, `/boot/grub`, or `/boot/grub2`)

    You can also run 

        grub-mkconfig -o /path/to/grub.cfg
        grub2-mkconfig -o /path/to/grub.cfg

    on your distro with root

3.  **Can you add X distro icon?**

    Yes. I'd be glad to, but one thing I'd need from you is to know what to name the icon, which you can find out by opening up your `grub.cfg` file and locating your distro's menu entry, so you'll have a line like

        menuentry "Gentoo" --class gentoo --class os...

    Basically I need to know the distro class name to know what to name the icon.

4.  **Does it work with Grub 1/Legacy**

    Sadly, no. Grub 1 only has support for background images.

###Steam Big Picture Grub Theme TODO list

- Move Progress bar to above buttons, but centered. Remove border and glow, but give grey background. Gradient on fill as well.

- Change title to "Select OS" and center

- Make text in list bigger

- Get colors and look more accurate.

- Figure out how to get all menu items to be capitalized.

- Add bokeh dots to background

####One more thing

I haven't calculated the relative allignment for everything yet, so right now everything is at a fixed position and so the theme will only look right at 1600x1200. Once I have the look just right I'll deal with the allignment stuff. So yeah unless you're going to use it on a 1600x1200 screen, I don't reccomend using the theme yet.
