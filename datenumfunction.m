% convert the data string to numerical values( serial number(dy from 00-Jan-0000)
 %date_string = s{1};
 formatIn= 'yyyymmddTHHMM';
 date_string=s{1};
 x= datenum(date_string,formatIn);
 %datenum function converts the dates from the current to the nu,ber of
 %days since 00-jan-0000(serial format)
 jan1_2017=datenum('01-Jan-2017'); % picks out the first date of the year in serial numer format. 
 c=x-jan1_2017; % represents the days after jan 01 2017 
 
 