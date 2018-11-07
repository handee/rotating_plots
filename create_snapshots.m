clear all; 

red=200;
green=140;
blue=100;
sigma=0;
drift=0; #set to 1 to simulate lighting drift

# define velues for each axis (in this case normally distributed ) 
axis_X = randn(1, 100) *sigma + red; 
axis_Y = randn(1, 100) *sigma + green; 
axis_Z = randn(1, 100) *sigma + blue; 


if (drift==1):
	blueinc=[1:100];
	greeninc=[1:100];
	axis_Y=axis_Y+greeninc;
	axis_Z=axis_Z+blueinc;

redval=axis_X./255;
blueval=axis_Y./255;
greenval=axis_Z./255;
colors=[redval;greenval;blueval];



# create 360 snapshots (1 per degree) 
figure(1); 
t = 100; 
for degree=1:360
  # clear graph 
  clf; 
# plot 3d snapshot with small dots "." 
  scatter3(axis_X', axis_Y', axis_Z', [], colors', "filled"); 

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
