# rotating_plots
Some hacky octave/matlab for visualising colours in RGB space

This is a direct descendant of the code used in this youtube video:
https://www.youtube.com/watch?v=TDZkJ00AZug 
hacked around so that the colours of the dots match the colours in RGB-space

The various hacks do -
 - synthetic data (create_snapshots.m)
 - reading in a data file and plotting in rgb space (create_snapshots_data.m)
 - reading in a data file and plotting in hsv space (create_snapshots_data_hsv.m)

At the moment the filename is hard coded into the matlab/octave files :-)
 
 The python file pixel-record.py allows you to "record" rgb values for a single pixel which can then feed into the plotting routines.  If you click on the window whilst recording, the location being recorded updates and it starts a new output file.
 The pixel-record.py program also dumps the input images - with highlight - out to /tmp so you can make videos showing the detail.

Common.py and video.py are just helper files from the OpenCV samples.
 
 Example video: 
 https://www.youtube.com/watch?v=7b5tv8tizLo
