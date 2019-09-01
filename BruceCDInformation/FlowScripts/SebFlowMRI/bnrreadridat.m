%######################################################
%## Reads in raw data from the RIDat format
%## which is Re1,Im1,t1,Re2,Im2,t2
%## with complex pairs being (single, single)
%## and the time being (double) = 8 bytes

%######################################################
% 04/06/2014- Converted into Matlab Function by John Adams

function [data, time] = bnrreadridat(fname)

fp=fopen(fname,'r','ieee-le'); 		% 'ieee-be' BIG endian
id_section=fread(fp,6,'int32');		% info section 
					% [int32=(IDL LONG)=4 bytes]
					% magic no. 190955
					% flag 0|1 RiDat|RiImage
					% 4 header sizes (in BYTES)
hdrsize=sum(id_section(3:end)); % sum the 4 headers to find start of data
fseek(fp,hdrsize,'bof'); % bof replaces Octave SEEK_SET
fbuffer=fread(fp,Inf,'single');
data=fbuffer(1:4:end)+i*fbuffer(2:4:end);
fseek(fp,hdrsize,'bof');
fbuffer=fread(fp,Inf,'double');		% double is 8 bytes
time=fbuffer(2:2:end);
fclose(fp);


end


