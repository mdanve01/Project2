cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/age_effects/parameter_analysis/GM';
load('data_GM.mat');
clear x
clear y
clear z
x = find(grand(:,21) == 1);
y = find(grand(:,21) == 2);
z = find(grand(:,21) == 3);

young(:,1:2) = (grand(x,1:2) + grand(y,1:2) + grand(z,1:2)) ./ 3;
young(:,3:21) = grand(x,3:21);

clear x
clear y
clear z
x = find(grand(:,21) == 5);
y = find(grand(:,21) == 6);
z = find(grand(:,21) == 7);

old(:,1:2) = (grand(x,1:2) + grand(y,1:2) + grand(z,1:2)) ./ 3;
old(:,3:21) = grand(x,3:21);

total(:,1:2) = old(:,1:2) - young(:,1:2);
total(:,3:21) = young(:,3:21);

peak_lat(1:121,1:145,1:121) = 0.0001;
fwhm(1:121,1:145,1:121) = 0.0001;

for n = 1:length(total(:,1));
    clear x
    clear y
    clear z
    x = total(n,9);
    y = total(n,10);
    z = total(n,11);
    peak_lat(x,y,z) = total(n,1);
    fwhm(x,y,z) = total(n,2);
end

cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/age_effects/parameter_analysis/GM/visualisation';
save peak_lat peak_lat
save fwhm fwhm
niftiwrite(peak_lat,'peak_lat.nii');
niftiwrite(fwhm,'fwhm.nii');
