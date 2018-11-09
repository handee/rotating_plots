clear all; 

filename="rgb0.txt"
data=dlmread(filename)



redval=data(:,1)./255;
blueval=data(:,2)./255;
greenval=data(:,3)./255;
colors=[redval';greenval';blueval'];
disp(colors)
x=colors'
hsvcolors=rgb2hsv(x)

hsv255=hsvcolors.*255


# create 360 snapshots (1 per degree) 
figure(1); 
t = 100; 
for degree=1:360
  # clear graph 
  clf; 
# plot 3d snapshot with small dots "." 
  scatter3(hsv255(:,1)', hsv255(:,2)', hsv255(:,3)', [], colors', "filled"); 

# configure label names and axis intervals [0, 1] 
  xlabel("Red"); 
  ylabel("Green"); 
  zlabel("Blue"); 
  axis([0 255 0 255 0 255]); 

# rotate the graph according to current degree 
  view(degree, 30 + 15 * sin(degree/60)); 
# save the current snapshot file 
  plotname = ['scatter_t', num2str(t), '.png']; 
  print(plotname, '-dpng'); t = t + 1; 
  disp(t);
end;
