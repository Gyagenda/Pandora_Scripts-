%this script helps to plot veritcal column of nitrogren dioxide vs the date
%after 01-Jan_2017
nitrogrendioxide_vertical_column_DUs=s{7};
 plot(x-jan1_2017,nitrogrendioxide_vertical_column_DUs,'.-')
 ylabel('amount of NO2 in [DUs]')
 xlabel('days after 01-Jan-2017')
 ax=gca; % edit the axes
 ax.XLim=[250 253]; %& zoom out from the 250th day to the 253