#!/bin/sh

# Script to take list of subject names and performs 
# first level processing on Target Task files


### Select the proper version of matlab

source /usr/local/apps/psycapps/config/matlab_bash

cd /MRIWork/MRIWork06/nr/matthew_danvers/camCAN/full_run/2nd_level/conimages/age_effects/parameter_analysis/GM/1st_level/cluster

# Make sure to change this according to your account and that this folder exists
OUTPUT_LOG_DIR=$(pwd)/log
mkdir -p $OUTPUT_LOG_DIR

script_folder=$(pwd)


qsub    -l h_rss=4G \
        -o ${OUTPUT_LOG_DIR}/matlab.out \
        -e ${OUTPUT_LOG_DIR}/matlab.err \
        -M pgjt006@live.rhul.ac.uk \
        -m ea \
        -q verylongq \
        $script_folder/call.sh;
