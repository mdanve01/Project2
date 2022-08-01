cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/age_effects/parameter_analysis/check';
totalf1 = importdata('fourier1_accAGE.mat');
totalf2 = importdata('fourier2_accAGE.mat');
totalf3 = importdata('fourier3_accAGE.mat');
totalf4 = importdata('fourier4_accAGE.mat');
totalf5 = importdata('fourier5_accAGE.mat');
totalf6 = importdata('fourier6_accAGE.mat');
totalf7 = importdata('fourier7_accAGE.mat');
totalh1 = importdata('hrftd1_accAGE.mat');
totalh2 = importdata('hrftd2_accAGE.mat');
totalh3 = importdata('hrftd3_accAGE.mat');
totalh4 = importdata('hrftd4_accAGE.mat');
totalh5 = importdata('hrftd5_accAGE.mat');
totalh6 = importdata('hrftd6_accAGE.mat');
totalh7 = importdata('hrftd7_accAGE.mat');

windowf = 18;
windowh = 18;
secf = 147 ./ windowf;
sech = 147 ./ windowh;

% locate those voxels without an undershoot, without peak latency, without
% FWHM, or without a clear neg pos divide.
a = find(totalf1(:,268) == 0);
a1 = find(totalf1(:,261) == 0);
a2 = find(totalf1(:,262) == 0);
a3 = find(totalf1(:,265) == 0);

b = find(totalf2(:,268) == 0);
b1 = find(totalf2(:,261) == 0);
b2 = find(totalf2(:,262) == 0);
b3 = find(totalf2(:,265) == 0);

c = find(totalf3(:,268) == 0);
c1 = find(totalf3(:,261) == 0);
c2 = find(totalf3(:,262) == 0);
c3 = find(totalf3(:,265) == 0);

d = find(totalf4(:,268) == 0);
d1 = find(totalf4(:,261) == 0);
d2 = find(totalf4(:,262) == 0);
d3 = find(totalf4(:,265) == 0);

e = find(totalf5(:,268) == 0);
e1 = find(totalf5(:,261) == 0);
e2 = find(totalf5(:,262) == 0);
e3 = find(totalf5(:,265) == 0);

f = find(totalf6(:,268) == 0);
f1 = find(totalf6(:,261) == 0);
f2 = find(totalf6(:,262) == 0);
f3 = find(totalf6(:,265) == 0);

g = find(totalf7(:,268) == 0);
g1 = find(totalf7(:,261) == 0);
g2 = find(totalf7(:,262) == 0);
g3 = find(totalf7(:,265) == 0);

ah = find(totalh1(:,268) == 0);
ah1 = find(totalh1(:,261) == 0);
ah2 = find(totalh1(:,262) == 0);
ah3 = find(totalf1(:,265) == 0);

bh = find(totalh2(:,268) == 0);
bh1 = find(totalh2(:,261) == 0);
bh2 = find(totalh2(:,262) == 0);
bh3 = find(totalf2(:,265) == 0);

ch = find(totalh3(:,268) == 0);
ch1 = find(totalh3(:,261) == 0);
ch2 = find(totalh3(:,262) == 0);
ch3 = find(totalf3(:,265) == 0);

dh = find(totalh4(:,268) == 0);
dh1 = find(totalh4(:,261) == 0);
dh2 = find(totalh4(:,262) == 0);
dh3 = find(totalf4(:,265) == 0);

eh = find(totalh5(:,268) == 0);
eh1 = find(totalh5(:,261) == 0);
eh2 = find(totalh5(:,262) == 0);
eh3 = find(totalf5(:,265) == 0);

fh = find(totalh6(:,268) == 0);
fh1 = find(totalh6(:,261) == 0);
fh2 = find(totalh6(:,262) == 0);
fh3 = find(totalf6(:,265) == 0);

gh = find(totalh7(:,268) == 0);
gh1 = find(totalh7(:,261) == 0);
gh2 = find(totalh7(:,262) == 0);
gh3 = find(totalf7(:,265) == 0);

% sum all cases of missing values
all = [a; a1; a2; a3; b; b1; b2; b3; c; c1; c2; c3; d; d1; d2; d3; e; e1; e2; e3; f; f1; f2; f3; g; g1; g2; g3; ah; ah1; ah2; ah3; bh; bh1; bh2; bh3; ch; ch1; ch2; ch3; dh; dh1; dh2; dh3; eh; eh1; eh2; eh3; fh; fh1; fh2; fh3; gh; gh1; gh2; gh3];
% find unique values
all2 = unique(all);

% remove all any missing voxel accross all ages and models
totalf1(all2,:) = [];
totalf2(all2,:) = [];
totalf3(all2,:) = [];
totalf4(all2,:) = [];
totalf5(all2,:) = [];
totalf6(all2,:) = [];
totalf7(all2,:) = [];
totalh1(all2,:) = [];
totalh2(all2,:) = [];
totalh3(all2,:) = [];
totalh4(all2,:) = [];
totalh5(all2,:) = [];
totalh6(all2,:) = [];
totalh7(all2,:) = [];
% age 1

% Fourier
clear x
x = find(totalf1(:,270) == 1);
total1(:,1) = totalf1(x,261);
total1(:,2) = totalf1(x,262);
total1(:,3) = totalf1(x,268);
% ROI
total1(:,7) = totalf1(x,269);
% PBR vs NBR
total1(:,8) = totalf1(x,265);
total1(:,9:11) = totalf1(x,278:280);

% HRFtd
clear x
x = find(totalh1(:,270) == 1);
total1(:,4) = totalh1(x,261);
total1(:,5) = totalh1(x,262);
total1(:,6) = totalh1(x,268);
total1(:,12:14) = totalh1(x,278:280);

% check matching
total1(:,15) = total1(:,9) - total1(:,12);
total1(:,16) = total1(:,10) - total1(:,13);
total1(:,17) = total1(:,11) - total1(:,14);

% diffs
total1(:,18) = total1(:,1) - total1(:,4);
total1(:,19) = total1(:,2) - total1(:,5);
total1(:,20) = total1(:,3) - total1(:,6);

% age group
total1(:,21) = 1;

% HRFtd betas
total1(:,22:24) = totalh1(x,271:273);

% PL outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total1(:,1),'mean');
y = isoutlier(total1(:,4),'mean');
z = isoutlier(total1(:,18),'mean');
m = x + y + z;
n = find(m == 0);
pl_total1 = total1(n,:);

% FWHM outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total1(:,2),'mean');
y = isoutlier(total1(:,5),'mean');
z = isoutlier(total1(:,19),'mean');
m = x + y + z;
n = find(m == 0);
fw_total1 = total1(n,:);

% US outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total1(:,3),'mean');
y = isoutlier(total1(:,6),'mean');
z = isoutlier(total1(:,20),'mean');
m = x + y + z;
n = find(m == 0);
us_total1 = total1(n,:);

% age2

% Fourier
clear x
x = find(totalf2(:,270) == 1);
total2(:,1) = totalf2(x,261);
total2(:,2) = totalf2(x,262);
total2(:,3) = totalf2(x,268);
% ROI
total2(:,7) = totalf2(x,269);
% PBR vs NBR
total2(:,8) = totalf2(x,265);
total2(:,9:11) = totalf2(x,278:280);

% HRFtd
clear x
x = find(totalh2(:,270) == 1);
total2(:,4) = totalh2(x,261);
total2(:,5) = totalh2(x,262);
total2(:,6) = totalh2(x,268);
total2(:,12:14) = totalh2(x,278:280);

% check matching
total2(:,15) = total2(:,9) - total2(:,12);
total2(:,16) = total2(:,10) - total2(:,13);
total2(:,17) = total2(:,11) - total2(:,14);

% diffs
total2(:,18) = total2(:,1) - total2(:,4);
total2(:,19) = total2(:,2) - total2(:,5);
total2(:,20) = total2(:,3) - total2(:,6);

% age group
total2(:,21) = 2;

% betas (HRFtd)
total2(:,22:24) = totalh2(x,271:273);

% PL outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total2(:,1),'mean');
y = isoutlier(total2(:,4),'mean');
z = isoutlier(total2(:,18),'mean');
m = x + y + z;
n = find(m == 0);
pl_total2 = total2(n,:);

% FWHM outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total2(:,2),'mean');
y = isoutlier(total2(:,5),'mean');
z = isoutlier(total2(:,19),'mean');
m = x + y + z;
n = find(m == 0);
fw_total2 = total2(n,:);

% US outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total2(:,3),'mean');
y = isoutlier(total2(:,6),'mean');
z = isoutlier(total2(:,20),'mean');
m = x + y + z;
n = find(m == 0);
us_total2 = total2(n,:);


% age 3

% Fourier
clear x
x = find(totalf3(:,270) == 1);
total3(:,1) = totalf3(x,261);
total3(:,2) = totalf3(x,262);
total3(:,3) = totalf3(x,268);
% ROI
total3(:,7) = totalf3(x,269);
% PBR vs NBR
total3(:,8) = totalf3(x,265);
total3(:,9:11) = totalf3(x,278:280);

% HRFtd
clear x
x = find(totalh3(:,270) == 1);
total3(:,4) = totalh3(x,261);
total3(:,5) = totalh3(x,262);
total3(:,6) = totalh3(x,268);
total3(:,12:14) = totalh3(x,278:280);

% check matching
total3(:,15) = total3(:,9) - total3(:,12);
total3(:,16) = total3(:,10) - total3(:,13);
total3(:,17) = total3(:,11) - total3(:,14);

% diffs
total3(:,18) = total3(:,1) - total3(:,4);
total3(:,19) = total3(:,2) - total3(:,5);
total3(:,20) = total3(:,3) - total3(:,6);

% age group
total3(:,21) = 3;

% betas (HRFtd)
total3(:,22:24) = totalh3(x,271:273);


% PL outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total3(:,1),'mean');
y = isoutlier(total3(:,4),'mean');
z = isoutlier(total3(:,18),'mean');
m = x + y + z;
n = find(m == 0);
pl_total3 = total3(n,:);

% FWHM outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total3(:,2),'mean');
y = isoutlier(total3(:,5),'mean');
z = isoutlier(total3(:,19),'mean');
m = x + y + z;
n = find(m == 0);
fw_total3 = total3(n,:);

% US outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total3(:,3),'mean');
y = isoutlier(total3(:,6),'mean');
z = isoutlier(total3(:,20),'mean');
m = x + y + z;
n = find(m == 0);
us_total3 = total3(n,:);


% age 4

% Fourier
clear x
x = find(totalf4(:,270) == 1);
total4(:,1) = totalf4(x,261);
total4(:,2) = totalf4(x,262);
total4(:,3) = totalf4(x,268);
% ROI
total4(:,7) = totalf4(x,269);
% PBR vs NBR
total4(:,8) = totalf4(x,265);
total4(:,9:11) = totalf4(x,278:280);

% HRFtd
clear x
x = find(totalh4(:,270) == 1);
total4(:,4) = totalh4(x,261);
total4(:,5) = totalh4(x,262);
total4(:,6) = totalh4(x,268);
total4(:,12:14) = totalh4(x,278:280);

% check matching
total4(:,15) = total4(:,9) - total4(:,12);
total4(:,16) = total4(:,10) - total4(:,13);
total4(:,17) = total4(:,11) - total4(:,14);

% diffs
total4(:,18) = total4(:,1) - total4(:,4);
total4(:,19) = total4(:,2) - total4(:,5);
total4(:,20) = total4(:,3) - total4(:,6);

% age group
total4(:,21) = 4;

% betas (HRFtd)
total4(:,22:24) = totalh4(x,271:273);


% PL outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total4(:,1),'mean');
y = isoutlier(total4(:,4),'mean');
z = isoutlier(total4(:,18),'mean');
m = x + y + z;
n = find(m == 0);
pl_total4 = total4(n,:);

% FWHM outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total4(:,2),'mean');
y = isoutlier(total4(:,5),'mean');
z = isoutlier(total4(:,19),'mean');
m = x + y + z;
n = find(m == 0);
fw_total4 = total4(n,:);

% US outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total4(:,3),'mean');
y = isoutlier(total4(:,6),'mean');
z = isoutlier(total4(:,20),'mean');
m = x + y + z;
n = find(m == 0);
us_total4 = total4(n,:);


% age 5

% Fourier
clear x
x = find(totalf5(:,270) == 1);
total5(:,1) = totalf5(x,261);
total5(:,2) = totalf5(x,262);
total5(:,3) = totalf5(x,268);
% ROI
total5(:,7) = totalf5(x,269);
% PBR vs NBR
total5(:,8) = totalf5(x,265);
total5(:,9:11) = totalf5(x,278:280);

% HRFtd
clear x
x = find(totalh5(:,270) == 1);
total5(:,4) = totalh5(x,261);
total5(:,5) = totalh5(x,262);
total5(:,6) = totalh5(x,268);
total5(:,12:14) = totalh5(x,278:280);

% check matching
total5(:,15) = total5(:,9) - total5(:,12);
total5(:,16) = total5(:,10) - total5(:,13);
total5(:,17) = total5(:,11) - total5(:,14);

% diffs
total5(:,18) = total5(:,1) - total5(:,4);
total5(:,19) = total5(:,2) - total5(:,5);
total5(:,20) = total5(:,3) - total5(:,6);

% age group
total5(:,21) = 5;

% betas (HRFtd)
total5(:,22:24) = totalh5(x,271:273);


% PL outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total5(:,1),'mean');
y = isoutlier(total5(:,4),'mean');
z = isoutlier(total5(:,18),'mean');
m = x + y + z;
n = find(m == 0);
pl_total5 = total5(n,:);

% FWHM outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total5(:,2),'mean');
y = isoutlier(total5(:,5),'mean');
z = isoutlier(total5(:,19),'mean');
m = x + y + z;
n = find(m == 0);
fw_total5 = total5(n,:);

% US outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total5(:,3),'mean');
y = isoutlier(total5(:,6),'mean');
z = isoutlier(total5(:,20),'mean');
m = x + y + z;
n = find(m == 0);
us_total5 = total5(n,:);


% age 6

% Fourier
clear x
x = find(totalf6(:,270) == 1);
total6(:,1) = totalf6(x,261);
total6(:,2) = totalf6(x,262);
total6(:,3) = totalf6(x,268);
% ROI
total6(:,7) = totalf6(x,269);
% PBR vs NBR
total6(:,8) = totalf6(x,265);
total6(:,9:11) = totalf6(x,278:280);

% HRFtd
clear x
x = find(totalh6(:,270) == 1);
total6(:,4) = totalh6(x,261);
total6(:,5) = totalh6(x,262);
total6(:,6) = totalh6(x,268);
total6(:,12:14) = totalh6(x,278:280);

% check matching
total6(:,15) = total6(:,9) - total6(:,12);
total6(:,16) = total6(:,10) - total6(:,13);
total6(:,17) = total6(:,11) - total6(:,14);

% diffs
total6(:,18) = total6(:,1) - total6(:,4);
total6(:,19) = total6(:,2) - total6(:,5);
total6(:,20) = total6(:,3) - total6(:,6);

% age group
total6(:,21) = 6;

% betas (HRFtd)
total6(:,22:24) = totalh6(x,271:273);


% PL outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total6(:,1),'mean');
y = isoutlier(total6(:,4),'mean');
z = isoutlier(total6(:,18),'mean');
m = x + y + z;
n = find(m == 0);
pl_total6 = total6(n,:);

% FWHM outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total6(:,2),'mean');
y = isoutlier(total6(:,5),'mean');
z = isoutlier(total6(:,19),'mean');
m = x + y + z;
n = find(m == 0);
fw_total6 = total6(n,:);

% US outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total6(:,3),'mean');
y = isoutlier(total6(:,6),'mean');
z = isoutlier(total6(:,20),'mean');
m = x + y + z;
n = find(m == 0);
us_total6 = total6(n,:);


% age 7

% Fourier
clear x
x = find(totalf7(:,270) == 1);
total7(:,1) = totalf7(x,261);
total7(:,2) = totalf7(x,262);
total7(:,3) = totalf7(x,268);
% ROI
total7(:,7) = totalf7(x,269);
% PBR vs NBR
total7(:,8) = totalf7(x,265);
total7(:,9:11) = totalf7(x,278:280);

% HRFtd
clear x
x = find(totalh7(:,270) == 1);
total7(:,4) = totalh7(x,261);
total7(:,5) = totalh7(x,262);
total7(:,6) = totalh7(x,268);
total7(:,12:14) = totalh7(x,278:280);

% check matching
total7(:,15) = total7(:,9) - total7(:,12);
total7(:,16) = total7(:,10) - total7(:,13);
total7(:,17) = total7(:,11) - total7(:,14);

% diffs
total7(:,18) = total7(:,1) - total7(:,4);
total7(:,19) = total7(:,2) - total7(:,5);
total7(:,20) = total7(:,3) - total7(:,6);

% age group
total7(:,21) = 7;

% betas (HRFtd)
total7(:,22:24) = totalh7(x,271:273);


% PL outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total7(:,1),'mean');
y = isoutlier(total7(:,4),'mean');
z = isoutlier(total7(:,18),'mean');
m = x + y + z;
n = find(m == 0);
pl_total7 = total7(n,:);

% FWHM outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total7(:,2),'mean');
y = isoutlier(total7(:,5),'mean');
z = isoutlier(total7(:,19),'mean');
m = x + y + z;
n = find(m == 0);
fw_total7 = total7(n,:);

% US outliers
clear x
clear y
clear z
clear m
clear n
x = isoutlier(total7(:,3),'mean');
y = isoutlier(total7(:,6),'mean');
z = isoutlier(total7(:,20),'mean');
m = x + y + z;
n = find(m == 0);
us_total7 = total7(n,:);


% stack all age groups
grand = [total1; total2; total3; total4; total5; total6; total7];
for n = 1:length(grand(:,1));
    if grand(n,8) > 0;
        grand(n,8) = 1;
    elseif grand(n,8) < 0;
        grand(n,8) = -1;
    end
end

%PL
grand_pl = [pl_total1; pl_total2; pl_total3; pl_total4; pl_total5; pl_total6; pl_total7];
for n = 1:length(grand_pl(:,1));
    if grand_pl(n,8) > 0;
        grand_pl(n,8) = 1;
    elseif grand_pl(n,8) < 0;
        grand_pl(n,8) = -1;
    end
end

grand_fw = [fw_total1; fw_total2; fw_total3; fw_total4; fw_total5; fw_total6; fw_total7];
for n = 1:length(grand_fw(:,1));
    if grand_fw(n,8) > 0;
        grand_fw(n,8) = 1;
    elseif grand_fw(n,8) < 0;
        grand_fw(n,8) = -1;
    end
end

grand_us = [us_total1; us_total2; us_total3; us_total4; us_total5; us_total6; us_total7];
for n = 1:length(grand_us(:,1));
    if grand_us(n,8) > 0;
        grand_us(n,8) = 1;
    elseif grand_us(n,8) < 0;
        grand_us(n,8) = -1;
    end
end

check1 = sum(grand(:,15));
check2 = sum(grand(:,16));
check3 = sum(grand(:,17));

% create percentage betas
clear n
for n = 1:length(grand(:,1));
    clear x
    x = sum(abs(grand(n,22:24)));
    clear y
    y = (abs(grand(n,22:24)) ./ x) .* 100;
    if grand(n,22) < 0;
        y(1) = y(1) .* -1;
    end
    if grand(n,23) < 0;
        y(2) = y(2) .* -1;
    end
    if grand(n,24) < 0;
        y(3) = y(3) .* -1;
    end
    grand(n,25:27) = y;
end

cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/age_effects/parameter_analysis/GM';

save data_GM_US grand
save data_GM_usOUT2 grand_us

% % plot checks age1
% figure(1);
% subplot(3,3,1); histogram(total1(:,1));
% title('fourier PL age1');
% 
% figure(1);
% subplot(3,3,2); histogram(total1(:,2));
% title('fourier FWHM age1');
% 
% figure(1);
% subplot(3,3,3); histogram(total1(:,3));
% title('fourier US age1');
% 
% figure(1);
% subplot(3,3,4); histogram(total1(:,4));
% title('hrftd PL age1');
% 
% figure(1);
% subplot(3,3,5); histogram(total1(:,5));
% title('hrftd FWHM age1');
% 
% figure(1);
% subplot(3,3,6); histogram(total1(:,6));
% title('hrftd US age1');
% 
% figure(1);
% subplot(3,3,7); histogram(total1(:,18));
% title('PL diff age1');
% 
% figure(1);
% subplot(3,3,8); histogram(total1(:,19));
% title('FWHM diff age1');
% 
% figure(1);
% subplot(3,3,9); histogram(total1(:,20));
% title('US diff age1');
% 
% % plot checks age2
% figure(2);
% subplot(3,3,1); histogram(total2(:,1));
% title('fourier PL age2');
% 
% figure(2);
% subplot(3,3,2); histogram(total2(:,2));
% title('fourier FWHM age2');
% 
% figure(2);
% subplot(3,3,3); histogram(total2(:,3));
% title('fourier US age2');
% 
% figure(2);
% subplot(3,3,4); histogram(total2(:,4));
% title('hrftd PL age2');
% 
% figure(2);
% subplot(3,3,5); histogram(total2(:,5));
% title('hrftd FWHM age2');
% 
% figure(2);
% subplot(3,3,6); histogram(total2(:,6));
% title('hrftd US age2');
% 
% figure(2);
% subplot(3,3,7); histogram(total2(:,18));
% title('PL diff age2');
% 
% figure(2);
% subplot(3,3,8); histogram(total2(:,19));
% title('FWHM diff age2');
% 
% figure(2);
% subplot(3,3,9); histogram(total2(:,20));
% title('US diff age2');
% 
% % plot checks age3
% figure(3);
% subplot(3,3,1); histogram(total3(:,1));
% title('fourier PL age3');
% 
% figure(3);
% subplot(3,3,2); histogram(total3(:,2));
% title('fourier FWHM age3');
% 
% figure(3);
% subplot(3,3,3); histogram(total3(:,3));
% title('fourier US age3');
% 
% figure(3);
% subplot(3,3,4); histogram(total3(:,4));
% title('hrftd PL age3');
% 
% figure(3);
% subplot(3,3,5); histogram(total3(:,5));
% title('hrftd FWHM age3');
% 
% figure(3);
% subplot(3,3,6); histogram(total3(:,6));
% title('hrftd US age3');
% 
% figure(3);
% subplot(3,3,7); histogram(total3(:,18));
% title('PL diff age3');
% 
% figure(3);
% subplot(3,3,8); histogram(total3(:,19));
% title('FWHM diff age3');
% 
% figure(3);
% subplot(3,3,9); histogram(total3(:,20));
% title('US diff age3');
% 
% % plot checks age4
% figure(4);
% subplot(3,3,1); histogram(total4(:,1));
% title('fourier PL age4');
% 
% figure(4);
% subplot(3,3,2); histogram(total4(:,2));
% title('fourier FWHM age4');
% 
% figure(4);
% subplot(3,3,3); histogram(total4(:,3));
% title('fourier US age4');
% 
% figure(4);
% subplot(3,3,4); histogram(total4(:,4));
% title('hrftd PL age4');
% 
% figure(4);
% subplot(3,3,5); histogram(total4(:,5));
% title('hrftd FWHM age4');
% 
% figure(4);
% subplot(3,3,6); histogram(total4(:,6));
% title('hrftd US age4');
% 
% figure(4);
% subplot(3,3,7); histogram(total4(:,18));
% title('PL diff age4');
% 
% figure(4);
% subplot(3,3,8); histogram(total4(:,19));
% title('FWHM diff age4');
% 
% figure(4);
% subplot(3,3,9); histogram(total4(:,20));
% title('US diff age4');
% 
% % plot checks age5
% figure(5);
% subplot(3,3,1); histogram(total5(:,1));
% title('fourier PL age5');
% 
% figure(5);
% subplot(3,3,2); histogram(total5(:,2));
% title('fourier FWHM age5');
% 
% figure(5);
% subplot(3,3,3); histogram(total5(:,3));
% title('fourier US age5');
% 
% figure(5);
% subplot(3,3,4); histogram(total5(:,4));
% title('hrftd PL age5');
% 
% figure(5);
% subplot(3,3,5); histogram(total5(:,5));
% title('hrftd FWHM age5');
% 
% figure(5);
% subplot(3,3,6); histogram(total5(:,6));
% title('hrftd US age5');
% 
% figure(5);
% subplot(3,3,7); histogram(total5(:,18));
% title('PL diff age5');
% 
% figure(5);
% subplot(3,3,8); histogram(total5(:,19));
% title('FWHM diff age5');
% 
% figure(5);
% subplot(3,3,9); histogram(total5(:,20));
% title('US diff age5');
% 
% % plot checks age6
% figure(6);
% subplot(3,3,1); histogram(total6(:,1));
% title('fourier PL age6');
% 
% figure(6);
% subplot(3,3,2); histogram(total6(:,2));
% title('fourier FWHM age6');
% 
% figure(6);
% subplot(3,3,3); histogram(total6(:,3));
% title('fourier US age6');
% 
% figure(6);
% subplot(3,3,4); histogram(total6(:,4));
% title('hrftd PL age6');
% 
% figure(6);
% subplot(3,3,5); histogram(total6(:,5));
% title('hrftd FWHM age6');
% 
% figure(6);
% subplot(3,3,6); histogram(total6(:,6));
% title('hrftd US age6');
% 
% figure(6);
% subplot(3,3,7); histogram(total6(:,18));
% title('PL diff age6');
% 
% figure(6);
% subplot(3,3,8); histogram(total6(:,19));
% title('FWHM diff age6');
% 
% figure(6);
% subplot(3,3,9); histogram(total6(:,20));
% title('US diff age6');
% 
% 
% % plot checks age7
% figure(7);
% subplot(3,3,1); histogram(total7(:,1));
% title('fourier PL age7');
% 
% figure(7);
% subplot(3,3,2); histogram(total7(:,2));
% title('fourier FWHM age7');
% 
% figure(7);
% subplot(3,3,3); histogram(total7(:,3));
% title('fourier US age7');
% 
% figure(7);
% subplot(3,3,4); histogram(total7(:,4));
% title('hrftd PL age7');
% 
% figure(7);
% subplot(3,3,5); histogram(total7(:,5));
% title('hrftd FWHM age7');
% 
% figure(7);
% subplot(3,3,6); histogram(total7(:,6));
% title('hrftd US age7');
% 
% figure(7);
% subplot(3,3,7); histogram(total7(:,18));
% title('PL diff age7');
% 
% figure(7);
% subplot(3,3,8); histogram(total7(:,19));
% title('FWHM diff age7');
% 
% figure(7);
% subplot(3,3,9); histogram(total7(:,20));
% title('US diff age7');

