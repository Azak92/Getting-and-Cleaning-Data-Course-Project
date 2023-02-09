Steps taken in order to achieve tidyDataSet.txt via run_analysis.R

1. Read all data needed for project - features.txt, activity_labels.txt, subject_test.txt, X_test.txt, y_test.txt, subject_train.txt, X_train.txt, y_train.txt
2. Combine two data sets (train and test) into one data set called **full_data**
3. Extract only information needed (means and st. div of variables) into variable called **full_data_subset**
4. Renaming columns into correct format (descriptive names for valiables and simple and correct names for subject and activity columns)
5. Grouping data we have by activity and subject and getting means of every variable. Storing that result in variable **tidy_data_set**
6. Write data from **tidy_data_set** into file **tidy_data_set.txt**

Variables used in process:

activity_labels = six activity codes and corresponding activity names
features = feature names for X_test, X_train

Subject_test = test set subject number, 1-30
X_test = test set feature measurements
y_test = test set activity, coded 1-6

Subject_train = train set subject number, 1-30
X_train = train set feature measurements
y_train = train set activity, coded 1-6

test = subject_test, y_test, X_test combined, by columns
train = subject_train, y_train, X_train combined, by columns
full_data = test, train, combined by rows

full_data_subset = subset of full data variable, only including columns with means and st. div of variable + activity and subject collumn
names_subset = names of columns of full_data_subset variable

tidy_data_set = data set with average of each variable, by activity, by subject
