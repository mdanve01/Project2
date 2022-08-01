addpath /usr/local/apps/psycapps/spm/spm12-r7487;

cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/all_voxels';
gm = niftiread('old_gm.nii');

% BEAR IN MIND THE APFC USES A .001 THRESHOLD, EVERYTHING ELSE IS FWE .05
% load all the HRFc F stat masks
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/hrf_conimages/1_con';
cage1 = niftiread('age1_nomask.nii');
cage2 = niftiread('age2_nomask.nii');
cage3 = niftiread('age3_nomask.nii');
cage4 = niftiread('age4_nomask.nii');
cage5 = niftiread('age5_nomask.nii');
cage6 = niftiread('age6_nomask.nii');
cage7 = niftiread('age7_nomask.nii');

% load all the Fourier F stat masks
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/fourier_conimages/1_con';
fage1 = niftiread('age1_nomask.nii');
fage2 = niftiread('age2_nomask.nii');
fage3 = niftiread('age3_nomask.nii');
fage4 = niftiread('age4_nomask.nii');
fage5 = niftiread('age5_nomask.nii');
fage6 = niftiread('age6_nomask.nii');
fage7 = niftiread('age7_nomask.nii');

% load all the HRFtd F stat masks
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/hrf_td_conimages/1_con';
age1 = niftiread('age1_nomask.nii');
age2 = niftiread('age2_nomask.nii');
age3 = niftiread('age3_nomask.nii');
age4 = niftiread('age4_nomask.nii');
age5 = niftiread('age5_nomask.nii');
age6 = niftiread('age6_nomask.nii');
age7 = niftiread('age7_nomask.nii');

% find all locations where we have significance
loc = find(gm > .5 & age1 > 0 & age2 > 0 & age3 > 0 & age4 > 0 & age5 > 0 & age6 > 0 & age7 > 0 & cage1 > 0 & cage2 > 0 & cage3 > 0 & cage4 > 0 & cage5 > 0 & cage6 > 0 & cage7 > 0 & fage1 > 0 & fage2 > 0 & fage3 > 0 & fage4 > 0 & fage5 > 0 & fage6 > 0 & fage7 > 0);

% load the demographic file
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/pathways';
list = importdata('demo_finalN.mat');

% create a set of pathways to the 1st level of analysis
clear n
for n = 1:length(list(:,1));
    clear name
    name = string(list(n,1));
    old_route{n} = strcat('/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/hrf_conimages/all_con/con_CC',name);
end

% save all the ages
age(:,1) = list(:,2);
age(:,2:4) = 0;

% cycle through each participant and look for the number of neg and pos
% betas at the relevant coordinates
for m = 1:length(old_route);
    cd(old_route{m});
    clear one
    clear a
    clear XYZ
    one = spm_vol('con_0001.nii');
    [a,XYZ]=spm_read_vols(one);            
    age(m,2) = length(find(a(loc) < 0));
    age(m,3) = length(find(a(loc) > 0));
    % set percentage of negatives
    age(m,4) = age(m,2) ./ (age(m,2) + age(m,3));
end

cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/age_effects/parameter_analysis/GM/1st_level';
% calculate the % NBRs of each participant, accross the 100 voxels. Can then correlate the response with age.
clear n
age(:,4) = age(:,4) .* 100;

save age_data_all age

figure(9);
scatter(age(:,1),age(:,4),10,'r','filled');
xlabel('Age (years)');
ylabel('Negative BOLD Responses (%)');

clear RHO
clear PVAL
[RHO,PVAL] = corr(age(:,1),age(:,4),'type','Pearson');
results(1,1) = RHO;
results(2,1) = PVAL;

save Age_correlations_all results
