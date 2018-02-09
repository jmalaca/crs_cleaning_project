# Getting and Cleaning Data Course Project

R script file (run_analysis.R) is used to make all required processing. It requires installed package reshape2. Tidy data set is stored in result.txt file.

Processing steps:
1. download and extract required dataset if not existing
2. prepare used features names - read dataset, select only desired features, clean up names
3. prepare activity labels
4. read and merge training and test datasets
5. set correct names in merged dataset
6. reshape merged - change activity and subject to factor, melt data using key (activity, subcjet)
7. calculate expected means for each variable per subject/activity
8. write result.txt file