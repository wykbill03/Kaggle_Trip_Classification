# Introduction
This is the Kaggle competition: Walmart Trip Type Classification project files. The competition requires attendees to classify Walmart customer trip types using customer purchase records.

# Data processing
Original data contains customer purchase records in rows of each purchased item. Columns include VisitNumber (visit ID),	Weekday,	Upc (item barcode),	ScanCount (number purchased or returned),	DepartmentDescription,	FinelineNumber (detailed dept description) and the response, TripType. Several of the variables are categorical, which requires encoding. And the whole data set need to be aggregated by the visit ID to correctly reflect information of each trip. This process is contained in data_encode_aggreagate.ipynb.

# Feature Engineering
In addition to the original features, new features, e.g. count of depts in each trip, were added to improve model quality. Model codes with new features were labeled with "_newfeature". Interactions between features were also considered. In order to prevent having too many features, departments were first clustered and bucketed based on their correlations. This process is contained in variable_cluster.R. Model codes with new features were labeled with "_bucket_interaction".

# Models and results
Both simple models and sophisticated models were used. Non-tree models include KNN, Naive-Bayes, Linear Discriminant, Quardratic Discriminant and Logistic Regression. Tree models include, Dicision Tree, Random Forest and Gradient Boosting Trees. 

Gradient Boosting Trees with new features generates the best result, with log loss=0.99 and accuracy=0.68. Multi-class logistic regression (one logistic model for each class and normalize the prediction of each class) also provides reasonably well results. Altough less accurate than gradient boosting tree, it ran much faster.
