#Steam Big Picture: Grub theme

###Latest Screenshot

![ScreenShot](http://i.imgur.com/yQCOjnR.png)

Okay so for the first steps you're going to want to determine what resolutions grub supports, this can be found by installing/building `hwinfo`, and running

```
hwinfo --framebuffer
```

with root, or by rebooting and at the grub menu, open up the command line with 'C', and enter

```
vbeinfo
```

The outputs may be different. So after you find out your supported resolutions, download the one that matches your highest supported resolution (or the next one below it). Now to install it, just extract the tar.gz and run the `install.sh` script with root in a terminal. It'll ask you a few questions then install everything in its proper location.

###Requirements:

You'll need to install the mscorefonts package and the imagemagick package. On Ubuntu the command is

```
sudo apt-get install ttf-mscorefonts-installer imagemagick
```

###Known Issues:

The `UserName.png` image needs to be converted to RGB in Gimp after installation. The image that you have to edit will be located in `/boot/grub/themes/SteamBP` in Ubuntu. Other distros place this directory somewhere else. I'm trying to figure out why ImageMagick keeps it as Grayscale.

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

- ~~Move Progress bar to above buttons, but centered. Remove border and glow, but give grey background. Gradient on fill as well.~~

- ~~Change title to "Select OS" and center~~

- Make text in list bigger

- ~~Get colors and look more accurate.~~

- Figure out how to get all menu items to be capitalized.

- ~~Add bokeh dots to background~~

####One more thing

You might noticed the GetProfileImage.sh.x and GetProfileImage.sh. The one with the .x extension is just the .sh file "compiled" with shc. The only thing different from them is that the .x file has an API key written into it.

###Screenshots:

**Old Version**
![ScreenShot](http://i.imgur.com/T4pbHXT.png)

**New Version**

###1600x1200  OLD (Static Placement Version)
![ScreenShot](http://i.imgur.com/RbZttjy.png)

###1600x1200 NEW (Relative Placement Version)
![ScreenShot](http://i.imgur.com/USD0JJP.png)

###1024x768
![ScreenShot](http://i.imgur.com/bMxCQ4E.png)

###800x600
![ScreenShot](http://i.imgur.com/HxX2EsO.png)

###640x480 - NOT RECOMMENDED!!
![ScreenShot](http://i.imgur.com/l5aT9fE.png)


