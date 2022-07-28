#!/bin/sh

subject_number=$1

echo $subject_number

### in this case the script folder is same as pwd but in other occasions change the path to your script directory

script_folder=/MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/age_effects/parameter_analysis/GM/1st_level

cd $script_folder
source /usr/local/apps/psycapps/config/matlab_bash
matlab -nosplash -r "investigate_just_age2;exit;"
