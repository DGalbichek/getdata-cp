## ReadMe

Run the script from the folder you have your 'UCI HAR Dataset' folder in.
The script uses the dplyr library.

It reads all data files into separate variables then binds them all together
into one big dataset. Then the columns get labelled properly and the dataset
gets narrowed down based on the column names (the ones containing mean() or
std() are the ones we need for the final dataset).

Then the script changes the activities from number values to strings.
    1 WALKING
    2 WALKING_UPSTAIRS
    3 WALKING_DOWNSTAIRS
    4 SITTING
    5 STANDING
    6 LAYING
    
In the last step a new dataset gets the means of the measurements for all
activities and subjects separately. That is data2.