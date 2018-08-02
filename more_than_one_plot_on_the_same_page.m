subplot(3,1,1)
z=x-jan1_2017;
plot(z,nitrogrendioxide_vertical_column_DUs,'.-')
title('nitrogrendioxide vertical column in DUs vs days after Jan-01-2017')
 
subplot(3,1,2)
plot(z,solar_zenith_angle_measurement_in_degree,'.')
title('solar zenith angle measurement in degree vs days after Jan-01-2017')
 
subplot(3,1,3)
plot(z,solar_azimuth_measurement_in_degrees,'.')
title('solar azimuth measurement in degrees vs days after Jan-01-2017')