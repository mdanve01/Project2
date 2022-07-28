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

% plot functions
first_f = mean(totalf1(:,1:147));
secon_f = mean(totalf2(:,1:147));
third_f = mean(totalf3(:,1:147));
fourt_f = mean(totalf4(:,1:147));
fifth_f = mean(totalf5(:,1:147));
sixth_f = mean(totalf6(:,1:147));
seven_f = mean(totalf7(:,1:147));
first_h = mean(totalh1(:,1:147));
secon_h = mean(totalh2(:,1:147));
third_h = mean(totalh3(:,1:147));
fourt_h = mean(totalh4(:,1:147));
fifth_h = mean(totalh5(:,1:147));
sixth_h = mean(totalh6(:,1:147));
seven_h = mean(totalh7(:,1:147));

run1 = first_f ./ max(first_f);
run2 = secon_f ./ max(secon_f);
run3 = third_f ./ max(third_f);
run4 = fourt_f ./ max(fourt_f);
run5 = fifth_f ./ max(fifth_f);
run6 = sixth_f ./ max(sixth_f);
run7 = seven_f ./ max(seven_f);

runh1 = first_h ./ max(first_h);
runh2 = secon_h ./ max(secon_h);
runh3 = third_h ./ max(third_h);
runh4 = fourt_h ./ max(fourt_h);
runh5 = fifth_h ./ max(fifth_h);
runh6 = sixth_h ./ max(sixth_h);
runh7 = seven_h ./ max(seven_h);

windowf = 18;
windowh = 18;
secf = 147 ./ windowf;
sech = 147 ./ windowh;

figure(99);
subplot(2,2,1);
plot(run1,'LineWidth',2);
hold on
plot(run2,'LineWidth',2);
plot(run3,'LineWidth',2);
plot(run4,'LineWidth',2);
plot(run5,'LineWidth',2);
plot(run6,'LineWidth',2);
plot(run7,'LineWidth',2);
legend('18-27','28-37','38-47','48-57','58-67','68-77','78-88');
xlabel('Time (secs)');
ylabel('Normalised Amplitude');
title('Fourier');
xbins = 0: (2*secf): (secf*windowf);
set(gca, 'xtick', xbins);
xt = get(gca, 'XTick');                                 
set(gca, 'XTick', xt, 'XTickLabel', round(xt/secf,2));
ylim([-0.5 1.2]);
hold off

figure(99);
subplot(2,2,2);
plot(first_f,'LineWidth',2);
hold on
plot(secon_f,'LineWidth',2);
plot(third_f,'LineWidth',2);
plot(fourt_f,'LineWidth',2);
plot(fifth_f,'LineWidth',2);
plot(sixth_f,'LineWidth',2);
plot(seven_f,'LineWidth',2);
legend('18-27','28-37','38-47','48-57','58-67','68-77','78-88');
xlabel('Time (secs)');
ylabel('Signal Change %');
title('Fourier');
xbins = 0: (2*secf): (secf*windowf);
set(gca, 'xtick', xbins);
xt = get(gca, 'XTick');                                 
set(gca, 'XTick', xt, 'XTickLabel', round(xt/secf,2));
% ylim([-0.5 1.2]);
hold off

figure(99);
subplot(2,2,3);
plot(runh1,'LineWidth',2);
hold on
plot(runh2,'LineWidth',2);
plot(runh3,'LineWidth',2);
plot(runh4,'LineWidth',2);
plot(runh5,'LineWidth',2);
plot(runh6,'LineWidth',2);
plot(runh7,'LineWidth',2);
legend('18-27','28-37','38-47','48-57','58-67','68-77','78-88');
xlabel('Time (secs)');
ylabel('Normalised Amplitude');
title('HRFtd');
xbins = 0: (2*sech): (sech*windowh);
set(gca, 'xtick', xbins);
xt = get(gca, 'XTick');                                 
set(gca, 'XTick', xt, 'XTickLabel', round(xt/sech,2));
ylim([-0.6 1.2]);
hold off

figure(99);
subplot(2,2,4);
plot(first_h,'LineWidth',2);
hold on
plot(secon_h,'LineWidth',2);
plot(third_h,'LineWidth',2);
plot(fourt_h,'LineWidth',2);
plot(fifth_h,'LineWidth',2);
plot(sixth_h,'LineWidth',2);
plot(seven_h,'LineWidth',2);
legend('18-27','28-37','38-47','48-57','58-67','68-77','78-88');
xlabel('Time (secs)');
ylabel('Signal Change %');
title('HRFtd');
xbins = 0: (2*sech): (sech*windowh);
set(gca, 'xtick', xbins);
xt = get(gca, 'XTick');                                 
set(gca, 'XTick', xt, 'XTickLabel', round(xt/sech,2));
% ylim([-0.5 1.2]);
hold off



% age 1

% Fourier
clear x
% finds GM voxels
x = find(totalf1(:,270) == 1);
% peak latency
total1(:,1) = totalf1(x,261);
% FWHM
total1(:,2) = totalf1(x,262);
% US:peak
total1(:,3) = totalf1(x,268);
% ROI - NOT USED HERE
total1(:,7) = totalf1(x,269);
% PBR vs NBR
total1(:,8) = totalf1(x,265);
% coordinates
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
clear xx
clear x
clear y
clear z
clear m
clear n
xx = find(total1(:,3) > 0 | total1(:,6) > 0);
total1_rem = total1(xx,:);
x = isoutlier(total1_rem(:,3),'mean');
y = isoutlier(total1_rem(:,6),'mean');
z = isoutlier(total1_rem(:,20),'mean');
m = x + y + z;
n = find(m == 0);
us_total1 = total1_rem(n,:);

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

total2(:,21) = 2;

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
clear xx
clear x
clear y
clear z
clear m
clear n
xx = find(total2(:,3) > 0 | total2(:,6) > 0);
total2_rem = total2(xx,:);
x = isoutlier(total2_rem(:,3),'mean');
y = isoutlier(total2_rem(:,6),'mean');
z = isoutlier(total2_rem(:,20),'mean');
m = x + y + z;
n = find(m == 0);
us_total2 = total2_rem(n,:);


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

total3(:,21) = 3;

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
clear xx
clear x
clear y
clear z
clear m
clear n
xx = find(total3(:,3) > 0 | total3(:,6) > 0);
total3_rem = total3(xx,:);
x = isoutlier(total3_rem(:,3),'mean');
y = isoutlier(total3_rem(:,6),'mean');
z = isoutlier(total3_rem(:,20),'mean');
m = x + y + z;
n = find(m == 0);
us_total3 = total3_rem(n,:);


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

total4(:,21) = 4;

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
clear xx
clear x
clear y
clear z
clear m
clear n
xx = find(total4(:,3) > 0 | total4(:,6) > 0);
total4_rem = total4(xx,:);
x = isoutlier(total4_rem(:,3),'mean');
y = isoutlier(total4_rem(:,6),'mean');
z = isoutlier(total4_rem(:,20),'mean');
m = x + y + z;
n = find(m == 0);
us_total4 = total4_rem(n,:);


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

total5(:,21) = 5;

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
clear xx
clear x
clear y
clear z
clear m
clear n
xx = find(total5(:,3) > 0 | total5(:,6) > 0);
total5_rem = total5(xx,:);
x = isoutlier(total5_rem(:,3),'mean');
y = isoutlier(total5_rem(:,6),'mean');
z = isoutlier(total5_rem(:,20),'mean');
m = x + y + z;
n = find(m == 0);
us_total5 = total5_rem(n,:);


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

total6(:,21) = 6;

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
clear xx
clear x
clear y
clear z
clear m
clear n
xx = find(total6(:,3) > 0 | total6(:,6) > 0);
total6_rem = total6(xx,:);
x = isoutlier(total6_rem(:,3),'mean');
y = isoutlier(total6_rem(:,6),'mean');
z = isoutlier(total6_rem(:,20),'mean');
m = x + y + z;
n = find(m == 0);
us_total6 = total6_rem(n,:);


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

total7(:,21) = 7;

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
clear xx
clear x
clear y
clear z
clear m
clear n
xx = find(total7(:,3) > 0 | total7(:,6) > 0);
total7_rem = total7(xx,:);
x = isoutlier(total7_rem(:,3),'mean');
y = isoutlier(total7_rem(:,6),'mean');
z = isoutlier(total7_rem(:,20),'mean');
m = x + y + z;
n = find(m == 0);
us_total7 = total7_rem(n,:);


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

cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/age_effects/parameter_analysis/GM';

save data_GM grand
save data_GM_plOUT grand_pl
save data_GM_fwOUT grand_fw


% plot checks age1
figure(1);
subplot(3,3,1); histogram(total1(:,1));
title('fourier PL age1');

figure(1);
subplot(3,3,2); histogram(total1(:,2));
title('fourier FWHM age1');

figure(1);
subplot(3,3,3); histogram(total1(:,3));
title('fourier US age1');

figure(1);
subplot(3,3,4); histogram(total1(:,4));
title('hrftd PL age1');

figure(1);
subplot(3,3,5); histogram(total1(:,5));
title('hrftd FWHM age1');

figure(1);
subplot(3,3,6); histogram(total1(:,6));
title('hrftd US age1');

figure(1);
subplot(3,3,7); histogram(total1(:,18));
title('PL diff age1');

figure(1);
subplot(3,3,8); histogram(total1(:,19));
title('FWHM diff age1');

figure(1);
subplot(3,3,9); histogram(total1(:,20));
title('US diff age1');

% plot checks age2
figure(2);
subplot(3,3,1); histogram(total2(:,1));
title('fourier PL age2');

figure(2);
subplot(3,3,2); histogram(total2(:,2));
title('fourier FWHM age2');

figure(2);
subplot(3,3,3); histogram(total2(:,3));
title('fourier US age2');

figure(2);
subplot(3,3,4); histogram(total2(:,4));
title('hrftd PL age2');

figure(2);
subplot(3,3,5); histogram(total2(:,5));
title('hrftd FWHM age2');

figure(2);
subplot(3,3,6); histogram(total2(:,6));
title('hrftd US age2');

figure(2);
subplot(3,3,7); histogram(total2(:,18));
title('PL diff age2');

figure(2);
subplot(3,3,8); histogram(total2(:,19));
title('FWHM diff age2');

figure(2);
subplot(3,3,9); histogram(total2(:,20));
title('US diff age2');

% plot checks age3
figure(3);
subplot(3,3,1); histogram(total3(:,1));
title('fourier PL age3');

figure(3);
subplot(3,3,2); histogram(total3(:,2));
title('fourier FWHM age3');

figure(3);
subplot(3,3,3); histogram(total3(:,3));
title('fourier US age3');

figure(3);
subplot(3,3,4); histogram(total3(:,4));
title('hrftd PL age3');

figure(3);
subplot(3,3,5); histogram(total3(:,5));
title('hrftd FWHM age3');

figure(3);
subplot(3,3,6); histogram(total3(:,6));
title('hrftd US age3');

figure(3);
subplot(3,3,7); histogram(total3(:,18));
title('PL diff age3');

figure(3);
subplot(3,3,8); histogram(total3(:,19));
title('FWHM diff age3');

figure(3);
subplot(3,3,9); histogram(total3(:,20));
title('US diff age3');

% plot checks age4
figure(4);
subplot(3,3,1); histogram(total4(:,1));
title('fourier PL age4');

figure(4);
subplot(3,3,2); histogram(total4(:,2));
title('fourier FWHM age4');

figure(4);
subplot(3,3,3); histogram(total4(:,3));
title('fourier US age4');

figure(4);
subplot(3,3,4); histogram(total4(:,4));
title('hrftd PL age4');

figure(4);
subplot(3,3,5); histogram(total4(:,5));
title('hrftd FWHM age4');

figure(4);
subplot(3,3,6); histogram(total4(:,6));
title('hrftd US age4');

figure(4);
subplot(3,3,7); histogram(total4(:,18));
title('PL diff age4');

figure(4);
subplot(3,3,8); histogram(total4(:,19));
title('FWHM diff age4');

figure(4);
subplot(3,3,9); histogram(total4(:,20));
title('US diff age4');

% plot checks age5
figure(5);
subplot(3,3,1); histogram(total5(:,1));
title('fourier PL age5');

figure(5);
subplot(3,3,2); histogram(total5(:,2));
title('fourier FWHM age5');

figure(5);
subplot(3,3,3); histogram(total5(:,3));
title('fourier US age5');

figure(5);
subplot(3,3,4); histogram(total5(:,4));
title('hrftd PL age5');

figure(5);
subplot(3,3,5); histogram(total5(:,5));
title('hrftd FWHM age5');

figure(5);
subplot(3,3,6); histogram(total5(:,6));
title('hrftd US age5');

figure(5);
subplot(3,3,7); histogram(total5(:,18));
title('PL diff age5');

figure(5);
subplot(3,3,8); histogram(total5(:,19));
title('FWHM diff age5');

figure(5);
subplot(3,3,9); histogram(total5(:,20));
title('US diff age5');

% plot checks age6
figure(6);
subplot(3,3,1); histogram(total6(:,1));
title('fourier PL age6');

figure(6);
subplot(3,3,2); histogram(total6(:,2));
title('fourier FWHM age6');

figure(6);
subplot(3,3,3); histogram(total6(:,3));
title('fourier US age6');

figure(6);
subplot(3,3,4); histogram(total6(:,4));
title('hrftd PL age6');

figure(6);
subplot(3,3,5); histogram(total6(:,5));
title('hrftd FWHM age6');

figure(6);
subplot(3,3,6); histogram(total6(:,6));
title('hrftd US age6');

figure(6);
subplot(3,3,7); histogram(total6(:,18));
title('PL diff age6');

figure(6);
subplot(3,3,8); histogram(total6(:,19));
title('FWHM diff age6');

figure(6);
subplot(3,3,9); histogram(total6(:,20));
title('US diff age6');


% plot checks age7
figure(7);
subplot(3,3,1); histogram(total7(:,1));
title('fourier PL age7');

figure(7);
subplot(3,3,2); histogram(total7(:,2));
title('fourier FWHM age7');

figure(7);
subplot(3,3,3); histogram(total7(:,3));
title('fourier US age7');

figure(7);
subplot(3,3,4); histogram(total7(:,4));
title('hrftd PL age7');

figure(7);
subplot(3,3,5); histogram(total7(:,5));
title('hrftd FWHM age7');

figure(7);
subplot(3,3,6); histogram(total7(:,6));
title('hrftd US age7');

figure(7);
subplot(3,3,7); histogram(total7(:,18));
title('PL diff age7');

figure(7);
subplot(3,3,8); histogram(total7(:,19));
title('FWHM diff age7');

figure(7);
subplot(3,3,9); histogram(total7(:,20));
title('US diff age7');
