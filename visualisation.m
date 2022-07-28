cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/age_effects/parameter_analysis/GM';
load('data_GM.mat');
clear x
x = find(grand(:,21) == 1);
total = grand(x,:);

image(1:121,1:145,1:121) = 0.0001;

for n = 1:length(total(:,1));
    clear x
    clear y
    clear z
    x = total(n,9);
    y = total(n,10);
    z = total(n,11);
    image(x,y,z) = 1;
end

cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/age_effects/parameter_analysis/GM/visualisation';
save image image
niftiwrite(image,'image.nii');