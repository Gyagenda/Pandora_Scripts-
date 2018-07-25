
fid=fopen('Pandora27_Seoul_NO2_FW2.txt','r'); % name of the text file 
if  fid==-1
    disp('Error, check file name') % error will be diplayed incase the name is typoed 
else 

     s=textscan(fid, '%s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f ','Delimiter',' ','Headerlines',23) 
     %delimiter is just a space because each column in the text
     %file is separated by a space 
     % Headerline is ignoring the number of headers to get to the actual
     % data 
     % s and f just specifying the data types.

     date_string=s{1};
     % convert the data string to numerical values( serial number(dy from 00-Jan-0000)
     date_string = s{1};
     formatIn= 'yyyymmddTHHMM';
     x=datenum(date_string,formatIn);
     
     duration_in_seconds=s{2};
     solar_zenith_angle_measurement_in_degree=s{3};
     solar_azimuth_measurement_in_degrees=s{4};
     rms_of_unweighted_spectral_fitting_residuals=s{5};
     normalized_rms_of_weighted_spectral_fitting_residuals=s{6};
     nitrogrendioxide_vertical_column_DUs=s{7};
     uncertainity_of_nitrogendioxide=s{8};
     direct_sun_nitorgendioxide_air_mass_factor=s{9};
     sum_over_level_two = s{10};
     effective_temp_celcius=s{11};
     estimated_average_residual_stray_light=s{12};
     retrieved_wavelength_shift_nm=s{13};
     position_of_filterwheel = s{14};
     fitting_result_index=s{15};
     nitorgendioxide_effective_temp_K=s{16};
     uncertainty_of_nitogendioxide_effective_temperature_K=s{17};
     %plot(x-jan1_2017,v,'.-')
     jan1_2017=datenum('01-Jan-2017'); %picks out the first date of the year in serial number format 
     c=x-jan1_2017;
     
     
     
    % Just renaming the different data types. 
     
     
     
end 
fclose(fid);

 %plot(x-jan1_2017,nitrogrendioxide_vertical_column_DUs,'.-')
 %ylabel('amount of NO2 in [DUs]')
 %xlabel('days after 01-Jan-2017')
 %ax=gca; % edit the axes
 %ax.XLim=[250 253]; %& zoom out from the 250th day to the 253
 %plot(x-jan1_2017,v,'.-') %x-jan1_2017 finds the date after 2017 to get a better x axis label. 
 % plotting two graphs on the same axes
 %hold on 
 %plot(x-jan1_2017,solar_azimuth_measurement_in_degrees,'b')
 %plot(x-jan1_2017,solar_zenith_angle_measurement_in_degree,'r')
 
 %plotting two graphs on the same window
 %subplot(3,1,1)
 z=x-jan1_2017;
 %plot(z,nitrogrendioxide_vertical_column_DUs,'.-')
 %title('nitrogrendioxide vertical column in DUs vs days after Jan-01-2017')
 
 %subplot(3,1,2)
 %plot(z,solar_zenith_angle_measurement_in_degree,'.')
 %title('solar zenith angle measurement in degree vs days after Jan-01-2017');
 
 %subplot(3,1,3)
 %plot(z,solar_azimuth_measurement_in_degrees,'.')
 %title('solar azimuth measurement in degrees vs days after Jan-01-2017')

 % try to plot column 7 and 8 . plus or minus the error
 %try to plot the azimuth angle and the zeniuth angle on the same window 
 
 %creating an error bar 
 %errorbar(x,nitrogrendioxide_vertical_column_DUs,'.',uncertainity_of_nitrogendioxide_air_mass_factor)

first=datenum(2017,04,15,00,00,00);% 15th day of april 17 00 hours 
last= datenum(2017,04,15,09,59,59); %15th day of aprril 17 23 hours 
%first_hrs=first*24;
%last_hrs=last*24;

%the data positions  from the fist hour to the last hour 
range=find(x<=last & x>= first);

numel(range)
April_15=datenum('15-April-2017');
p_days=(x(range)-April_15);
dataset=(p_days)*24;
% column 7 and the april_17

%finding postion of the first hour of april 17
%idx=find(x==datenum(2017,04,15,00,00,00));

% add the first postion element to the number of availabel elements from
% numel(range to get the final postion)
column_7=nitrogrendioxide_vertical_column_DUs(range);% data set for nitrogendioxide to match up the data for the  hours in april 
%plot(dataset,column_7,'.')

column_9=(uncertainity_of_nitrogendioxide_air_mass_factor(range));
err = column_9; % makes the error bars 
e=errorbar(dataset,column_7,err) %makes erro bars 
x=gca; % edit the axes
ax.XLim=[0 0.5]
e.Marker='';
e.MarkerSize=10;
e.Color='red';


%07/09/2018
std_column_7=std(nitrogrendioxide_vertical_column_DUs)
mean_column_7=mean (nitrogrendioxide_vertical_column_DUs)


uncertainity_less_than_one=uncertainity_of_nitrogendioxide(uncertainity_of_nitrogendioxide <1);

%no2_filtered = nitrogendioxide_vertical_column_DUs(uncertainity_of_nitrogendioxide < 1);

% this sorts out column 7 depending on the uncertainty of column 8. It only
% keeps the data of column 7 less than the uncertainty of one. 
filter_index = find(uncertainity_of_nitrogendioxide < 1);
no2_filtered =nitrogrendioxide_vertical_column_DUs(filter_index);

%sorting out the data to have only one day
no2_re_filtered= no2_filtered(range)

%Changing the time from UTC time to local time(Seoul)
Seoul_time= dataset+(9);


subplot(2,1,1)
z=x-jan1_2017;
plot(z,nitrogrendioxide_vertical_column_DUs,'.')
title('NO2 vertical column in DUs vs days after Jan-01-2017')
xlabel('days after Jan-01-2017')
ylabel('NO2 vertical column in DUs')

subplot(2,1,2)
plot(Seoul_time,no2_re_filtered,'.')
title('NO2  vertical column in DUs for 04/17 vs the time in Seoul for 04/17')
xlabel('Time in Seoul for 04/17')
ylabel('NO2 vertical column in DUs for 04/17  ')





numel(uncertainity_less_than_one);
Std_Greater_range = find(uncertainity_less_than_one);


