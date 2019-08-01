# TFEA Histone Analysis from ENCODE

This repo contains code to pull data from ENCODE and prepare it to be run
through TFEA. The process is tedious, since we have to rename each file and 
dynamically create a TFEA command to analyze it, so I chose to automate it by
futzing around with the filenames in bash to automagically generate those
commands.
