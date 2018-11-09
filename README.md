# rotating_plots
Some hacky octave/matlab for visualising colours in RGB space

This is a direct descendant of the code used in this youtube video:
https://www.youtube.com/watch?v=TDZkJ00AZug 
hacked around so that the colours of the dots match the colours in RGB-space

The various hacks do -
 - synthetic data
 - reading in a data file and plotting in rgb space
 - reading in a data file and plotting in hsv space
 
 The python files allow you to "record" rgb values for a single pixel which can then feed into the plotting routines. 
 The python files also dump the input images - with highlight - out to /tmp so you can make videos showing the detail.
 
 Example video: 
 https://www.youtube.com/watch?v=7b5tv8tizLo
