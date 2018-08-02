 % plotting two graphs on the same axes
 solar_zenith_angle_measurement_in_degree=s{3};
 solar_azimuth_measurement_in_degrees=s{4};
 hold on 
 plot(x-jan1_2017,solar_azimuth_measurement_in_degrees,'b')
 plot(x-jan1_2017,solar_zenith_angle_measurement_in_degree,'r')
 xlabel('days')
 ylabel('solar azimuth and zenith angle')
 hold off
 