## ReadMe

Run the script from the folder you have your 'UCI HAR Dataset' folder in.
The script uses the dplyr library.

It reads all data files into separate variables then binds the test and training sets together, adding label and subject columns (we have two databases at this point).Measures get filtered to eliminate values that are outside the standard deviation. The script then names the columns and merges the data sets with row binding and the result is converted into a data frame tbl.