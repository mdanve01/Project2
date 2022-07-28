% load the functions
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/simulation';
% load the 3 functions
bfsh = importdata('HRFtd.mat');

window = 32;
sec_h = 260 ./ window;

sum_all = bfsh(:,1);

t1(1) = max(sum_all);
thresh1 = t1(1) .* 0.25;

[PKS,LOCS,widths] = findpeaks(sum_all,'MinPeakProminence',thresh1,'WidthReference','halfheight');
clear max_peak
max_peak = max(PKS);
clear loc_max
loc_max = find(PKS == max_peak);
total(1) = LOCS(loc_max)./sec_h;
total(2) = widths(loc_max)./sec_h;
total(3) = PKS(loc_max);
total(4) = length(PKS);
if length(PKS) == 1;
    total(5) = 1;
else total(5) = 2;
end
clear min_us
clear pos_us
min_us = min(sum_all(LOCS(loc_max):260));
pos_us = find(sum_all(LOCS(loc_max):260) == min_us);
if min_us < 0;
    total(6) = min_us;
    total(7) = (pos_us + LOCS(loc_max)) ./ sec_h;
    total(8) = (abs(min_us) ./ max_peak) .* 100;
else total(6:8) = 0;
end