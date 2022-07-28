cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/age_effects/parameter_analysis/GM';
load('data_GM_US.mat');
clear x
clear y
clear z
x = find(grand(:,21) == 1);
y = find(grand(:,21) == 2);
z = find(grand(:,21) == 3);

young(:,1:21) = grand(x,1:21);
young(:,3) = (grand(x,3) + grand(y,3) + grand(z,3)) ./ 3;

clear x
clear y
clear z
x = find(grand(:,21) == 5);
y = find(grand(:,21) == 6);
z = find(grand(:,21) == 7);

old(:,1:21) = grand(x,1:21);
old(:,6) = (grand(x,6) + grand(y,6) + grand(z,6)) ./ 3;

total(:,1:21) = young(:,1:21);
total(:,6) = old(:,6) - young(:,6);
total(:,1:2) = 0;

undershoot(1:121,1:145,1:121) = 0.0001;


for n = 1:length(total(:,1));
    clear x
    clear y
    clear z
    x = total(n,9);
    y = total(n,10);
    z = total(n,11);
    undershoot(x,y,z) = total(n,3);
end

cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/age_effects/parameter_analysis/GM/visualisation';
save undershoot undershoot
niftiwrite(undershoot,'undershoot.nii');
