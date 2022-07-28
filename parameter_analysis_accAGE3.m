function parameter_analysis_accAGE3;
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


% load the functions
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/simulation';
% load the 3 functions
bfsh = importdata('HRFtd.mat');
bfsf = importdata('Fourier.mat');
%%% SET WINDOW LENGTH %%%%
window_h = 32.0125;
window_f = 18;
% calculates how many indices equate to 1 second
sec_h = length(bfsh(:,1)) ./ window_h;
sec_f = length(bfsf(:,1)) ./ window_f;

% go to the second level and load the file containing all coordinates, and
% create a beta file (e.g. a) containing all beta values in a 3d matrix
% HRFtd
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/hrf_td_conimages/1_con';
% age 1
one1 = spm_vol('beta_0001.nii');
[a1,XYZ11]=spm_read_vols(one1);

one2 = spm_vol('beta_0002.nii');
[a2,XYZ12]=spm_read_vols(one2);

one3 = spm_vol('beta_0003.nii');
[a3,XYZ13]=spm_read_vols(one3);


% age2
two1 = spm_vol('beta_0004.nii');
[b1,XYZ21]=spm_read_vols(two1);

two2 = spm_vol('beta_0005.nii');
[b2,XYZ22]=spm_read_vols(two2);

two3 = spm_vol('beta_0006.nii');
[b3,XYZ23]=spm_read_vols(two3);


% age3
three1 = spm_vol('beta_0007.nii');
[c1,XYZ31]=spm_read_vols(three1);

three2 = spm_vol('beta_0008.nii');
[c2,XYZ32]=spm_read_vols(three2);

three3 = spm_vol('beta_0009.nii');
[c3,XYZ33]=spm_read_vols(three3);


% age4
four1 = spm_vol('beta_0010.nii');
[d1,XYZ41]=spm_read_vols(four1);

four2 = spm_vol('beta_0011.nii');
[d2,XYZ42]=spm_read_vols(four2);

four3 = spm_vol('beta_0012.nii');
[d3,XYZ43]=spm_read_vols(four3);


% age5
five1 = spm_vol('beta_0013.nii');
[e1,XYZ51]=spm_read_vols(five1);

five2 = spm_vol('beta_0014.nii');
[e2,XYZ52]=spm_read_vols(five2);

five3 = spm_vol('beta_0015.nii');
[e3,XYZ53]=spm_read_vols(five3);


% age6
six1 = spm_vol('beta_0016.nii');
[f1,XYZ61]=spm_read_vols(six1);

six2 = spm_vol('beta_0017.nii');
[f2,XYZ62]=spm_read_vols(six2);

six3 = spm_vol('beta_0018.nii');
[f3,XYZ63]=spm_read_vols(six3);


% age7
seven1 = spm_vol('beta_0019.nii');
[g1,XYZ71]=spm_read_vols(seven1);

seven2 = spm_vol('beta_0020.nii');
[g2,XYZ72]=spm_read_vols(seven2);

seven3 = spm_vol('beta_0021.nii');
[g3,XYZ73]=spm_read_vols(seven3);

% load basline info
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/hrf_td_conimages/1_con/baseline';
bone = spm_vol('beta_0001.nii');
[ba,bXYZ1]=spm_read_vols(bone);

btwo = spm_vol('beta_0002.nii');
[bb,bXYZ2]=spm_read_vols(btwo);

bthree = spm_vol('beta_0003.nii');
[bc,bXYZ3]=spm_read_vols(bthree);

bfour = spm_vol('beta_0004.nii');
[bd,bXYZ4]=spm_read_vols(bfour);

bfive = spm_vol('beta_0005.nii');
[be,bXYZ5]=spm_read_vols(bfive);

bsix = spm_vol('beta_0006.nii');
[bf,bXYZ6]=spm_read_vols(bsix);

bseven = spm_vol('beta_0007.nii');
[bg,bXYZ7]=spm_read_vols(bseven);

% Fourier
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/fourier_conimages/1_con';
% age 1
fone1 = spm_vol('beta_0001.nii');
[fa1,fXYZ11]=spm_read_vols(fone1);

fone2 = spm_vol('beta_0002.nii');
[fa2,fXYZ12]=spm_read_vols(fone2);

fone3 = spm_vol('beta_0003.nii');
[fa3,fXYZ13]=spm_read_vols(fone3);

fone4 = spm_vol('beta_0004.nii');
[fa4,fXYZ14]=spm_read_vols(fone4);

fone5 = spm_vol('beta_0005.nii');
[fa5,fXYZ15]=spm_read_vols(fone5);

fone6 = spm_vol('beta_0006.nii');
[fa6,fXYZ16]=spm_read_vols(fone6);

fone7 = spm_vol('beta_0007.nii');
[fa7,fXYZ17]=spm_read_vols(fone7);

% age2
ftwo1 = spm_vol('beta_0008.nii');
[fb1,fXYZ21]=spm_read_vols(ftwo1);

ftwo2 = spm_vol('beta_0009.nii');
[fb2,fXYZ22]=spm_read_vols(ftwo2);

ftwo3 = spm_vol('beta_0010.nii');
[fb3,fXYZ23]=spm_read_vols(ftwo3);

ftwo4 = spm_vol('beta_0011.nii');
[fb4,fXYZ24]=spm_read_vols(ftwo4);

ftwo5 = spm_vol('beta_0012.nii');
[fb5,fXYZ25]=spm_read_vols(ftwo5);

ftwo6 = spm_vol('beta_0013.nii');
[fb6,fXYZ26]=spm_read_vols(ftwo6);

ftwo7 = spm_vol('beta_0014.nii');
[fb7,fXYZ27]=spm_read_vols(ftwo7);

% age3
fthree1 = spm_vol('beta_0015.nii');
[fc1,fXYZ31]=spm_read_vols(fthree1);

fthree2 = spm_vol('beta_0016.nii');
[fc2,fXYZ32]=spm_read_vols(fthree2);

fthree3 = spm_vol('beta_0017.nii');
[fc3,fXYZ33]=spm_read_vols(fthree3);

fthree4 = spm_vol('beta_0018.nii');
[fc4,fXYZ34]=spm_read_vols(fthree4);

fthree5 = spm_vol('beta_0019.nii');
[fc5,fXYZ35]=spm_read_vols(fthree5);

fthree6 = spm_vol('beta_0020.nii');
[fc6,fXYZ36]=spm_read_vols(fthree6);

fthree7 = spm_vol('beta_0021.nii');
[fc7,fXYZ37]=spm_read_vols(fthree7);

% age4
ffour1 = spm_vol('beta_0022.nii');
[fd1,fXYZ41]=spm_read_vols(ffour1);

ffour2 = spm_vol('beta_0023.nii');
[fd2,fXYZ42]=spm_read_vols(ffour2);

ffour3 = spm_vol('beta_0024.nii');
[fd3,fXYZ43]=spm_read_vols(ffour3);

ffour4 = spm_vol('beta_0025.nii');
[fd4,fXYZ44]=spm_read_vols(ffour4);

ffour5 = spm_vol('beta_0026.nii');
[fd5,fXYZ45]=spm_read_vols(ffour5);

ffour6 = spm_vol('beta_0027.nii');
[fd6,fXYZ46]=spm_read_vols(ffour6);

ffour7 = spm_vol('beta_0028.nii');
[fd7,fXYZ47]=spm_read_vols(ffour7);

% age5
ffive1 = spm_vol('beta_0029.nii');
[fe1,fXYZ51]=spm_read_vols(ffive1);

ffive2 = spm_vol('beta_0030.nii');
[fe2,fXYZ52]=spm_read_vols(ffive2);

ffive3 = spm_vol('beta_0031.nii');
[fe3,fXYZ53]=spm_read_vols(ffive3);

ffive4 = spm_vol('beta_0032.nii');
[fe4,fXYZ54]=spm_read_vols(ffive4);

ffive5 = spm_vol('beta_0033.nii');
[fe5,fXYZ55]=spm_read_vols(ffive5);

ffive6 = spm_vol('beta_0034.nii');
[fe6,fXYZ56]=spm_read_vols(ffive6);

ffive7 = spm_vol('beta_0035.nii');
[fe7,fXYZ57]=spm_read_vols(ffive7);

% age6
fsix1 = spm_vol('beta_0036.nii');
[ff1,fXYZ61]=spm_read_vols(fsix1);

fsix2 = spm_vol('beta_0037.nii');
[ff2,fXYZ62]=spm_read_vols(fsix2);

fsix3 = spm_vol('beta_0038.nii');
[ff3,fXYZ63]=spm_read_vols(fsix3);

fsix4 = spm_vol('beta_0039.nii');
[ff4,fXYZ64]=spm_read_vols(fsix4);

fsix5 = spm_vol('beta_0040.nii');
[ff5,fXYZ65]=spm_read_vols(fsix5);

fsix6 = spm_vol('beta_0041.nii');
[ff6,fXYZ66]=spm_read_vols(fsix6);

fsix7 = spm_vol('beta_0042.nii');
[ff7,fXYZ67]=spm_read_vols(fsix7);

% age7
fseven1 = spm_vol('beta_0043.nii');
[fg1,fXYZ71]=spm_read_vols(fseven1);

fseven2 = spm_vol('beta_0044.nii');
[fg2,fXYZ72]=spm_read_vols(fseven2);

fseven3 = spm_vol('beta_0045.nii');
[fg3,fXYZ73]=spm_read_vols(fseven3);

fseven4 = spm_vol('beta_0046.nii');
[fg4,fXYZ74]=spm_read_vols(fseven4);

fseven5 = spm_vol('beta_0047.nii');
[fg5,fXYZ75]=spm_read_vols(fseven5);

fseven6 = spm_vol('beta_0048.nii');
[fg6,fXYZ76]=spm_read_vols(fseven6);

fseven7 = spm_vol('beta_0049.nii');
[fg7,fXYZ77]=spm_read_vols(fseven7);

% load basline info
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/fourier_conimages/1_con/baseline';
fbone = spm_vol('beta_0001.nii');
[fba,fbXYZ1]=spm_read_vols(fbone);

fbtwo = spm_vol('beta_0002.nii');
[fbb,fbXYZ2]=spm_read_vols(fbtwo);

fbthree = spm_vol('beta_0003.nii');
[fbc,fbXYZ3]=spm_read_vols(fbthree);

fbfour = spm_vol('beta_0004.nii');
[fbd,fbXYZ4]=spm_read_vols(fbfour);

fbfive = spm_vol('beta_0005.nii');
[fbe,fbXYZ5]=spm_read_vols(fbfive);

fbsix = spm_vol('beta_0006.nii');
[fbf,fbXYZ6]=spm_read_vols(fbsix);

fbseven = spm_vol('beta_0007.nii');
[fbg,fbXYZ7]=spm_read_vols(fbseven);


% load HRFc for PBR NBR differentiation
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/hrf_conimages/1_con';
one = spm_vol('beta_0001.nii');
[a,XYZ1]=spm_read_vols(one);

two = spm_vol('beta_0002.nii');
[b,XYZ2]=spm_read_vols(two);

three = spm_vol('beta_0003.nii');
[c,XYZ3]=spm_read_vols(three);

four = spm_vol('beta_0004.nii');
[d,XYZ4]=spm_read_vols(four);

five = spm_vol('beta_0005.nii');
[e,XYZ5]=spm_read_vols(five);

six = spm_vol('beta_0006.nii');
[f,XYZ6]=spm_read_vols(six);

seven = spm_vol('beta_0007.nii');
[g,XYZ7]=spm_read_vols(seven);

% create the template into which everything is saved
total_runh1(1,1:274) = 0;
total_runh2(1,1:274) = 0;
total_runh3(1,1:274) = 0;
total_runh4(1,1:274) = 0;
total_runh5(1,1:274) = 0;
total_runh6(1,1:274) = 0;
total_runh7(1,1:274) = 0;

total_runf1(1,1:274) = 0;
total_runf2(1,1:274) = 0;
total_runf3(1,1:274) = 0;
total_runf4(1,1:274) = 0;
total_runf5(1,1:274) = 0;
total_runf6(1,1:274) = 0;
total_runf7(1,1:274) = 0;

% cycle through the beta arrays
for first = 1:length(a1(:,1,1));
    for second = 1:length(a1(1,:,1));
        for third = 1:length(a1(1,1,:));
            % run for age 1, only if all 3 are significant
            if age1(first,second,third) > 0 & age2(first,second,third) > 0 & age3(first,second,third) > 0 & age4(first,second,third) > 0 & age5(first,second,third) > 0 & age6(first,second,third) > 0 & age7(first,second,third) > 0 & cage1(first,second,third) > 0 & cage2(first,second,third) > 0 & cage3(first,second,third) > 0 & cage4(first,second,third) > 0 & cage5(first,second,third) > 0 & cage6(first,second,third) > 0 & cage7(first,second,third) > 0 & fage1(first,second,third) > 0 & fage2(first,second,third) > 0 & fage3(first,second,third) > 0 & fage4(first,second,third) > 0 & fage5(first,second,third) > 0 & fage6(first,second,third) > 0 & fage7(first,second,third) > 0;
                
                % multiply the function by the beta
                clear sum_all
                clear bf1
                clear bf2
                clear bf3
                bf1 = bfsh(:,1) .* a1(first,second,third);
                bf2 = bfsh(:,2) .* a2(first,second,third);
                bf3 = bfsh(:,3) .* a3(first,second,third);
                
                sum_all = ((bf1 + bf2 + bf3) ./ ba(first,second,third)) .* 100;
                
                clear fsum_all
                clear fbf1
                clear fbf2
                clear fbf3
                clear fbf4
                clear fbf5
                clear fbf6
                clear fbf7
                fbf1 = bfsf(:,1) .* fa1(first,second,third);
                fbf2 = bfsf(:,2) .* fa2(first,second,third);
                fbf3 = bfsf(:,3) .* fa3(first,second,third);
                fbf4 = bfsf(:,4) .* fa4(first,second,third);
                fbf5 = bfsf(:,5) .* fa5(first,second,third);
                fbf6 = bfsf(:,6) .* fa6(first,second,third);
                fbf7 = bfsf(:,7) .* fa7(first,second,third);
                
                % sum the functions, divide by the baseline, and multiply
                % by 100 to get % signal change
                fsum_all = ((fbf1 + fbf2 + fbf3 + fbf4 + fbf5 + fbf6 + fbf7) ./ fba(first,second,third)) .* 100;
                
                % set to always be the next row of the array
                clear n
                n = length(total_runh1(:,1)) + 1;
                
                % denote whether the data is in GM
                if gm(first,second,third) > 0.5;
                    total_runh1(n,270) = 1;
                    total_runf1(n,270) = 1;
                else
                    total_runh1(n,270) = 0;
                    total_runf1(n,270) = 0;
                end
                
                % set beta values
                total_runh1(n,271) = a1(first,second,third);
                total_runh1(n,272) = a2(first,second,third);
                total_runh1(n,273) = a3(first,second,third);
                
                total_runf1(n,271) = fa1(first,second,third);
                total_runf1(n,272) = fa2(first,second,third);
                total_runf1(n,273) = fa3(first,second,third);
                total_runf1(n,274) = fa4(first,second,third);
                total_runf1(n,275) = fa5(first,second,third);
                total_runf1(n,276) = fa6(first,second,third);
                total_runf1(n,277) = fa7(first,second,third);
                
                % set coordinates
                total_runh1(n,278) = first;
                total_runh1(n,279) = second;
                total_runh1(n,280) = third;
                
                total_runf1(n,278) = first;
                total_runf1(n,279) = second;
                total_runf1(n,280) = third;
                
                % set the mean baseline for each (we are to find the
                % average accross an ROI, divide the peak amplitude by
                % this, then multiply it by 100).
                total_runh1(n,281) = ba(first,second,third);
                total_runf1(n,281) = fba(first,second,third);
                
                clear t1
                clear ft1
                clear thresh2
                clear thresh1
                clear fthresh2
                clear fthresh1
                % set a threshold for min peak prominence, set out as 25%
                % of the maximum or minimum value, whichever is greater
                t1(1) = max(sum_all);
                t1(2) = max(-sum_all);
                thresh1 = t1(1) .* 0.25;
                thresh2 = t1(2) .* 0.25;
                
                ft1(1) = max(fsum_all);
                ft1(2) = max(-fsum_all);
                fthresh1 = ft1(1) .* 0.25;
                fthresh2 = ft1(2) .* 0.25;

                total_runh1(n,1:260) = sum_all;
                total_runf1(n,1:147) = fsum_all;
                
                clear PKS
                clear LOCS
                clear widths
                
                clear fPKS
                clear fLOCS
                clear fwidths

                % if we are looking at a positive function (max pos > max
                % neg)
                if a(first,second,third) > 0;
                    
                    try
                        % find the peak latency, peak amplitude and fwhm.
                        % Look for the max peak with a prominence eceeding
                        % the threshold. Use this as peak amp
                        [PKS,LOCS,widths] = findpeaks(sum_all,'MinPeakProminence',thresh1,'WidthReference','halfheight');
                        [fPKS,fLOCS,fwidths] = findpeaks(fsum_all,'MinPeakProminence',fthresh1,'WidthReference','halfheight');
                        clear max_peak
                        clear fmax_peak
                        max_peak = max(PKS);
                        fmax_peak = max(fPKS);
                        clear loc_max
                        clear floc_max
                        loc_max = find(PKS == max_peak);
                        floc_max = find(fPKS == fmax_peak);
                        total_runh1(n,261) = LOCS(loc_max)./sec_h;
                        total_runf1(n,261) = fLOCS(floc_max)./sec_f;
                        
                        total_runh1(n,262) = widths(loc_max)./sec_h;
                        total_runf1(n,262) = fwidths(floc_max)./sec_f;
                        
                        total_runh1(n,263) = PKS(loc_max);
                        total_runh1(n,300) = max(sum_all);
                        total_runf1(n,263) = fPKS(floc_max);
                        total_runf1(n,300) = max(fsum_all);
                        
                        total_runh1(n,264) = length(PKS);
                        total_runf1(n,264) = length(fPKS);
                        
                        if length(PKS) == 1;
                            total_runh1(n,265) = 1;
                        else total_runh1(n,265) = 2;
                        end
                        if length(fPKS) == 1;
                            total_runf1(n,265) = 1;
                        else total_runf1(n,265) = 2;
                        end
                        clear min_us
                        clear pos_us
                        clear fmin_us
                        clear fpos_us
                        min_us = min(sum_all(LOCS(loc_max):260));
                        pos_us = find(sum_all(LOCS(loc_max):260) == min_us);
                        if min_us < 0;
                            total_runh1(n,266) = min_us;
                            total_runh1(n,267) = (pos_us + LOCS(loc_max)) ./ sec_h;
                            total_runh1(n,268) = (abs(min_us) ./ max_peak) .* 100;
                        else total_runh1(n,266:268) = 0;
                        end
                        fmin_us = min(fsum_all(fLOCS(floc_max):147));
                        fpos_us = find(fsum_all(fLOCS(floc_max):147) == fmin_us);
                        if fmin_us < 0;
                            total_runf1(n,266) = fmin_us;
                            total_runf1(n,267) = (fpos_us + fLOCS(floc_max)) ./ sec_f;
                            total_runf1(n,268) = (abs(fmin_us) ./ fmax_peak) .* 100;
                        else total_runf1(n,266:268) = 0;
                        end
                    catch

                        total_runh1(n,265) = 0;
                        total_runf1(n,265) = 0;

                    end
%                         alternatively if the negative peak is greater than
%                         the positive, find the max amplitude, then use this
%                         as the peak of interest.
                else if a(first,second,third) < 0;  
                        try
                            [PKS,LOCS,widths] = findpeaks(-sum_all,'MinPeakProminence',thresh2,'WidthReference','halfheight');
                            [fPKS,fLOCS,fwidths] = findpeaks(-fsum_all,'MinPeakProminence',fthresh2,'WidthReference','halfheight');
                            clear max_peak
                            clear fmax_peak
                            max_peak = max(PKS);
                            fmax_peak = max(fPKS);
                            clear loc_max
                            clear floc_max
                            loc_max = find(PKS == max_peak);
                            floc_max = find(fPKS == fmax_peak);
                            total_runh1(n,261) = LOCS(loc_max)./sec_h;
                            total_runf1(n,261) = fLOCS(floc_max)./sec_f;

                            total_runh1(n,262) = widths(loc_max)./sec_h;
                            total_runf1(n,262) = fwidths(floc_max)./sec_f;

                            total_runh1(n,263) = PKS(loc_max);
                            total_runh1(n,300) = max(-sum_all);
                            total_runf1(n,263) = fPKS(floc_max);
                            total_runf1(n,300) = max(-fsum_all);

                            total_runh1(n,264) = length(PKS);
                            total_runf1(n,264) = length(fPKS);

                            if length(PKS) == 1;
                                total_runh1(n,265) = -1;
                            else total_runh1(n,265) = -2;
                            end
                            if length(fPKS) == 1;
                                total_runf1(n,265) = -1;
                            else total_runf1(n,265) = -2;
                            end
                            clear min_us
                            clear pos_us
                            clear fmin_us
                            clear fpos_us
                            min_us = min(-sum_all(LOCS(loc_max):260));
                            pos_us = find(-sum_all(LOCS(loc_max):260) == min_us);
                            if min_us < 0;
                                total_runh1(n,266) = min_us;
                                total_runh1(n,267) = (pos_us + LOCS(loc_max)) ./ sec_h;
                                total_runh1(n,268) = (abs(min_us) ./ max_peak) .* 100;
                            else total_runh1(n,266:268) = 0;
                            end
                            fmin_us = min(-fsum_all(fLOCS(floc_max):147));
                            fpos_us = find(-fsum_all(fLOCS(floc_max):147) == fmin_us);
                            if fmin_us < 0;
                                total_runf1(n,266) = fmin_us;
                                total_runf1(n,267) = (fpos_us + fLOCS(floc_max)) ./ sec_f;
                                total_runf1(n,268) = (abs(fmin_us) ./ fmax_peak) .* 100;
                            else total_runf1(n,266:268) = 0;
                            end
                        catch

                            total_runh1(n,265) = 0;
                            total_runf1(n,265) = 0;
                        end
                    end
                end
            
            % age 2
                
            
                % multiply the function by the beta
                clear sum_all
                clear bf1
                clear bf2
                clear bf3
                bf1 = bfsh(:,1) .* b1(first,second,third);
                bf2 = bfsh(:,2) .* b2(first,second,third);
                bf3 = bfsh(:,3) .* b3(first,second,third);

                sum_all = ((bf1 + bf2 + bf3) ./ ba(first,second,third)) .* 100;

                clear fsum_all
                clear fbf1
                clear fbf2
                clear fbf3
                clear fbf4
                clear fbf5
                clear fbf6
                clear fbf7
                fbf1 = bfsf(:,1) .* fb1(first,second,third);
                fbf2 = bfsf(:,2) .* fb2(first,second,third);
                fbf3 = bfsf(:,3) .* fb3(first,second,third);
                fbf4 = bfsf(:,4) .* fb4(first,second,third);
                fbf5 = bfsf(:,5) .* fb5(first,second,third);
                fbf6 = bfsf(:,6) .* fb6(first,second,third);
                fbf7 = bfsf(:,7) .* fb7(first,second,third);

                % sum the functions, divide by the baseline, and multiply
                % by 100 to get % signal change
                fsum_all = ((fbf1 + fbf2 + fbf3 + fbf4 + fbf5 + fbf6 + fbf7) ./ fba(first,second,third)) .* 100;
                
                % set to always be the next row of the array
                clear n
                n = length(total_runh2(:,1)) + 1;

                % denote whether the data is in GM
                if gm(first,second,third) > 0.5;
                    total_runh2(n,270) = 1;
                    total_runf2(n,270) = 1;
                else
                    total_runh2(n,270) = 0;
                    total_runf2(n,270) = 0;
                end

                % set beta values
                total_runh2(n,271) = b1(first,second,third);
                total_runh2(n,272) = b2(first,second,third);
                total_runh2(n,273) = b3(first,second,third);

                total_runf2(n,271) = fb1(first,second,third);
                total_runf2(n,272) = fb2(first,second,third);
                total_runf2(n,273) = fb3(first,second,third);
                total_runf2(n,274) = fb4(first,second,third);
                total_runf2(n,275) = fb5(first,second,third);
                total_runf2(n,276) = fb6(first,second,third);
                total_runf2(n,277) = fb7(first,second,third);

                % set coordinates
                total_runh2(n,278) = first;
                total_runh2(n,279) = second;
                total_runh2(n,280) = third;

                total_runf2(n,278) = first;
                total_runf2(n,279) = second;
                total_runf2(n,280) = third;

                % set the mean baseline for each (we are to find the
                % average accross an ROI, divide the peak amplitude by
                % this, then multiply it by 100).
                total_runh2(n,281) = bb(first,second,third);
                total_runf2(n,281) = fbb(first,second,third);

                clear t1
                clear ft1
                clear thresh2
                clear thresh1
                clear fthresh2
                clear fthresh1
                % set a threshold for min peak prominence, set out as 50%
                % of the maximum or minimum value, whichever is greater
                t1(1) = max(sum_all);
                t1(2) = max(-sum_all);
                thresh1 = t1(1) .* 0.25;
                thresh2 = t1(2) .* 0.25;

                ft1(1) = max(fsum_all);
                ft1(2) = max(-fsum_all);
                fthresh1 = ft1(1) .* 0.25;
                fthresh2 = ft1(2) .* 0.25;

                total_runh2(n,1:260) = sum_all;
                total_runf2(n,1:147) = fsum_all;

                clear PKS
                clear LOCS
                clear widths

                clear fPKS
                clear fLOCS
                clear fwidths

                % if we are looking at a positive function (max pos > max
                % neg)
                if b(first,second,third) > 0;

                    try
                        % find the peak latency, peak amplitude and fwhm.
                        % Look for the max peak with a prominence eceeding
                        % the threshold. Use this as peak amp
                        [PKS,LOCS,widths] = findpeaks(sum_all,'MinPeakProminence',thresh1,'WidthReference','halfheight');
                        [fPKS,fLOCS,fwidths] = findpeaks(fsum_all,'MinPeakProminence',fthresh1,'WidthReference','halfheight');
                        clear max_peak
                        clear fmax_peak
                        max_peak = max(PKS);
                        fmax_peak = max(fPKS);
                        clear loc_max
                        clear floc_max
                        loc_max = find(PKS == max_peak);
                        floc_max = find(fPKS == fmax_peak);
                        total_runh2(n,261) = LOCS(loc_max)./sec_h;
                        total_runf2(n,261) = fLOCS(floc_max)./sec_f;

                        total_runh2(n,262) = widths(loc_max)./sec_h;
                        total_runf2(n,262) = fwidths(floc_max)./sec_f;

                        total_runh2(n,263) = PKS(loc_max);
                        total_runh2(n,300) = max(sum_all);
                        total_runf2(n,263) = fPKS(floc_max);
                        total_runf2(n,300) = max(fsum_all);

                        total_runh2(n,264) = length(PKS);
                        total_runf2(n,264) = length(fPKS);

                        if length(PKS) == 1;
                            total_runh2(n,265) = 1;
                        else total_runh2(n,265) = 2;
                        end
                        if length(fPKS) == 1;
                            total_runf2(n,265) = 1;
                        else total_runf2(n,265) = 2;
                        end
                        clear min_us
                        clear pos_us
                        clear fmin_us
                        clear fpos_us
                        min_us = min(sum_all(LOCS(loc_max):260));
                        pos_us = find(sum_all(LOCS(loc_max):260) == min_us);
                        if min_us < 0;
                            total_runh2(n,266) = min_us;
                            total_runh2(n,267) = (pos_us + LOCS(loc_max)) ./ sec_h;
                            total_runh2(n,268) = (abs(min_us) ./ max_peak) .* 100;
                        else total_runh2(n,266:268) = 0;
                        end
                        fmin_us = min(fsum_all(fLOCS(floc_max):147));
                        fpos_us = find(fsum_all(fLOCS(floc_max):147) == fmin_us);
                        if fmin_us < 0;
                            total_runf2(n,266) = fmin_us;
                            total_runf2(n,267) = (fpos_us + fLOCS(floc_max)) ./ sec_f;
                            total_runf2(n,268) = (abs(fmin_us) ./ fmax_peak) .* 100;
                        else total_runf2(n,266:268) = 0;
                        end
                    catch

                        total_runh2(n,265) = 0;
                        total_runf2(n,265) = 0;

                    end
%                         alternatively if the negative peak is greater than
%                         the positive, find the max amplitude, then use this
%                         as the peak of interest.
                else if b(first,second,third) < 0;  
                        try
                            [PKS,LOCS,widths] = findpeaks(-sum_all,'MinPeakProminence',thresh2,'WidthReference','halfheight');
                            [fPKS,fLOCS,fwidths] = findpeaks(-fsum_all,'MinPeakProminence',fthresh2,'WidthReference','halfheight');
                            clear max_peak
                            clear fmax_peak
                            max_peak = max(PKS);
                            fmax_peak = max(fPKS);
                            clear loc_max
                            clear floc_max
                            loc_max = find(PKS == max_peak);
                            floc_max = find(fPKS == fmax_peak);
                            total_runh2(n,261) = LOCS(loc_max)./sec_h;
                            total_runf2(n,261) = fLOCS(floc_max)./sec_f;

                            total_runh2(n,262) = widths(loc_max)./sec_h;
                            total_runf2(n,262) = fwidths(floc_max)./sec_f;

                            total_runh2(n,263) = PKS(loc_max);
                            total_runh2(n,300) = max(-sum_all);
                            total_runf2(n,263) = fPKS(floc_max);
                            total_runf2(n,300) = max(-fsum_all);

                            total_runh2(n,264) = length(PKS);
                            total_runf2(n,264) = length(fPKS);

                            if length(PKS) == 1;
                                total_runh2(n,265) = -1;
                            else total_runh2(n,265) = -2;
                            end
                            if length(fPKS) == 1;
                                total_runf2(n,265) = -1;
                            else total_runf2(n,265) = -2;
                            end
                            clear min_us
                            clear pos_us
                            clear fmin_us
                            clear fpos_us
                            min_us = min(-sum_all(LOCS(loc_max):260));
                            pos_us = find(-sum_all(LOCS(loc_max):260) == min_us);
                            if min_us < 0;
                                total_runh2(n,266) = min_us;
                                total_runh2(n,267) = (pos_us + LOCS(loc_max)) ./ sec_h;
                                total_runh2(n,268) = (abs(min_us) ./ max_peak) .* 100;
                            else total_runh2(n,266:268) = 0;
                            end
                            fmin_us = min(-fsum_all(fLOCS(floc_max):147));
                            fpos_us = find(-fsum_all(fLOCS(floc_max):147) == fmin_us);
                            if fmin_us < 0;
                                total_runf2(n,266) = fmin_us;
                                total_runf2(n,267) = (fpos_us + fLOCS(floc_max)) ./ sec_f;
                                total_runf2(n,268) = (abs(fmin_us) ./ fmax_peak) .* 100;
                            else total_runf2(n,266:268) = 0;
                            end
                        catch

                            total_runh2(n,265) = 0;
                            total_runf2(n,265) = 0;
                        end
                    end
                end
            
                      
            % age 3
            
                
                % multiply the function by the beta
                clear sum_all
                clear bf1
                clear bf2
                clear bf3
                bf1 = bfsh(:,1) .* c1(first,second,third);
                bf2 = bfsh(:,2) .* c2(first,second,third);
                bf3 = bfsh(:,3) .* c3(first,second,third);
                
                sum_all = ((bf1 + bf2 + bf3) ./ ba(first,second,third)) .* 100;
                
                clear fsum_all
                clear fbf1
                clear fbf2
                clear fbf3
                clear fbf4
                clear fbf5
                clear fbf6
                clear fbf7
                fbf1 = bfsf(:,1) .* fc1(first,second,third);
                fbf2 = bfsf(:,2) .* fc2(first,second,third);
                fbf3 = bfsf(:,3) .* fc3(first,second,third);
                fbf4 = bfsf(:,4) .* fc4(first,second,third);
                fbf5 = bfsf(:,5) .* fc5(first,second,third);
                fbf6 = bfsf(:,6) .* fc6(first,second,third);
                fbf7 = bfsf(:,7) .* fc7(first,second,third);
                
                % sum the functions, divide by the baseline, and multiply
                % by 100 to get % signal change
                fsum_all = ((fbf1 + fbf2 + fbf3 + fbf4 + fbf5 + fbf6 + fbf7) ./ fba(first,second,third)) .* 100;
                
                % set to always be the next row of the array
                clear n
                n = length(total_runh3(:,1)) + 1;
                
                                
                % denote whether the data is in GM
                if gm(first,second,third) > 0.5;
                    total_runh3(n,270) = 1;
                    total_runf3(n,270) = 1;
                else
                    total_runh3(n,270) = 0;
                    total_runf3(n,270) = 0;
                end
                
                % set beta values
                total_runh3(n,271) = c1(first,second,third);
                total_runh3(n,272) = c2(first,second,third);
                total_runh3(n,273) = c3(first,second,third);
                
                total_runf3(n,271) = fc1(first,second,third);
                total_runf3(n,272) = fc2(first,second,third);
                total_runf3(n,273) = fc3(first,second,third);
                total_runf3(n,274) = fc4(first,second,third);
                total_runf3(n,275) = fc5(first,second,third);
                total_runf3(n,276) = fc6(first,second,third);
                total_runf3(n,277) = fc7(first,second,third);
                
                % set coordinates
                total_runh3(n,278) = first;
                total_runh3(n,279) = second;
                total_runh3(n,280) = third;
                
                total_runf3(n,278) = first;
                total_runf3(n,279) = second;
                total_runf3(n,280) = third;
                
                % set the mean baseline for each (we are to find the
                % average accross an ROI, divide the peak amplitude by
                % this, then multiply it by 100).
                total_runh3(n,281) = bc(first,second,third);
                total_runf3(n,281) = fbc(first,second,third);
                
                clear t1
                clear ft1
                clear thresh2
                clear thresh1
                clear fthresh2
                clear fthresh1
                % set a threshold for min peak prominence, set out as 50%
                % of the maximum or minimum value, whichever is greater
                t1(1) = max(sum_all);
                t1(2) = max(-sum_all);
                thresh1 = t1(1) .* 0.25;
                thresh2 = t1(2) .* 0.25;
                
                ft1(1) = max(fsum_all);
                ft1(2) = max(-fsum_all);
                fthresh1 = ft1(1) .* 0.25;
                fthresh2 = ft1(2) .* 0.25;

                total_runh3(n,1:260) = sum_all;
                total_runf3(n,1:147) = fsum_all;
                
                clear PKS
                clear LOCS
                clear widths
                
                clear fPKS
                clear fLOCS
                clear fwidths

                % if we are looking at a positive function (max pos > max
                % neg)
                if c(first,second,third) > 0;
                    
                    try
                        % find the peak latency, peak amplitude and fwhm.
                        % Look for the max peak with a prominence eceeding
                        % the threshold. Use this as peak amp
                        [PKS,LOCS,widths] = findpeaks(sum_all,'MinPeakProminence',thresh1,'WidthReference','halfheight');
                        [fPKS,fLOCS,fwidths] = findpeaks(fsum_all,'MinPeakProminence',fthresh1,'WidthReference','halfheight');
                        clear max_peak
                        clear fmax_peak
                        max_peak = max(PKS);
                        fmax_peak = max(fPKS);
                        clear loc_max
                        clear floc_max
                        loc_max = find(PKS == max_peak);
                        floc_max = find(fPKS == fmax_peak);
                        total_runh3(n,261) = LOCS(loc_max)./sec_h;
                        total_runf3(n,261) = fLOCS(floc_max)./sec_f;
                        
                        total_runh3(n,262) = widths(loc_max)./sec_h;
                        total_runf3(n,262) = fwidths(floc_max)./sec_f;
                        
                        total_runh3(n,263) = PKS(loc_max);
                        total_runh3(n,300) = max(sum_all);
                        total_runf3(n,263) = fPKS(floc_max);
                        total_runf3(n,300) = max(fsum_all);
                        
                        total_runh3(n,264) = length(PKS);
                        total_runf3(n,264) = length(fPKS);
                        
                        if length(PKS) == 1;
                            total_runh3(n,265) = 1;
                        else total_runh3(n,265) = 2;
                        end
                        if length(fPKS) == 1;
                            total_runf3(n,265) = 1;
                        else total_runf3(n,265) = 2;
                        end
                        clear min_us
                        clear pos_us
                        clear fmin_us
                        clear fpos_us
                        min_us = min(sum_all(LOCS(loc_max):260));
                        pos_us = find(sum_all(LOCS(loc_max):260) == min_us);
                        if min_us < 0;
                            total_runh3(n,266) = min_us;
                            total_runh3(n,267) = (pos_us + LOCS(loc_max)) ./ sec_h;
                            total_runh3(n,268) = (abs(min_us) ./ max_peak) .* 100;
                        else total_runh3(n,266:268) = 0;
                        end
                        fmin_us = min(fsum_all(fLOCS(floc_max):147));
                        fpos_us = find(fsum_all(fLOCS(floc_max):147) == fmin_us);
                        if fmin_us < 0;
                            total_runf3(n,266) = fmin_us;
                            total_runf3(n,267) = (fpos_us + fLOCS(floc_max)) ./ sec_f;
                            total_runf3(n,268) = (abs(fmin_us) ./ fmax_peak) .* 100;
                        else total_runf3(n,266:268) = 0;
                        end
                    catch

                        total_runh3(n,265) = 0;
                        total_runf3(n,265) = 0;

                    end
%                         alternatively if the negative peak is greater than
%                         the positive, find the max amplitude, then use this
%                         as the peak of interest.
                else if c(first,second,third) < 0;  
                        try
                            [PKS,LOCS,widths] = findpeaks(-sum_all,'MinPeakProminence',thresh2,'WidthReference','halfheight');
                            [fPKS,fLOCS,fwidths] = findpeaks(-fsum_all,'MinPeakProminence',fthresh2,'WidthReference','halfheight');
                            clear max_peak
                            clear fmax_peak
                            max_peak = max(PKS);
                            fmax_peak = max(fPKS);
                            clear loc_max
                            clear floc_max
                            loc_max = find(PKS == max_peak);
                            floc_max = find(fPKS == fmax_peak);
                            total_runh3(n,261) = LOCS(loc_max)./sec_h;
                            total_runf3(n,261) = fLOCS(floc_max)./sec_f;

                            total_runh3(n,262) = widths(loc_max)./sec_h;
                            total_runf3(n,262) = fwidths(floc_max)./sec_f;

                            total_runh3(n,263) = PKS(loc_max);
                            total_runh3(n,300) = max(-sum_all);
                            total_runf3(n,263) = fPKS(floc_max);
                            total_runf3(n,300) = max(-fsum_all);

                            total_runh3(n,264) = length(PKS);
                            total_runf3(n,264) = length(fPKS);

                            if length(PKS) == 1;
                                total_runh3(n,265) = -1;
                            else total_runh3(n,265) = -2;
                            end
                            if length(fPKS) == 1;
                                total_runf3(n,265) = -1;
                            else total_runf3(n,265) = -2;
                            end
                            clear min_us
                            clear pos_us
                            clear fmin_us
                            clear fpos_us
                            min_us = min(-sum_all(LOCS(loc_max):260));
                            pos_us = find(-sum_all(LOCS(loc_max):260) == min_us);
                            if min_us < 0;
                                total_runh3(n,266) = min_us;
                                total_runh3(n,267) = (pos_us + LOCS(loc_max)) ./ sec_h;
                                total_runh3(n,268) = (abs(min_us) ./ max_peak) .* 100;
                            else total_runh3(n,266:268) = 0;
                            end
                            fmin_us = min(-fsum_all(fLOCS(floc_max):147));
                            fpos_us = find(-fsum_all(fLOCS(floc_max):147) == fmin_us);
                            if fmin_us < 0;
                                total_runf3(n,266) = fmin_us;
                                total_runf3(n,267) = (fpos_us + fLOCS(floc_max)) ./ sec_f;
                                total_runf3(n,268) = (abs(fmin_us) ./ fmax_peak) .* 100;
                            else total_runf3(n,266:268) = 0;
                            end
                        catch

                            total_runh3(n,265) = 0;
                            total_runf3(n,265) = 0;
                        end
                    end
                end
           
                
            % age 4
            
                
                % multiply the function by the beta
                clear sum_all
                clear bf1
                clear bf2
                clear bf3
                bf1 = bfsh(:,1) .* d1(first,second,third);
                bf2 = bfsh(:,2) .* d2(first,second,third);
                bf3 = bfsh(:,3) .* d3(first,second,third);
                
                sum_all = ((bf1 + bf2 + bf3) ./ ba(first,second,third)) .* 100;
                
                clear fsum_all
                clear fbf1
                clear fbf2
                clear fbf3
                clear fbf4
                clear fbf5
                clear fbf6
                clear fbf7
                fbf1 = bfsf(:,1) .* fd1(first,second,third);
                fbf2 = bfsf(:,2) .* fd2(first,second,third);
                fbf3 = bfsf(:,3) .* fd3(first,second,third);
                fbf4 = bfsf(:,4) .* fd4(first,second,third);
                fbf5 = bfsf(:,5) .* fd5(first,second,third);
                fbf6 = bfsf(:,6) .* fd6(first,second,third);
                fbf7 = bfsf(:,7) .* fd7(first,second,third);
                
                % sum the functions, divide by the baseline, and multiply
                % by 100 to get % signal change
                fsum_all = ((fbf1 + fbf2 + fbf3 + fbf4 + fbf5 + fbf6 + fbf7) ./ fba(first,second,third)) .* 100;
                
                % set to always be the next row of the array
                clear n
                n = length(total_runh4(:,1)) + 1;
                
                
                
                % denote whether the data is in GM
                if gm(first,second,third) > 0.5;
                    total_runh4(n,270) = 1;
                    total_runf4(n,270) = 1;
                else
                    total_runh4(n,270) = 0;
                    total_runf4(n,270) = 0;
                end
                
                % set beta values
                total_runh4(n,271) = d1(first,second,third);
                total_runh4(n,272) = d2(first,second,third);
                total_runh4(n,273) = d3(first,second,third);
                
                total_runf4(n,271) = fd1(first,second,third);
                total_runf4(n,272) = fd2(first,second,third);
                total_runf4(n,273) = fd3(first,second,third);
                total_runf4(n,274) = fd4(first,second,third);
                total_runf4(n,275) = fd5(first,second,third);
                total_runf4(n,276) = fd6(first,second,third);
                total_runf4(n,277) = fd7(first,second,third);
                
                % set coordinates
                total_runh4(n,278) = first;
                total_runh4(n,279) = second;
                total_runh4(n,280) = third;
                
                total_runf4(n,278) = first;
                total_runf4(n,279) = second;
                total_runf4(n,280) = third;
                
                % set the mean baseline for each (we are to find the
                % average accross an ROI, divide the peak amplitude by
                % this, then multiply it by 100).
                total_runh4(n,281) = bd(first,second,third);
                total_runf4(n,281) = fbd(first,second,third);
                
                clear t1
                clear ft1
                clear thresh2
                clear thresh1
                clear fthresh2
                clear fthresh1
                % set a threshold for min peak prominence, set out as 50%
                % of the maximum or minimum value, whichever is greater
                t1(1) = max(sum_all);
                t1(2) = max(-sum_all);
                thresh1 = t1(1) .* 0.25;
                thresh2 = t1(2) .* 0.25;
                
                ft1(1) = max(fsum_all);
                ft1(2) = max(-fsum_all);
                fthresh1 = ft1(1) .* 0.25;
                fthresh2 = ft1(2) .* 0.25;

                total_runh4(n,1:260) = sum_all;
                total_runf4(n,1:147) = fsum_all;
                
                clear PKS
                clear LOCS
                clear widths
                
                clear fPKS
                clear fLOCS
                clear fwidths

                % if we are looking at a positive function (max pos > max
                % neg)
                if d(first,second,third) > 0;
                    
                    try
                        % find the peak latency, peak amplitude and fwhm.
                        % Look for the max peak with a prominence eceeding
                        % the threshold. Use this as peak amp
                        [PKS,LOCS,widths] = findpeaks(sum_all,'MinPeakProminence',thresh1,'WidthReference','halfheight');
                        [fPKS,fLOCS,fwidths] = findpeaks(fsum_all,'MinPeakProminence',fthresh1,'WidthReference','halfheight');
                        clear max_peak
                        clear fmax_peak
                        max_peak = max(PKS);
                        fmax_peak = max(fPKS);
                        clear loc_max
                        clear floc_max
                        loc_max = find(PKS == max_peak);
                        floc_max = find(fPKS == fmax_peak);
                        total_runh4(n,261) = LOCS(loc_max)./sec_h;
                        total_runf4(n,261) = fLOCS(floc_max)./sec_f;
                        
                        total_runh4(n,262) = widths(loc_max)./sec_h;
                        total_runf4(n,262) = fwidths(floc_max)./sec_f;
                        
                        total_runh4(n,263) = PKS(loc_max);
                        total_runh4(n,300) = max(sum_all);
                        total_runf4(n,263) = fPKS(floc_max);
                        total_runf4(n,300) = max(fsum_all);
                        
                        total_runh4(n,264) = length(PKS);
                        total_runf4(n,264) = length(fPKS);
                        
                        if length(PKS) == 1;
                            total_runh4(n,265) = 1;
                        else total_runh4(n,265) = 2;
                        end
                        if length(fPKS) == 1;
                            total_runf4(n,265) = 1;
                        else total_runf4(n,265) = 2;
                        end
                        clear min_us
                        clear pos_us
                        clear fmin_us
                        clear fpos_us
                        min_us = min(sum_all(LOCS(loc_max):260));
                        pos_us = find(sum_all(LOCS(loc_max):260) == min_us);
                        if min_us < 0;
                            total_runh4(n,266) = min_us;
                            total_runh4(n,267) = (pos_us + LOCS(loc_max)) ./ sec_h;
                            total_runh4(n,268) = (abs(min_us) ./ max_peak) .* 100;
                        else total_runh4(n,266:268) = 0;
                        end
                        fmin_us = min(fsum_all(fLOCS(floc_max):147));
                        fpos_us = find(fsum_all(fLOCS(floc_max):147) == fmin_us);
                        if fmin_us < 0;
                            total_runf4(n,266) = fmin_us;
                            total_runf4(n,267) = (fpos_us + fLOCS(floc_max)) ./ sec_f;
                            total_runf4(n,268) = (abs(fmin_us) ./ fmax_peak) .* 100;
                        else total_runf4(n,266:268) = 0;
                        end
                    catch

                        total_runh4(n,265) = 0;
                        total_runf4(n,265) = 0;

                    end
%                         alternatively if the negative peak is greater than
%                         the positive, find the max amplitude, then use this
%                         as the peak of interest.
                else if d(first,second,third) < 0;  
                        try
                            [PKS,LOCS,widths] = findpeaks(-sum_all,'MinPeakProminence',thresh2,'WidthReference','halfheight');
                            [fPKS,fLOCS,fwidths] = findpeaks(-fsum_all,'MinPeakProminence',fthresh2,'WidthReference','halfheight');
                            clear max_peak
                            clear fmax_peak
                            max_peak = max(PKS);
                            fmax_peak = max(fPKS);
                            clear loc_max
                            clear floc_max
                            loc_max = find(PKS == max_peak);
                            floc_max = find(fPKS == fmax_peak);
                            total_runh4(n,261) = LOCS(loc_max)./sec_h;
                            total_runf4(n,261) = fLOCS(floc_max)./sec_f;

                            total_runh4(n,262) = widths(loc_max)./sec_h;
                            total_runf4(n,262) = fwidths(floc_max)./sec_f;

                            total_runh4(n,263) = PKS(loc_max);
                            total_runh4(n,300) = max(-sum_all);
                            total_runf4(n,263) = fPKS(floc_max);
                            total_runf4(n,300) = max(-fsum_all);

                            total_runh4(n,264) = length(PKS);
                            total_runf4(n,264) = length(fPKS);

                            if length(PKS) == 1;
                                total_runh4(n,265) = -1;
                            else total_runh4(n,265) = -2;
                            end
                            if length(fPKS) == 1;
                                total_runf4(n,265) = -1;
                            else total_runf4(n,265) = -2;
                            end
                            clear min_us
                            clear pos_us
                            clear fmin_us
                            clear fpos_us
                            min_us = min(-sum_all(LOCS(loc_max):260));
                            pos_us = find(-sum_all(LOCS(loc_max):260) == min_us);
                            if min_us < 0;
                                total_runh4(n,266) = min_us;
                                total_runh4(n,267) = (pos_us + LOCS(loc_max)) ./ sec_h;
                                total_runh4(n,268) = (abs(min_us) ./ max_peak) .* 100;
                            else total_runh4(n,266:268) = 0;
                            end
                            fmin_us = min(-fsum_all(fLOCS(floc_max):147));
                            fpos_us = find(-fsum_all(fLOCS(floc_max):147) == fmin_us);
                            if fmin_us < 0;
                                total_runf4(n,266) = fmin_us;
                                total_runf4(n,267) = (fpos_us + fLOCS(floc_max)) ./ sec_f;
                                total_runf4(n,268) = (abs(fmin_us) ./ fmax_peak) .* 100;
                            else total_runf4(n,266:268) = 0;
                            end
                        catch

                            total_runh4(n,265) = 0;
                            total_runf4(n,265) = 0;
                        end
                    end
                end
           
            % age 5
            
                % multiply the function by the beta
                clear sum_all
                clear bf1
                clear bf2
                clear bf3
                bf1 = bfsh(:,1) .* e1(first,second,third);
                bf2 = bfsh(:,2) .* e2(first,second,third);
                bf3 = bfsh(:,3) .* e3(first,second,third);
                
                sum_all = ((bf1 + bf2 + bf3) ./ ba(first,second,third)) .* 100;
                
                clear fsum_all
                clear fbf1
                clear fbf2
                clear fbf3
                clear fbf4
                clear fbf5
                clear fbf6
                clear fbf7
                fbf1 = bfsf(:,1) .* fe1(first,second,third);
                fbf2 = bfsf(:,2) .* fe2(first,second,third);
                fbf3 = bfsf(:,3) .* fe3(first,second,third);
                fbf4 = bfsf(:,4) .* fe4(first,second,third);
                fbf5 = bfsf(:,5) .* fe5(first,second,third);
                fbf6 = bfsf(:,6) .* fe6(first,second,third);
                fbf7 = bfsf(:,7) .* fe7(first,second,third);
                
                % sum the functions, divide by the baseline, and multiply
                % by 100 to get % signal change
                fsum_all = ((fbf1 + fbf2 + fbf3 + fbf4 + fbf5 + fbf6 + fbf7) ./ fba(first,second,third)) .* 100;
                
                % set to always be the next row of the array
                clear n
                n = length(total_runh5(:,1)) + 1;
                
                
                
                % denote whether the data is in GM
                if gm(first,second,third) > 0.5;
                    total_runh5(n,270) = 1;
                    total_runf5(n,270) = 1;
                else
                    total_runh5(n,270) = 0;
                    total_runf5(n,270) = 0;
                end
                
                % set beta values
                total_runh5(n,271) = e1(first,second,third);
                total_runh5(n,272) = e2(first,second,third);
                total_runh5(n,273) = e3(first,second,third);
                
                total_runf5(n,271) = fe1(first,second,third);
                total_runf5(n,272) = fe2(first,second,third);
                total_runf5(n,273) = fe3(first,second,third);
                total_runf5(n,274) = fe4(first,second,third);
                total_runf5(n,275) = fe5(first,second,third);
                total_runf5(n,276) = fe6(first,second,third);
                total_runf5(n,277) = fe7(first,second,third);
                
                % set coordinates
                total_runh5(n,278) = first;
                total_runh5(n,279) = second;
                total_runh5(n,280) = third;
                
                total_runf5(n,278) = first;
                total_runf5(n,279) = second;
                total_runf5(n,280) = third;
                
                % set the mean baseline for each (we are to find the
                % average accross an ROI, divide the peak amplitude by
                % this, then multiply it by 100).
                total_runh5(n,281) = be(first,second,third);
                total_runf5(n,281) = fbe(first,second,third);
                
                clear t1
                clear ft1
                clear thresh2
                clear thresh1
                clear fthresh2
                clear fthresh1
                % set a threshold for min peak prominence, set out as 50%
                % of the maximum or minimum value, whichever is greater
                t1(1) = max(sum_all);
                t1(2) = max(-sum_all);
                thresh1 = t1(1) .* 0.25;
                thresh2 = t1(2) .* 0.25;
                
                ft1(1) = max(fsum_all);
                ft1(2) = max(-fsum_all);
                fthresh1 = ft1(1) .* 0.25;
                fthresh2 = ft1(2) .* 0.25;

                total_runh5(n,1:260) = sum_all;
                total_runf5(n,1:147) = fsum_all;
                
                clear PKS
                clear LOCS
                clear widths
                
                clear fPKS
                clear fLOCS
                clear fwidths

                % if we are looking at a positive function (max pos > max
                % neg)
                if e(first,second,third) > 0;
                    
                    try
                        % find the peak latency, peak amplitude and fwhm.
                        % Look for the max peak with a prominence eceeding
                        % the threshold. Use this as peak amp
                        [PKS,LOCS,widths] = findpeaks(sum_all,'MinPeakProminence',thresh1,'WidthReference','halfheight');
                        [fPKS,fLOCS,fwidths] = findpeaks(fsum_all,'MinPeakProminence',fthresh1,'WidthReference','halfheight');
                        clear max_peak
                        clear fmax_peak
                        max_peak = max(PKS);
                        fmax_peak = max(fPKS);
                        clear loc_max
                        clear floc_max
                        loc_max = find(PKS == max_peak);
                        floc_max = find(fPKS == fmax_peak);
                        total_runh5(n,261) = LOCS(loc_max)./sec_h;
                        total_runf5(n,261) = fLOCS(floc_max)./sec_f;
                        
                        total_runh5(n,262) = widths(loc_max)./sec_h;
                        total_runf5(n,262) = fwidths(floc_max)./sec_f;
                        
                        total_runh5(n,263) = PKS(loc_max);
                        total_runh5(n,300) = max(sum_all);
                        total_runf5(n,263) = fPKS(floc_max);
                        total_runf5(n,300) = max(fsum_all);
                        
                        total_runh5(n,264) = length(PKS);
                        total_runf5(n,264) = length(fPKS);
                        
                        if length(PKS) == 1;
                            total_runh5(n,265) = 1;
                        else total_runh5(n,265) = 2;
                        end
                        if length(fPKS) == 1;
                            total_runf5(n,265) = 1;
                        else total_runf5(n,265) = 2;
                        end
                        clear min_us
                        clear pos_us
                        clear fmin_us
                        clear fpos_us
                        min_us = min(sum_all(LOCS(loc_max):260));
                        pos_us = find(sum_all(LOCS(loc_max):260) == min_us);
                        if min_us < 0;
                            total_runh5(n,266) = min_us;
                            total_runh5(n,267) = (pos_us + LOCS(loc_max)) ./ sec_h;
                            total_runh5(n,268) = (abs(min_us) ./ max_peak) .* 100;
                        else total_runh5(n,266:268) = 0;
                        end
                        fmin_us = min(fsum_all(fLOCS(floc_max):147));
                        fpos_us = find(fsum_all(fLOCS(floc_max):147) == fmin_us);
                        if fmin_us < 0;
                            total_runf5(n,266) = fmin_us;
                            total_runf5(n,267) = (fpos_us + fLOCS(floc_max)) ./ sec_f;
                            total_runf5(n,268) = (abs(fmin_us) ./ fmax_peak) .* 100;
                        else total_runf5(n,266:268) = 0;
                        end
                    catch

                        total_runh5(n,265) = 0;
                        total_runf5(n,265) = 0;

                    end
%                         alternatively if the negative peak is greater than
%                         the positive, find the max amplitude, then use this
%                         as the peak of interest.
                else if e(first,second,third) < 0;  
                        try
                            [PKS,LOCS,widths] = findpeaks(-sum_all,'MinPeakProminence',thresh2,'WidthReference','halfheight');
                            [fPKS,fLOCS,fwidths] = findpeaks(-fsum_all,'MinPeakProminence',fthresh2,'WidthReference','halfheight');
                            clear max_peak
                            clear fmax_peak
                            max_peak = max(PKS);
                            fmax_peak = max(fPKS);
                            clear loc_max
                            clear floc_max
                            loc_max = find(PKS == max_peak);
                            floc_max = find(fPKS == fmax_peak);
                            total_runh5(n,261) = LOCS(loc_max)./sec_h;
                            total_runf5(n,261) = fLOCS(floc_max)./sec_f;

                            total_runh5(n,262) = widths(loc_max)./sec_h;
                            total_runf5(n,262) = fwidths(floc_max)./sec_f;

                            total_runh5(n,263) = PKS(loc_max);
                            total_runh5(n,300) = max(-sum_all);
                            total_runf5(n,263) = fPKS(floc_max);
                            total_runf5(n,300) = max(-fsum_all);

                            total_runh5(n,264) = length(PKS);
                            total_runf5(n,264) = length(fPKS);

                            if length(PKS) == 1;
                                total_runh5(n,265) = -1;
                            else total_runh5(n,265) = -2;
                            end
                            if length(fPKS) == 1;
                                total_runf5(n,265) = -1;
                            else total_runf5(n,265) = -2;
                            end
                            clear min_us
                            clear pos_us
                            clear fmin_us
                            clear fpos_us
                            min_us = min(-sum_all(LOCS(loc_max):260));
                            pos_us = find(-sum_all(LOCS(loc_max):260) == min_us);
                            if min_us < 0;
                                total_runh5(n,266) = min_us;
                                total_runh5(n,267) = (pos_us + LOCS(loc_max)) ./ sec_h;
                                total_runh5(n,268) = (abs(min_us) ./ max_peak) .* 100;
                            else total_runh5(n,266:268) = 0;
                            end
                            fmin_us = min(-fsum_all(fLOCS(floc_max):147));
                            fpos_us = find(-fsum_all(fLOCS(floc_max):147) == fmin_us);
                            if fmin_us < 0;
                                total_runf5(n,266) = fmin_us;
                                total_runf5(n,267) = (fpos_us + fLOCS(floc_max)) ./ sec_f;
                                total_runf5(n,268) = (abs(fmin_us) ./ fmax_peak) .* 100;
                            else total_runf5(n,266:268) = 0;
                            end
                        catch

                            total_runh5(n,265) = 0;
                            total_runf5(n,265) = 0;
                        end
                    end
                end
                            
            % age 6
             
                
                % multiply the function by the beta
                clear sum_all
                clear bf1
                clear bf2
                clear bf3
                bf1 = bfsh(:,1) .* f1(first,second,third);
                bf2 = bfsh(:,2) .* f2(first,second,third);
                bf3 = bfsh(:,3) .* f3(first,second,third);
                
                sum_all = ((bf1 + bf2 + bf3) ./ ba(first,second,third)) .* 100;
                
                clear fsum_all
                clear fbf1
                clear fbf2
                clear fbf3
                clear fbf4
                clear fbf5
                clear fbf6
                clear fbf7
                fbf1 = bfsf(:,1) .* ff1(first,second,third);
                fbf2 = bfsf(:,2) .* ff2(first,second,third);
                fbf3 = bfsf(:,3) .* ff3(first,second,third);
                fbf4 = bfsf(:,4) .* ff4(first,second,third);
                fbf5 = bfsf(:,5) .* ff5(first,second,third);
                fbf6 = bfsf(:,6) .* ff6(first,second,third);
                fbf7 = bfsf(:,7) .* ff7(first,second,third);
                
                % sum the functions, divide by the baseline, and multiply
                % by 100 to get % signal change
                fsum_all = ((fbf1 + fbf2 + fbf3 + fbf4 + fbf5 + fbf6 + fbf7) ./ fba(first,second,third)) .* 100;
                
                % set to always be the next row of the array
                clear n
                n = length(total_runh6(:,1)) + 1;
                
                
                
                % denote whether the data is in GM
                if gm(first,second,third) > 0.5;
                    total_runh6(n,270) = 1;
                    total_runf6(n,270) = 1;
                else
                    total_runh6(n,270) = 0;
                    total_runf6(n,270) = 0;
                end
                
                % set beta values
                total_runh6(n,271) = f1(first,second,third);
                total_runh6(n,272) = f2(first,second,third);
                total_runh6(n,273) = f3(first,second,third);
                
                total_runf6(n,271) = ff1(first,second,third);
                total_runf6(n,272) = ff2(first,second,third);
                total_runf6(n,273) = ff3(first,second,third);
                total_runf6(n,274) = ff4(first,second,third);
                total_runf6(n,275) = ff5(first,second,third);
                total_runf6(n,276) = ff6(first,second,third);
                total_runf6(n,277) = ff7(first,second,third);
                
                % set coordinates
                total_runh6(n,278) = first;
                total_runh6(n,279) = second;
                total_runh6(n,280) = third;
                
                total_runf6(n,278) = first;
                total_runf6(n,279) = second;
                total_runf6(n,280) = third;
                
                % set the mean baseline for each (we are to find the
                % average accross an ROI, divide the peak amplitude by
                % this, then multiply it by 100).
                total_runh6(n,281) = bf(first,second,third);
                total_runf6(n,281) = fbf(first,second,third);
                
                clear t1
                clear ft1
                clear thresh2
                clear thresh1
                clear fthresh2
                clear fthresh1
                % set a threshold for min peak prominence, set out as 50%
                % of the maximum or minimum value, whichever is greater
                t1(1) = max(sum_all);
                t1(2) = max(-sum_all);
                thresh1 = t1(1) .* 0.25;
                thresh2 = t1(2) .* 0.25;
                
                ft1(1) = max(fsum_all);
                ft1(2) = max(-fsum_all);
                fthresh1 = ft1(1) .* 0.25;
                fthresh2 = ft1(2) .* 0.25;

                total_runh6(n,1:260) = sum_all;
                total_runf6(n,1:147) = fsum_all;
                
                clear PKS
                clear LOCS
                clear widths
                
                clear fPKS
                clear fLOCS
                clear fwidths

                % if we are looking at a positive function (max pos > max
                % neg)
                if f(first,second,third) > 0;
                    
                    try
                        % find the peak latency, peak amplitude and fwhm.
                        % Look for the max peak with a prominence eceeding
                        % the threshold. Use this as peak amp
                        [PKS,LOCS,widths] = findpeaks(sum_all,'MinPeakProminence',thresh1,'WidthReference','halfheight');
                        [fPKS,fLOCS,fwidths] = findpeaks(fsum_all,'MinPeakProminence',fthresh1,'WidthReference','halfheight');
                        clear max_peak
                        clear fmax_peak
                        max_peak = max(PKS);
                        fmax_peak = max(fPKS);
                        clear loc_max
                        clear floc_max
                        loc_max = find(PKS == max_peak);
                        floc_max = find(fPKS == fmax_peak);
                        total_runh6(n,261) = LOCS(loc_max)./sec_h;
                        total_runf6(n,261) = fLOCS(floc_max)./sec_f;
                        
                        total_runh6(n,262) = widths(loc_max)./sec_h;
                        total_runf6(n,262) = fwidths(floc_max)./sec_f;
                        
                        total_runh6(n,263) = PKS(loc_max);
                        total_runh6(n,300) = max(sum_all);
                        total_runf6(n,263) = fPKS(floc_max);
                        total_runf6(n,300) = max(fsum_all);
                        
                        total_runh6(n,264) = length(PKS);
                        total_runf6(n,264) = length(fPKS);
                        
                        if length(PKS) == 1;
                            total_runh6(n,265) = 1;
                        else total_runh6(n,265) = 2;
                        end
                        if length(fPKS) == 1;
                            total_runf6(n,265) = 1;
                        else total_runf6(n,265) = 2;
                        end
                        clear min_us
                        clear pos_us
                        clear fmin_us
                        clear fpos_us
                        min_us = min(sum_all(LOCS(loc_max):260));
                        pos_us = find(sum_all(LOCS(loc_max):260) == min_us);
                        if min_us < 0;
                            total_runh6(n,266) = min_us;
                            total_runh6(n,267) = (pos_us + LOCS(loc_max)) ./ sec_h;
                            total_runh6(n,268) = (abs(min_us) ./ max_peak) .* 100;
                        else total_runh6(n,266:268) = 0;
                        end
                        fmin_us = min(fsum_all(fLOCS(floc_max):147));
                        fpos_us = find(fsum_all(fLOCS(floc_max):147) == fmin_us);
                        if fmin_us < 0;
                            total_runf6(n,266) = fmin_us;
                            total_runf6(n,267) = (fpos_us + fLOCS(floc_max)) ./ sec_f;
                            total_runf6(n,268) = (abs(fmin_us) ./ fmax_peak) .* 100;
                        else total_runf6(n,266:268) = 0;
                        end
                    catch

                        total_runh6(n,265) = 0;
                        total_runf6(n,265) = 0;

                    end
%                         alternatively if the negative peak is greater than
%                         the positive, find the max amplitude, then use this
%                         as the peak of interest.
                else if f(first,second,third) < 0;  
                        try
                            [PKS,LOCS,widths] = findpeaks(-sum_all,'MinPeakProminence',thresh2,'WidthReference','halfheight');
                            [fPKS,fLOCS,fwidths] = findpeaks(-fsum_all,'MinPeakProminence',fthresh2,'WidthReference','halfheight');
                            clear max_peak
                            clear fmax_peak
                            max_peak = max(PKS);
                            fmax_peak = max(fPKS);
                            clear loc_max
                            clear floc_max
                            loc_max = find(PKS == max_peak);
                            floc_max = find(fPKS == fmax_peak);
                            total_runh6(n,261) = LOCS(loc_max)./sec_h;
                            total_runf6(n,261) = fLOCS(floc_max)./sec_f;

                            total_runh6(n,262) = widths(loc_max)./sec_h;
                            total_runf6(n,262) = fwidths(floc_max)./sec_f;

                            total_runh6(n,263) = PKS(loc_max);
                            total_runh6(n,300) = max(-sum_all);
                            total_runf6(n,263) = fPKS(floc_max);
                            total_runf6(n,300) = max(-fsum_all);

                            total_runh6(n,264) = length(PKS);
                            total_runf6(n,264) = length(fPKS);

                            if length(PKS) == 1;
                                total_runh6(n,265) = -1;
                            else total_runh6(n,265) = -2;
                            end
                            if length(fPKS) == 1;
                                total_runf6(n,265) = -1;
                            else total_runf6(n,265) = -2;
                            end
                            clear min_us
                            clear pos_us
                            clear fmin_us
                            clear fpos_us
                            min_us = min(-sum_all(LOCS(loc_max):260));
                            pos_us = find(-sum_all(LOCS(loc_max):260) == min_us);
                            if min_us < 0;
                                total_runh6(n,266) = min_us;
                                total_runh6(n,267) = (pos_us + LOCS(loc_max)) ./ sec_h;
                                total_runh6(n,268) = (abs(min_us) ./ max_peak) .* 100;
                            else total_runh6(n,266:268) = 0;
                            end
                            fmin_us = min(-fsum_all(fLOCS(floc_max):147));
                            fpos_us = find(-fsum_all(fLOCS(floc_max):147) == fmin_us);
                            if fmin_us < 0;
                                total_runf6(n,266) = fmin_us;
                                total_runf6(n,267) = (fpos_us + fLOCS(floc_max)) ./ sec_f;
                                total_runf6(n,268) = (abs(fmin_us) ./ fmax_peak) .* 100;
                            else total_runf6(n,266:268) = 0;
                            end
                        catch

                            total_runh6(n,265) = 0;
                            total_runf6(n,265) = 0;
                        end
                    end
                end
            
                
            % age 7
            
                
                % multiply the function by the beta
                clear sum_all
                clear bf1
                clear bf2
                clear bf3
                bf1 = bfsh(:,1) .* g1(first,second,third);
                bf2 = bfsh(:,2) .* g2(first,second,third);
                bf3 = bfsh(:,3) .* g3(first,second,third);
                
                sum_all = ((bf1 + bf2 + bf3) ./ ba(first,second,third)) .* 100;
                
                clear fsum_all
                clear fbf1
                clear fbf2
                clear fbf3
                clear fbf4
                clear fbf5
                clear fbf6
                clear fbf7
                fbf1 = bfsf(:,1) .* fg1(first,second,third);
                fbf2 = bfsf(:,2) .* fg2(first,second,third);
                fbf3 = bfsf(:,3) .* fg3(first,second,third);
                fbf4 = bfsf(:,4) .* fg4(first,second,third);
                fbf5 = bfsf(:,5) .* fg5(first,second,third);
                fbf6 = bfsf(:,6) .* fg6(first,second,third);
                fbf7 = bfsf(:,7) .* fg7(first,second,third);
                
                % sum the functions, divide by the baseline, and multiply
                % by 100 to get % signal change
                fsum_all = ((fbf1 + fbf2 + fbf3 + fbf4 + fbf5 + fbf6 + fbf7) ./ fba(first,second,third)) .* 100;
                
                % set to always be the next row of the array
                clear n
                n = length(total_runh7(:,1)) + 1;
                
                
                
                % denote whether the data is in GM
                if gm(first,second,third) > 0.5;
                    total_runh7(n,270) = 1;
                    total_runf7(n,270) = 1;
                else
                    total_runh7(n,270) = 0;
                    total_runf7(n,270) = 0;
                end
                
                % set beta values
                total_runh7(n,271) = g1(first,second,third);
                total_runh7(n,272) = g2(first,second,third);
                total_runh7(n,273) = g3(first,second,third);
                
                total_runf7(n,271) = fg1(first,second,third);
                total_runf7(n,272) = fg2(first,second,third);
                total_runf7(n,273) = fg3(first,second,third);
                total_runf7(n,274) = fg4(first,second,third);
                total_runf7(n,275) = fg5(first,second,third);
                total_runf7(n,276) = fg6(first,second,third);
                total_runf7(n,277) = fg7(first,second,third);
                
                % set coordinates
                total_runh7(n,278) = first;
                total_runh7(n,279) = second;
                total_runh7(n,280) = third;
                
                total_runf7(n,278) = first;
                total_runf7(n,279) = second;
                total_runf7(n,280) = third;
                
                % set the mean baseline for each (we are to find the
                % average accross an ROI, divide the peak amplitude by
                % this, then multiply it by 100).
                total_runh7(n,281) = bg(first,second,third);
                total_runf7(n,281) = fbg(first,second,third);
                
                clear t1
                clear ft1
                clear thresh2
                clear thresh1
                clear fthresh2
                clear fthresh1
                % set a threshold for min peak prominence, set out as 50%
                % of the maximum or minimum value, whichever is greater
                t1(1) = max(sum_all);
                t1(2) = max(-sum_all);
                thresh1 = t1(1) .* 0.25;
                thresh2 = t1(2) .* 0.25;
                
                ft1(1) = max(fsum_all);
                ft1(2) = max(-fsum_all);
                fthresh1 = ft1(1) .* 0.25;
                fthresh2 = ft1(2) .* 0.25;

                total_runh7(n,1:260) = sum_all;
                total_runf7(n,1:147) = fsum_all;
                
                clear PKS
                clear LOCS
                clear widths
                
                clear fPKS
                clear fLOCS
                clear fwidths

                % if we are looking at a positive function (max pos > max
                % neg)
                if g(first,second,third) > 0;
                    
                    try
                        % find the peak latency, peak amplitude and fwhm.
                        % Look for the max peak with a prominence eceeding
                        % the threshold. Use this as peak amp
                        [PKS,LOCS,widths] = findpeaks(sum_all,'MinPeakProminence',thresh1,'WidthReference','halfheight');
                        [fPKS,fLOCS,fwidths] = findpeaks(fsum_all,'MinPeakProminence',fthresh1,'WidthReference','halfheight');
                        clear max_peak
                        clear fmax_peak
                        max_peak = max(PKS);
                        fmax_peak = max(fPKS);
                        clear loc_max
                        clear floc_max
                        loc_max = find(PKS == max_peak);
                        floc_max = find(fPKS == fmax_peak);
                        total_runh7(n,261) = LOCS(loc_max)./sec_h;
                        total_runf7(n,261) = fLOCS(floc_max)./sec_f;
                        
                        total_runh7(n,262) = widths(loc_max)./sec_h;
                        total_runf7(n,262) = fwidths(floc_max)./sec_f;
                        
                        total_runh7(n,263) = PKS(loc_max);
                        total_runh7(n,300) = max(sum_all);
                        total_runf7(n,263) = fPKS(floc_max);
                        total_runf7(n,300) = max(fsum_all);
                        
                        total_runh7(n,264) = length(PKS);
                        total_runf7(n,264) = length(fPKS);
                        
                        if length(PKS) == 1;
                            total_runh7(n,265) = 1;
                        else total_runh7(n,265) = 2;
                        end
                        if length(fPKS) == 1;
                            total_runf7(n,265) = 1;
                        else total_runf7(n,265) = 2;
                        end
                        clear min_us
                        clear pos_us
                        clear fmin_us
                        clear fpos_us
                        min_us = min(sum_all(LOCS(loc_max):260));
                        pos_us = find(sum_all(LOCS(loc_max):260) == min_us);
                        if min_us < 0;
                            total_runh7(n,266) = min_us;
                            total_runh7(n,267) = (pos_us + LOCS(loc_max)) ./ sec_h;
                            total_runh7(n,268) = (abs(min_us) ./ max_peak) .* 100;
                        else total_runh7(n,266:268) = 0;
                        end
                        fmin_us = min(fsum_all(fLOCS(floc_max):147));
                        fpos_us = find(fsum_all(fLOCS(floc_max):147) == fmin_us);
                        if fmin_us < 0;
                            total_runf7(n,266) = fmin_us;
                            total_runf7(n,267) = (fpos_us + fLOCS(floc_max)) ./ sec_f;
                            total_runf7(n,268) = (abs(fmin_us) ./ fmax_peak) .* 100;
                        else total_runf7(n,266:268) = 0;
                        end
                    catch

                        total_runh7(n,265) = 0;
                        total_runf7(n,265) = 0;

                    end
%                         alternatively if the negative peak is greater than
%                         the positive, find the max amplitude, then use this
%                         as the peak of interest.
                else if g(first,second,third) < 0;  
                        try
                            [PKS,LOCS,widths] = findpeaks(-sum_all,'MinPeakProminence',thresh2,'WidthReference','halfheight');
                            [fPKS,fLOCS,fwidths] = findpeaks(-fsum_all,'MinPeakProminence',fthresh2,'WidthReference','halfheight');
                            clear max_peak
                            clear fmax_peak
                            max_peak = max(PKS);
                            fmax_peak = max(fPKS);
                            clear loc_max
                            clear floc_max
                            loc_max = find(PKS == max_peak);
                            floc_max = find(fPKS == fmax_peak);
                            total_runh7(n,261) = LOCS(loc_max)./sec_h;
                            total_runf7(n,261) = fLOCS(floc_max)./sec_f;

                            total_runh7(n,262) = widths(loc_max)./sec_h;
                            total_runf7(n,262) = fwidths(floc_max)./sec_f;

                            total_runh7(n,263) = PKS(loc_max);
                            total_runh7(n,300) = max(-sum_all);
                            total_runf7(n,263) = fPKS(floc_max);
                            total_runf7(n,300) = max(-fsum_all);

                            total_runh7(n,264) = length(PKS);
                            total_runf7(n,264) = length(fPKS);

                            if length(PKS) == 1;
                                total_runh7(n,265) = -1;
                            else total_runh7(n,265) = -2;
                            end
                            if length(fPKS) == 1;
                                total_runf7(n,265) = -1;
                            else total_runf7(n,265) = -2;
                            end
                            clear min_us
                            clear pos_us
                            clear fmin_us
                            clear fpos_us
                            min_us = min(-sum_all(LOCS(loc_max):260));
                            pos_us = find(-sum_all(LOCS(loc_max):260) == min_us);
                            if min_us < 0;
                                total_runh7(n,266) = min_us;
                                total_runh7(n,267) = (pos_us + LOCS(loc_max)) ./ sec_h;
                                total_runh7(n,268) = (abs(min_us) ./ max_peak) .* 100;
                            else total_runh7(n,266:268) = 0;
                            end
                            fmin_us = min(-fsum_all(fLOCS(floc_max):147));
                            fpos_us = find(-fsum_all(fLOCS(floc_max):147) == fmin_us);
                            if fmin_us < 0;
                                total_runf7(n,266) = fmin_us;
                                total_runf7(n,267) = (fpos_us + fLOCS(floc_max)) ./ sec_f;
                                total_runf7(n,268) = (abs(fmin_us) ./ fmax_peak) .* 100;
                            else total_runf7(n,266:268) = 0;
                            end
                        catch

                            total_runh7(n,265) = 0;
                            total_runf7(n,265) = 0;
                        end
                    end
                end
            end
        end
    end
end





% remove the irrelevant first row
total_runh1(1,:) = [];
total_runh2(1,:) = [];
total_runh3(1,:) = [];
total_runh4(1,:) = [];
total_runh5(1,:) = [];
total_runh6(1,:) = [];
total_runh7(1,:) = [];

% remove the irrelevant first row
total_runf1(1,:) = [];
total_runf2(1,:) = [];
total_runf3(1,:) = [];
total_runf4(1,:) = [];
total_runf5(1,:) = [];
total_runf6(1,:) = [];
total_runf7(1,:) = [];

% cd into the relevant directory to save
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/age_effects/parameter_analysis/check';
save hrftd1_accAGE total_runh1
save hrftd2_accAGE total_runh2
save hrftd3_accAGE total_runh3
save hrftd4_accAGE total_runh4
save hrftd5_accAGE total_runh5
save hrftd6_accAGE total_runh6
save hrftd7_accAGE total_runh7

save fourier1_accAGE total_runf1
save fourier2_accAGE total_runf2
save fourier3_accAGE total_runf3
save fourier4_accAGE total_runf4
save fourier5_accAGE total_runf5
save fourier6_accAGE total_runf6
save fourier7_accAGE total_runf7
end