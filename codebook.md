# Codebook for result.txt dataset.

Dataset consists of 180 observations of 79 variables for for subject and activity. All variables are averaged values from source datasets.

## Attributes:
- subject - id of subject - we have 30 subjects
- activity - activity name - there are 6 activities:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING

## Variables:
- timeBodyAccelerometerMeanX
- timeBodyAccelerometerMeanY
- timeBodyAccelerometerMeanZ
- timeBodyAccelerometerStandardDeviationX
- timeBodyAccelerometerStandardDeviationY
- timeBodyAccelerometerStandardDeviationZ
- timeGravityAccelerometerMeanX
- timeGravityAccelerometerMeanY
- timeGravityAccelerometerMeanZ
- timeGravityAccelerometerStandardDeviationX
- timeGravityAccelerometerStandardDeviationY
- timeGravityAccelerometerStandardDeviationZ
- timeBodyAccelerometerJerkMeanX
- timeBodyAccelerometerJerkMeanY
- timeBodyAccelerometerJerkMeanZ
- timeBodyAccelerometerJerkStandardDeviationX
- timeBodyAccelerometerJerkStandardDeviationY
- timeBodyAccelerometerJerkStandardDeviationZ
- timeBodyGyroscopeMeanX
- timeBodyGyroscopeMeanY
- timeBodyGyroscopeMeanZ
- timeBodyGyroscopeStandardDeviationX
- timeBodyGyroscopeStandardDeviationY
- timeBodyGyroscopeStandardDeviationZ
- timeBodyGyroscopeJerkMeanX
- timeBodyGyroscopeJerkMeanY
- timeBodyGyroscopeJerkMeanZ
- timeBodyGyroscopeJerkStandardDeviationX
- timeBodyGyroscopeJerkStandardDeviationY
- timeBodyGyroscopeJerkStandardDeviationZ
- timeBodyAccelerometerMagnitudeMean
- timeBodyAccelerometerMagnitudeStandardDeviation
- timeGravityAccelerometerMagnitudeMean
- timeGravityAccelerometerMagnitudeStandardDeviation
- timeBodyAccelerometerJerkMagnitudeMean
- timeBodyAccelerometerJerkMagnitudeStandardDeviation
- timeBodyGyroscopeMagnitudeMean
- timeBodyGyroscopeMagnitudeStandardDeviation
- timeBodyGyroscopeJerkMagnitudeMean
- timeBodyGyroscopeJerkMagnitudeStandardDeviation
- frequencyBodyAccelerometerMeanX
- frequencyBodyAccelerometerMeanY
- frequencyBodyAccelerometerMeanZ
- frequencyBodyAccelerometerStandardDeviationX
- frequencyBodyAccelerometerStandardDeviationY
- frequencyBodyAccelerometerStandardDeviationZ
- frequencyBodyAccelerometerMeanFreqX
- frequencyBodyAccelerometerMeanFreqY
- frequencyBodyAccelerometerMeanFreqZ
- frequencyBodyAccelerometerJerkMeanX
- frequencyBodyAccelerometerJerkMeanY
- frequencyBodyAccelerometerJerkMeanZ
- frequencyBodyAccelerometerJerkStandardDeviationX
- frequencyBodyAccelerometerJerkStandardDeviationY
- frequencyBodyAccelerometerJerkStandardDeviationZ
- frequencyBodyAccelerometerJerkMeanFreqX
- frequencyBodyAccelerometerJerkMeanFreqY
- frequencyBodyAccelerometerJerkMeanFreqZ
- frequencyBodyGyroscopeMeanX
- frequencyBodyGyroscopeMeanY
- frequencyBodyGyroscopeMeanZ
- frequencyBodyGyroscopeStandardDeviationX
- frequencyBodyGyroscopeStandardDeviationY
- frequencyBodyGyroscopeStandardDeviationZ
- frequencyBodyGyroscopeMeanFreqX
- frequencyBodyGyroscopeMeanFreqY
- frequencyBodyGyroscopeMeanFreqZ
- frequencyBodyAccelerometerMagnitudeMean
- frequencyBodyAccelerometerMagnitudeStandardDeviation
- frequencyBodyAccelerometerMagnitudeMeanFreq
- frequencyBodyBodyAccelerometerJerkMagnitudeMean
- frequencyBodyBodyAccelerometerJerkMagnitudeStandardDeviation
- frequencyBodyBodyAccelerometerJerkMagnitudeMeanFreq
- frequencyBodyBodyGyroscopeMagnitudeMean
- frequencyBodyBodyGyroscopeMagnitudeStandardDeviation
- frequencyBodyBodyGyroscopeMagnitudeMeanFreq
- frequencyBodyBodyGyroscopeJerkMagnitudeMean
- frequencyBodyBodyGyroscopeJerkMagnitudeStandardDeviation
- frequencyBodyBodyGyroscopeJerkMagnitudeMeanFreq

## Processing
We are using data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Used files:
- features.txt - to extract feature names
- activity_labels.txt - to extract activity labels
- train and test dataset - dataset with all measurements

Processing steps:
1. Extract and select desired feature names.
2. Clean up feature names
3. Read activities data set
4. Read and merge X_train and X_test datasets
5. Read and merge Y_train and Y_test datasets
6. Read and merge subject_train and subject_test datasets
7. Merge X, Y, subject datasets
8. Set column names
9. Factorize subject and activity
10. Melt dataset by subject and activity
11. Calculate mean data
12. Write result to result.txt file