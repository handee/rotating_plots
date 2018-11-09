#!/usr/bin/env python

'''
record the pixel values from a clicked location
'''

import cv2
import video
import sys
import numpy as np

no=0
xloc=100
yloc=100

# mouse callback function
def add_hotspot(event,x,y,flags,param):
    global xloc,yloc,no
    if event == cv2.EVENT_LBUTTONUP:
        xloc=x
        yloc=y
        print("Location moved to {} {}".format(xloc,yloc))
        no=no+1

if __name__ == '__main__':
    print(__doc__)

# if we have a filename let's have a go at opening that...
    try: fn = sys.argv[1]
    except: fn = 0
    def nothing(*argv):
        pass


    

    cv2.namedWindow('videow')

    cv2.setMouseCallback('videow',add_hotspot)
    n=0
# gizza videocapture object
    cap = video.create_capture(fn)

    flag, im = cap.read()
    img=cv2.flip(im,1)
    while True:

#read a frame from the video capture obj

        flag, im = cap.read()
           
# highlight the pixel of interest 
        cv2.circle(im,(xloc,yloc),8,(255,0,255),3)
        cv2.imshow('videow',im)
        n+=1
#write the rgb values to a file
        currentfile="rgb{}.txt".format(no)
	with open(currentfile, 'a+') as f:
            strout="{} {} {}".format(im[yloc][xloc][2],im[yloc][xloc][1],im[yloc][xloc][0])
            print >>f, strout
#stick the image on /tmp so you can see it later
        fn="/tmp/location{}frame{:03d}.png".format(no,n)
        cv2.imwrite(fn,im)
#open cv window management/redraw stuff 
        ch = cv2.waitKey(5)
        if ch == 27:
            break
    cv2.destroyAllWindows()
