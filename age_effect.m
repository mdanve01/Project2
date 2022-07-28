addpath /usr/local/apps/psycapps/spm/spm12-r7487;

cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/pathways';
demo = importdata('demo_finalN.mat');

correct = 0;
missed = 0;

% load the functions
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/simulation';
bfsh = importdata('HRFtd.mat');
bfsf = importdata('Fourier.mat');
% set the window length
window_h = 32;
window_f = 18;
% calculates how many indices equate to 1 second
sec_h = length(bfsh(:,1)) ./ window_h;
sec_f = length(bfsf(:,1)) ./ window_f;

for n = 1:length(demo(:,1));
    try
                
        % find the participant number and then cd to their 1st level HRFc folder
        clear route
        clear name
        name = num2str(demo(n,1));
        route = strcat({'/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/1st_level/hrf/CC'},name,{'_hrf_test'})';
        list_hrfc(n) = route;
        cd(list_hrfc{n});
        % save the beta value in the demo file
        demo(n,6) = spm_summarise('beta_0001.nii',struct('def','sphere', 'spec',1, 'xyz',[-52.5 -21 7.5]'));

        % repeat for HRFtd
        route = strcat({'/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/1st_level/hrf_td/CC'},name,{'_hrf_td_test'})';
        list_hrftd(n) = route;
        cd(list_hrftd{n});
        % save the beta value in the demo file
        demo(n,8) = spm_summarise('beta_0001.nii',struct('def','sphere', 'spec',1, 'xyz',[-52.5 -21 7.5]'));
        demo(n,9) = spm_summarise('beta_0002.nii',struct('def','sphere', 'spec',1, 'xyz',[-52.5 -21 7.5]'));    
        demo(n,10) = spm_summarise('beta_0003.nii',struct('def','sphere', 'spec',1, 'xyz',[-52.5 -21 7.5]'));    

        % repeat for fourier
        route = strcat({'/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/1st_level/fourier/CC'},name,{'_fourier_test'})';
        list_fourier(n) = route;
        cd(list_fourier{n});
        % save the beta value in the demo file
        demo(n,12) = spm_summarise('beta_0001.nii',struct('def','sphere', 'spec',1, 'xyz',[-52.5 -21 7.5]'));
        demo(n,13) = spm_summarise('beta_0002.nii',struct('def','sphere', 'spec',1, 'xyz',[-52.5 -21 7.5]'));    
        demo(n,14) = spm_summarise('beta_0003.nii',struct('def','sphere', 'spec',1, 'xyz',[-52.5 -21 7.5]'));    
        demo(n,15) = spm_summarise('beta_0004.nii',struct('def','sphere', 'spec',1, 'xyz',[-52.5 -21 7.5]'));
        demo(n,16) = spm_summarise('beta_0005.nii',struct('def','sphere', 'spec',1, 'xyz',[-52.5 -21 7.5]'));    
        demo(n,17) = spm_summarise('beta_0006.nii',struct('def','sphere', 'spec',1, 'xyz',[-52.5 -21 7.5]'));    
        demo(n,18) = spm_summarise('beta_0007.nii',struct('def','sphere', 'spec',1, 'xyz',[-52.5 -21 7.5]'));
        
        % create the signals
        hrftd(n,1:260) = (bfsh(:,1) .* demo(n,8)) + (bfsh(:,2) .* demo(n,9)) + (bfsh(:,3) .* demo(n,10));
        fourier(n,1:147) = (bfsf(:,1) .* demo(n,12)) + (bfsf(:,2) .* demo(n,13)) + (bfsf(:,3) .* demo(n,14)) + (bfsf(:,4) .* demo(n,15)) + (bfsf(:,5) .* demo(n,16)) + (bfsf(:,6) .* demo(n,17)) + (bfsf(:,7) .* demo(n,18));
        
        % calculate prominence thresholds
        clear t1
        clear ft1
        clear thresh2
        clear thresh1
        clear fthresh2
        clear fthresh1
        % set a threshold for min peak prominence, set out as 25%
        % of the maximum or minimum value, whichever is greater
        t1(1) = max(hrftd(n,:));
        t1(2) = max(-hrftd(n,:));
        thresh1 = t1(1) .* 0.25;
        thresh2 = t1(2) .* 0.25;

        ft1(1) = max(fourier(n,:));
        ft1(2) = max(-fourier(n,:));
        fthresh1 = ft1(1) .* 0.25;
        fthresh2 = ft1(2) .* 0.25;
        
        % create a set of score for each model with age data
        htd(n,1) = demo(n,2);
        four(n,1) = demo(n,2);
        
        % use the hrfc value to differentiate negative and positive
        if demo(n,6) > 0;
            clear PKS
            clear LOCS
            clear widths
            clear fPKS
            clear fLOCS
            clear fwidths
            
            % find peaks
            [PKS,LOCS,widths] = findpeaks(hrftd(n,:),'MinPeakProminence',thresh1,'WidthReference','halfheight');
            [fPKS,fLOCS,fwidths] = findpeaks(fourier(n,:),'MinPeakProminence',fthresh1,'WidthReference','halfheight');
            clear max_peak
            clear fmax_peak
            max_peak = max(PKS);
            fmax_peak = max(fPKS);
            clear loc_max
            clear floc_max
            loc_max = find(PKS == max_peak);
            floc_max = find(fPKS == fmax_peak);
            
            % peak latency
            htd(n,2) = LOCS(loc_max)./sec_h;
            four(n,2) = fLOCS(floc_max)./sec_f;
            
            % dispersion
            htd(n,3) = widths(loc_max)./sec_h;
            four(n,3) = fwidths(floc_max)./sec_f;
            
            % amplitude
            htd(n,4) = PKS(loc_max);
            four(n,4) = fPKS(floc_max);
            
            % max value
            htd(n,5) = max(hrftd(n,:));
            four(n,5) = max(fourier(n,:));

            % number of peaks
            htd(n,6) = length(PKS);
            four(n,6) = length(fPKS);
            
            % response direction
            htd(n,7) = htd(n,6) .* 1;
            four(n,7) = four(n,6) .* 1;
            
            % undershoot amplitude
            clear min_us
            clear pos_us
            clear fmin_us
            clear fpos_us
            min_us = min(hrftd(n,LOCS(loc_max):260));
            pos_us = find(hrftd(n,LOCS(loc_max):260) == min_us);
            if min_us < 0;
                htd(n,8) = min_us;
                htd(n,9) = (abs(min_us) ./ max_peak) .* 100;
            else htd(n,9) = 0;
            end
            
            clear min_us
            clear pos_us
            clear fmin_us
            clear fpos_us
            min_us = min(fourier(n,LOCS(loc_max):147));
            pos_us = find(fourier(n,LOCS(loc_max):147) == min_us);
            if min_us < 0;
                four(n,8) = min_us;
                four(n,9) = (abs(min_us) ./ max_peak) .* 100;
            else four(n,9) = 0;
            end
            
        elseif demo(n,6) < 0;
            clear PKS
            clear LOCS
            clear widths
            clear fPKS
            clear fLOCS
            clear fwidths
            
            % find peaks
            [PKS,LOCS,widths] = findpeaks(-hrftd(n,:),'MinPeakProminence',thresh1,'WidthReference','halfheight');
            [fPKS,fLOCS,fwidths] = findpeaks(-fourier(n,:),'MinPeakProminence',fthresh1,'WidthReference','halfheight');
            clear max_peak
            clear fmax_peak
            max_peak = max(PKS);
            fmax_peak = max(fPKS);
            clear loc_max
            clear floc_max
            loc_max = find(PKS == max_peak);
            floc_max = find(fPKS == fmax_peak);
            
            % peak latency
            htd(n,2) = LOCS(loc_max)./sec_h;
            four(n,2) = fLOCS(floc_max)./sec_f;
            
            % dispersion
            htd(n,3) = widths(loc_max)./sec_h;
            four(n,3) = fwidths(floc_max)./sec_f;
            
            % amplitude
            htd(n,4) = PKS(loc_max);
            four(n,4) = fPKS(floc_max);
            
            % max value
            htd(n,5) = max(-hrftd(n,:));
            four(n,5) = max(-fourier(n,:));

            % number of peaks
            htd(n,6) = length(PKS);
            four(n,6) = length(fPKS);
            
            % response direction
            htd(n,7) = htd(n,6) .* -1;
            four(n,7) = four(n,6) .* -1;
            
            % undershoot amplitude
            clear min_us
            clear pos_us
            clear fmin_us
            clear fpos_us
            min_us = min(-hrftd(n,LOCS(loc_max):260));
            pos_us = find(-hrftd(n,LOCS(loc_max):260) == min_us);
            if min_us < 0;
                htd(n,8) = min_us;
                htd(n,9) = (abs(min_us) ./ max_peak) .* 100;
            else htd(n,9) = 0;
            end
            
            fmin_us = min(-fourier(n,fLOCS(floc_max):147));
            fpos_us = find(-fourier(n,fLOCS(floc_max):147) == fmin_us);
            if fmin_us < 0;
                four(n,8) = fmin_us;
                four(n,9) = (abs(fmin_us) ./ fmax_peak) .* 100;
            else four(n,9) = 0;
            end
        end
        % count the number I find
        correct = correct + 1;
    catch
        % count the number of fails 
        missed = missed + 1;
    end
end
     
cd '/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/age_effects/single_voxel'
save a1_hrftd hrftd
save a1_fourier fourier
save a1_demo demo        
save a1_hrftd_results htd
save a1_fourier_results four
    
    