cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/all_voxels';
mask = niftiread('old_gm.nii');

% HRFc
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/hrf_conimages/1_con';
hrf_1 = niftiread('age1_nomask.nii');
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/hrf_conimages/1_con';
hrf_2 = niftiread('age2_nomask.nii');
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/hrf_conimages/1_con';
hrf_3 = niftiread('age3_nomask.nii');
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/hrf_conimages/1_con';
hrf_4 = niftiread('age4_nomask.nii');
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/hrf_conimages/1_con';
hrf_5 = niftiread('age5_nomask.nii');
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/hrf_conimages/1_con';
hrf_6 = niftiread('age6_nomask.nii');
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/hrf_conimages/1_con';
hrf_7 = niftiread('age7_nomask.nii');

% HRFtd
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/hrf_td_conimages/1_con';
hrftd_1 = niftiread('age1_nomask.nii');
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/hrf_td_conimages/1_con';
hrftd_2 = niftiread('age2_nomask.nii');
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/hrf_td_conimages/1_con';
hrftd_3 = niftiread('age3_nomask.nii');
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/hrf_td_conimages/1_con';
hrftd_4 = niftiread('age4_nomask.nii');
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/hrf_td_conimages/1_con';
hrftd_5 = niftiread('age5_nomask.nii');
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/hrf_td_conimages/1_con';
hrftd_6 = niftiread('age6_nomask.nii');
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/hrf_td_conimages/1_con';
hrftd_7 = niftiread('age7_nomask.nii');

% Fourier
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/fourier_conimages/1_con';
fourier_1 = niftiread('age1_nomask.nii');
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/fourier_conimages/1_con';
fourier_2 = niftiread('age2_nomask.nii');
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/fourier_conimages/1_con';
fourier_3 = niftiread('age3_nomask.nii');
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/fourier_conimages/1_con';
fourier_4 = niftiread('age4_nomask.nii');
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/fourier_conimages/1_con';
fourier_5 = niftiread('age5_nomask.nii');
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/fourier_conimages/1_con';
fourier_6 = niftiread('age6_nomask.nii');
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/fourier_conimages/1_con';
fourier_7 = niftiread('age7_nomask.nii');

for first = 1:length(mask(:,1,1));
    for second = 1:length(mask(1,:,1));
        for third = 1:length(mask(1,1,:));
            if mask(first,second,third) > 0.5;
                if hrf_1(first,second,third) > 0;
                    hrf_1_gm(first,second,third) = 1;
                end
                if hrf_2(first,second,third) > 0;
                    hrf_2_gm(first,second,third) = 1;
                end
                if hrf_3(first,second,third) > 0;
                    hrf_3_gm(first,second,third) = 1;
                end
                if hrf_4(first,second,third) > 0;
                    hrf_4_gm(first,second,third) = 1;
                end
                if hrf_5(first,second,third) > 0;
                    hrf_5_gm(first,second,third) = 1;
                end
                if hrf_6(first,second,third) > 0;
                    hrf_6_gm(first,second,third) = 1;
                end
                if hrf_7(first,second,third) > 0;
                    hrf_7_gm(first,second,third) = 1;
                end
                if hrftd_1(first,second,third) > 0;
                    hrftd_1_gm(first,second,third) = 1;
                end
                if hrftd_2(first,second,third) > 0;
                    hrftd_2_gm(first,second,third) = 1;
                end
                if hrftd_3(first,second,third) > 0;
                    hrftd_3_gm(first,second,third) = 1;
                end
                if hrftd_4(first,second,third) > 0;
                    hrftd_4_gm(first,second,third) = 1;
                end
                if hrftd_5(first,second,third) > 0;
                    hrftd_5_gm(first,second,third) = 1;
                end
                if hrftd_6(first,second,third) > 0;
                    hrftd_6_gm(first,second,third) = 1;
                end
                if hrftd_7(first,second,third) > 0;
                    hrftd_7_gm(first,second,third) = 1;
                end
                if fourier_1(first,second,third) > 0;
                    fourier_1_gm(first,second,third) = 1;
                end
                if fourier_2(first,second,third) > 0;
                    fourier_2_gm(first,second,third) = 1;
                end
                if fourier_3(first,second,third) > 0;
                    fourier_3_gm(first,second,third) = 1;
                end
                if fourier_4(first,second,third) > 0;
                    fourier_4_gm(first,second,third) = 1;
                end
                if fourier_5(first,second,third) > 0;
                    fourier_5_gm(first,second,third) = 1;
                end
                if fourier_6(first,second,third) > 0;
                    fourier_6_gm(first,second,third) = 1;
                end
                if fourier_7(first,second,third) > 0;
                    fourier_7_gm(first,second,third) = 1;
                end
            end
        end
    end
end

cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/age_effects/parameter_analysis/GM/number_of_voxel';

age(1,1) = sum(sum(sum(hrf_1_gm)));
age(2,1) = sum(sum(sum(hrf_2_gm)));
age(3,1) = sum(sum(sum(hrf_3_gm)));
age(4,1) = sum(sum(sum(hrf_4_gm)));
age(5,1) = sum(sum(sum(hrf_5_gm)));
age(6,1) = sum(sum(sum(hrf_6_gm)));
age(7,1) = sum(sum(sum(hrf_7_gm)));

age(1,2) = sum(sum(sum(hrftd_1_gm)));
age(2,2) = sum(sum(sum(hrftd_2_gm)));
age(3,2) = sum(sum(sum(hrftd_3_gm)));
age(4,2) = sum(sum(sum(hrftd_4_gm)));
age(5,2) = sum(sum(sum(hrftd_5_gm)));
age(6,2) = sum(sum(sum(hrftd_6_gm)));
age(7,2) = sum(sum(sum(hrftd_7_gm)));


age(1,3) = sum(sum(sum(fourier_1_gm)));
age(2,3) = sum(sum(sum(fourier_2_gm)));
age(3,3) = sum(sum(sum(fourier_3_gm)));
age(4,3) = sum(sum(sum(fourier_4_gm)));
age(5,3) = sum(sum(sum(fourier_5_gm)));
age(6,3) = sum(sum(sum(fourier_6_gm)));
age(7,3) = sum(sum(sum(fourier_7_gm)));


age(8,1) = sum(age(1:3,1));
age(9,1) = sum(age(5:7,1));
age(10,1) = age(8,1) ./ age(9,1);

age(8,2) = sum(age(1:3,2));
age(9,2) = sum(age(5:7,2));
age(10,2) = age(8,2) ./ age(9,2);

age(8,3) = sum(age(1:3,3));
age(9,3) = sum(age(5:7,3));
age(10,3) = age(8,3) ./ age(9,3);

niftiwrite(hrf_1_gm,'hrf_1.nii');
niftiwrite(hrf_2_gm,'hrf_2.nii');
niftiwrite(hrf_3_gm,'hrf_3.nii');
niftiwrite(hrf_4_gm,'hrf_4.nii');
niftiwrite(hrf_5_gm,'hrf_5.nii');
niftiwrite(hrf_6_gm,'hrf_6.nii');
niftiwrite(hrf_7_gm,'hrf_7.nii');

niftiwrite(hrftd_1_gm,'hrftd_1.nii');
niftiwrite(hrftd_2_gm,'hrftd_2.nii');
niftiwrite(hrftd_3_gm,'hrftd_3.nii');
niftiwrite(hrftd_4_gm,'hrftd_4.nii');
niftiwrite(hrftd_5_gm,'hrftd_5.nii');
niftiwrite(hrftd_6_gm,'hrftd_6.nii');
niftiwrite(hrftd_7_gm,'hrftd_7.nii'); 

niftiwrite(fourier_1_gm,'fourier_1.nii');
niftiwrite(fourier_2_gm,'fourier_2.nii');
niftiwrite(fourier_3_gm,'fourier_3.nii');
niftiwrite(fourier_4_gm,'fourier_4.nii');
niftiwrite(fourier_5_gm,'fourier_5.nii');
niftiwrite(fourier_6_gm,'fourier_6.nii');
niftiwrite(fourier_7_gm,'fourier_7.nii');

save table age
