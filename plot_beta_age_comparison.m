cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/age_effects/parameter_analysis/GM';
load('data_GM_US.mat');

% isolate the different age groups
clear x
x = find(grand(:,21) == 1);
age1 = grand(x,:);
clear x
x = find(grand(:,21) == 2);
age2 = grand(x,:);
clear x
x = find(grand(:,21) == 3);
age3 = grand(x,:);
clear x
x = find(grand(:,21) == 4);
age4 = grand(x,:);
clear x
x = find(grand(:,21) == 5);
age5 = grand(x,:);
clear x
x = find(grand(:,21) == 6);
age6 = grand(x,:);
clear x
x = find(grand(:,21) == 7);
age7 = grand(x,:);

figure(1);
subplot(4,2,1); histogram(age1(:,25));
subplot(4,2,2); histogram(age2(:,25));
subplot(4,2,3); histogram(age3(:,25));
subplot(4,2,4); histogram(age4(:,25));
subplot(4,2,5); histogram(age5(:,25));
subplot(4,2,6); histogram(age6(:,25));
subplot(4,2,7); histogram(age7(:,25));

figure(2);
subplot(4,2,1); histogram(age1(:,26));
subplot(4,2,2); histogram(age2(:,26));
subplot(4,2,3); histogram(age3(:,26));
subplot(4,2,4); histogram(age4(:,26));
subplot(4,2,5); histogram(age5(:,26));
subplot(4,2,6); histogram(age6(:,26));
subplot(4,2,7); histogram(age7(:,26));

figure(3);
subplot(4,2,1); histogram(age1(:,27));
subplot(4,2,2); histogram(age2(:,27));
subplot(4,2,3); histogram(age3(:,27));
subplot(4,2,4); histogram(age4(:,27));
subplot(4,2,5); histogram(age5(:,27));
subplot(4,2,6); histogram(age6(:,27));
subplot(4,2,7); histogram(age7(:,27));

total(1,1) = median(age1(:,25));
total(1,2) = min(age1(:,25));
total(1,3) = max(age1(:,25));
total(2,1) = median(age2(:,25));
total(2,2) = min(age2(:,25));
total(2,3) = max(age2(:,25));
total(3,1) = median(age3(:,25));
total(3,2) = min(age3(:,25));
total(3,3) = max(age3(:,25));
total(4,1) = median(age4(:,25));
total(4,2) = min(age4(:,25));
total(4,3) = max(age4(:,25));
total(5,1) = median(age5(:,25));
total(5,2) = min(age5(:,25));
total(5,3) = max(age5(:,25));
total(6,1) = median(age6(:,25));
total(6,2) = min(age6(:,25));
total(6,3) = max(age6(:,25));
total(7,1) = median(age7(:,25));
total(7,2) = min(age7(:,25));
total(7,3) = max(age7(:,25));