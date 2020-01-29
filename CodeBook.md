This is the code book for the Getting and Cleaning Data Course Project.

Description:
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tacc-XYZ and tgyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tbodyacc-XYZ and tgravityacc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tbodyaccjerk-XYZ and tbodygyrojerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tbodyaccmag, tgravityaccmag, tbodyaccjerkmag, tbodygyromag, tbodygyrojerkmag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fbodyacc-XYZ, fbodyaccjerk-XYZ, fbodygyro-XYZ, fbodyaccjerkmag, fbodygyromag, fbodygyrojerkmag. (Note the 'f' to indicate frequency domain signals). 

Only the average and standard deviation of the measurements were kept on all 3 axes X, Y and Z.

Steps taken to tidy the data:
1- First we created a dataframe from the test database and one for the train database from the X_test.txt and X_train.txt files.
2- For both dataframes, we added the subject and activity variables found in their corresponding subject_test.txt, y_test, subject_train.txt and y_train.txt files.
3- Then, we added the measurements of the test dataframe to the train dataframe
4- A header was then created
5- We found that some variables were duplicate. Since none of those duplicated variables were important for our study, they were removed from the dataframe.
6- We then selected only the variables that were a average and a standard deviation of the measurements.
7- The activities numbers were substituted to their corresponding activity name.
8- Some editing of the variables name took place:
  - Bring all characters to lower case
  - Remove the "()" and the "-"
9- Create a summarized dataset where the measurements on all variables are averaged for each activiy of each subject.

Units: 
Measurements are normalized and bounded within [-1,1].

List of variables:
[1] "subject": ID number of the subject doing the experiment
[2] "activity": Type of activity the subject is performing
[3,4,5] "tbodyacc mean" -XYZ 
[6,7,8] "tbodyacc std" -XYZ       
[9,10,11] "tgravityacc mean" -XYZ    
[12,13,14] "tgravityacc std" -XYZ    
[15,16,17] "tbodyaccjerk mean" -XYZ   
[18,19,20] "tbodyaccjerk std" -XYZ   
[21,22,23] "tbodygyro mean" -XYZ     
[24,25,26] "tbodygyro std" -XYZ      
[27,28,29] "tbodygyrojerk mean" -XYZ
[30,31,32] "tbodygyrojerk std" -XYZ  
[33] "tbodyaccmag mean"
[34] "tbodyaccmag std"      
[35] "tgravityaccmag mean"   
[36] "tgravityaccmag std"
[37] "tbodyaccjerkmag mean"
[38] "tbodyaccjerkmag std"
[39] "tbodygyromag mean"
[40] "tbodygyromag std"
[41] "tbodygyrojerkmag mean"
[42] "tbodygyrojerkmag std"
[43,44,45] "fbodyacc mean" -XYZ
[46,47,48] "fbodyacc std" -XYZ
[49,50,51] "fbodyaccjerk mean" -XYZ  
[52,53,54] fbodyaccjerk std" -XYZ
[55,56,57] "fbodygyro mean" -XYZ
[58,59,60] "fbodygyro std" -XYZ
[61] "fbodyaccmag mean"      
[62] "fbodyaccmag std"      
[63] "fbodyaccjerkmag mean" 
[64] "fbodyaccjerkmag std"  
[65] "fbodygyromag mean"   
[66] "fbodygyromag std"     
[67] "fbodygyrojerkmag mean" 
[68] "fbodygyrojerkmag std" 