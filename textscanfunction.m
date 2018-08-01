fileID=fopen('Pandora27_Seoul_NO2_FW2.txt','r');
s=textscan(fileID, '%s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f ','Delimiter',' ','Headerlines',23) % ignores the text and headers before the actual data. 
fclose(fileID)