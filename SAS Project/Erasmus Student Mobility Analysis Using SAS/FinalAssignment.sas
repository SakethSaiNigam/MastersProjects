/* Title Sheet Text using the proc odstext sections below */
title1 c=white  bcolor=orange height=24pt "DATA PROGRAMMING WITH SAS FINAL ASSIGNMENT";
title2 " ";
title3 c=stb  bcolor=whitesmoke height=24pt "DATA ANALYSIS I - DATA ANALYSIS II - TASKS DEMONSTRATION";
title4 " ";
title5 c=white bcolor=green height=16pt "KANDURI SAKETH SAI NIGAM";
title6 c=white bcolor=green height=16pt "STUDENT NO. 22201204";
title7 " ";
options nodate;
/* Text */
title8 c=white bcolor=vlipb Height=14pt "DATA ANALYSIS I - 1. IMPORTING HEART-DISEASE DAT AND PRINTING 1ST FIVE ROWS OF DATASET";
/* Step 1: Import the Heart-Disease dataset from CSV file */
PROC import out=s40840.HeartDiseaseDataset 
 	datafile= "/home/u63443094/My Week Folder/Assignments/FinalAss/heart-disease.csv" DBMS=CSV  REPLACE ; 
 	getnames=yes; 
run; 
/* 
   Step 2: Print the first five rows of the dataset 
   (Note: The dataset 's40840.HeartDiseaseDataset' should have been created in the previous step)
*/
PROC print data=s40840.HeartDiseaseDataset(firstobs=1 obs=5);
run;
/* 
   Step 3: Create a text output using ODSTEXT procedure to provide a description of the process 
   (This step is optional and adds a textual description)
*/
proc odstext;
P "The Heart-Disease Dataset is imported and Top 5 rows of the dataset are displayed."
/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};

/* Text */
title1 c=white bcolor=vlipb Height=14pt "DATA ANALYSIS I - 2. CONTENTS OF THE DATASET";
/* Step 1: Use PROC CONTENTS to summarize dataset information */
PROC contents data=s40840.HeartDiseaseDataset VARNUM;
run;

/*
   Step 2: Create a text output using the ODSTEXT procedure to provide a description of the dataset
*/
proc odstext;
P "The HeartDiseaseDataset dataset has 303 observations (rows) and 14 variables (columns). 
The dataset contains 14 variables in the order in which they were produced."
/ Style={font_size=12pt font_face='Helvetica' leftmargin=.75in rightmargin=.25in just=l};


/* Text */
title1 c=white bcolor=vlipb Height=14pt "DATA ANALYSIS I - 3. FREQUENCY TABLE FOR FEW CATEGORICAL VARIABLE";

/* Frequency table for categorical variables */
PROC FREQ DATA=s40840.HeartDiseaseDataset;
    TABLES sex cp target;
RUN;

/*Text */
proc odstext;
P "The output summarizes the distribution of the Sex, Chest Pain, and Target Categorical variables in the dataset, displaying the count and proportion of each category, as well as cumulative counts and proportions up to each category. 
   This information can help you comprehend the data and how different categories are distributed within each variable.
   The variable sex is divided into two groups (0 and 1), with 96 occurrences accounting for 31.68% and 207 occurrences accounting for 68.32% of the total. 
   The cumulative frequency for category 0 is 96 (31.68%), whereas it is 303 (100.00%) for category 1. 
   The variable cp is divided into four groups (0, 1, 2, and 3), with relative frequencies of 143 (47.19%), 50 (16.50%), 87 (28.71%), and 23 (7.59%). 
   For categories 0, 1, 2, and 3, the cumulative frequencies are 143 (47.19%), 193 (63.70%), 280 (92.41%), and 303 (100.00%), respectively. 
   Finally, the variable target is divided into two groups (0 and 1), with frequencies of 138 (45.54%) and 165 (54.46%), respectively. 
   For categories 0 and 1, the total frequencies are 138 (45.54%) and 303 (100.00%), respectively. 
   This frequency analysis provides useful information about the distribution of each variable, including the number and percentage of occurrences for each category, as well as cumulative percentages, which can be useful for understanding the data patterns and characteristics related to heart disease in the dataset.
"/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};

/* Text */
title1 c=white bcolor=vlipb Height=14pt "DATA ANALYSIS I - 4. SUMMARY STATISTICS FOR NUMERICAL VARIABLES(SERUM CHOLESTORAL IN MG/DL)";
/* Summary statistics for numeric variables */
PROC MEANS DATA=s40840.HeartDiseaseDataset;
    VAR chol;
RUN;

/* Text */
proc odstext;
P "There are 303 data points in the chol variable that reflect cholesterol levels. The average cholesterol level is about 246.26, with a standard deviation of 51.83 showing some data variability. The range of cholesterol values is between 126 to 564. This data gives an overview of the distribution of cholesterol levels in the dataset and might help you understand the cholesterol profile of the participants in the research. 
"/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};

/* Text */
title1 c=white bcolor=vlipb Height=14pt "DATA ANALYSIS I - 5. UNIVARIATE ANALYSIS FOR THALACH VARIABLE";
/* Histogram for Age variable */
PROC UNIVARIATE DATA=s40840.HeartDiseaseDataset;
    VAR thalach;
RUN;

/* Text */
proc odstext;
P "The highest heart rate obtained during exercise is represented by the thalach variable. 
There are 303 observations of the variable thalach in the dataset. The mean (average) thalach value is around 149.65, while the standard deviation is at 22.91, indicating a moderate dispersion of data points around the mean. The variance is determined to be 524.65, which further demonstrates the data's variability. The skewness of around -0.54 shows that the distribution has a minor leftward asymmetry, whilst the negative kurtosis of approximately -0.06 suggests that the peak is somewhat flatter than in a normal distribution. The thalach value range is 131, with a minimum of 71 and a high of 202. The median (50th percentile) value is 153, which is close to the mean, indicating a fairly symmetric distribution. 
The spread between the 25th and 75th percentiles is represented by the interquartile range (IQR) of 33. Several location tests, including the Student's t-test, sign test, and signed-rank test, all produce very modest p-values (0.0001), showing strong evidence to reject the null hypothesis that thalach's mean is zero. The quantiles at different levels give information on the distribution of data at various percentiles, with greater quantile values correlating to higher heart rate levels. Overall, this study gives a thorough knowledge of the distribution of maximal heart rate (thalach) reached during exercise in the sample, including its central tendency, variability, and extreme values. 
"/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};

/* Text */
title1 c=white bcolor=lightblue Height=14pt "DATA ANALYSIS I - 6. HISTOGRAM FOR THALACH VARIABLE";
/* Enable ODS Graphics */
ODS GRAPHICS ON;

/* Modify the appearance of the histogram plot and add the density plot */
PROC SGPLOT DATA=s40840.HeartDiseaseDataset;
    HISTOGRAM thalach / FILLATTRS=(COLOR=GREEN) BINWIDTH=10;
    DENSITY thalach / TYPE=KERNEL LINEATTRS=(COLOR=RED);
    YAXIS GRID;
RUN;

/* Disable ODS Graphics (optional) */
ODS GRAPHICS OFF;

/* Text */
proc odstext;
P "The output plot for the variable thalach from the dataset HeartDiseaseDataset is a graph with a histogram and an overlay density plot. 
The larger tail on one side of the figure indicates that the data are skewed. 
Since the longer tail is on the right, the data are positively skewed, and the graphic shows that the distribution is more peaked and has heavier tails.
Between 100-200, the majority of the values of the thalach exists and low between 50-100."
/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l color=red};

/* Text */
title1 c=white bcolor=vlipb Height=14pt "DATA ANALYSIS I - 7. BAR PLOT FOR CHEST PAIN";
/* Bar chart for SmokingStatus */
/* Enable ODS Graphics */
ODS GRAPHICS ON;

/* Modify the appearance of the vertical bar chart */
PROC SGPLOT DATA=s40840.HeartDiseaseDataset;
    VBAR CP / 
        GROUP=CP          /* Use GROUP option to group the data by CP values */
        GROUPDISPLAY=CLUSTER /* Display bars in a cluster to separate different CP values */
        DATALABEL          /* Display data labels on the bars */
        DATALABELATTRS=(COLOR=GREEN SIZE=10) /* Customize data label color and size */
        BARWIDTH=0.4       /* Adjust the width of the bars */
        FILLATTRS=(COLOR=ORANGE); /* Set the fill color of the bars to green */
RUN;

/* Disable ODS Graphics (optional) */
ODS GRAPHICS OFF;


/* Text */
proc odstext;
P "By displaying the frequency of each type of chest pain, the bar chart will let you compare the distribution of the CP variable. As there are four distinct categories, Cluster 0 has the largest number of patients reporting chest discomfort (143), while Cluster 3 has the lowest number (23). 
"/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l color=orange};

/* Text */
title1 c=white bcolor=vlipb Height=14pt "DATA ANALYSIS I - 8. SCATTER PLOT OF SERUM CHOLESTORAL IN MG/DL WITH RESPECT TO AGE";

/* Enable ODS Graphics */
ODS GRAPHICS ON;

/* Modify the appearance of the scatter plot and add the linear regression line */
PROC SGPLOT DATA=s40840.HeartDiseaseDataset;
    SCATTER x=age y=chol / 
        MARKERATTRS=(SIZE=8 SYMBOL=CIRCLEFILLED COLOR=VIOLET) /* Customize marker size, symbol, and color */
        DATALABEL DATALABELPOS=TOP; /* Display data labels on top of the markers */
    REG x=age y=chol / CLM; /* Add linear regression line with confidence limits */
    XAXIS GRID GRIDATTRS=(COLOR=PINK) /* Add gridlines to the x-axis and set grid color to pink */
          LABEL="Age"; /* Customize the x-axis label */
    YAXIS GRID GRIDATTRS=(COLOR=PINK) /* Add gridlines to the y-axis and set grid color to pink */
          LABEL="Cholesterol"; /* Customize the y-axis label */
    
RUN;

/* Disable ODS Graphics (optional) */
ODS GRAPHICS OFF;

/* Text */
proc odstext;
P "The plotted points show a slender linear relationship between age and cholesterol levels.  This implies that age and cholesterol levels are positively correlated. We also notice a few outliers. The scatter plot includes people of all ages, ranging from those who are younger (about 30 years old) to those who are older (up to 77 years old). Individual cholesterol levels range from 130 to 565, depending on the person.
"/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l color=violet};

/* Text */
title1 c=white bcolor=vlipb Height=14pt "DATA ANALYSIS II - 1. Read the dataset erasmus.csv into SAS and call the resulting table erasmus, saving it in the s40840 library. The file contains column names on the first row, with the first observation starting on the second row. You should ensure your code will overwrite any previous object of the same name.
 (a) Print the first 4 rows of the resulting erasmus table.";
/*Loading the dataset*/
PROC import out=s40840.erasmus 
 	datafile= "/home/u63443094/my_shared_file_links/u49048486/Final_Project/erasmus.csv" DBMS=CSV  REPLACE ; 
 	getnames=yes; 
run; 

/*Section of table printed to shown file successfully loaded:*/
PROC print data=s40840.erasmus(firstobs=1 obs=4);
run;

/* Text */
proc odstext;
P "The first four rows of the Erasmus dataset, which I successfully imported, will be displayed in the Output table. 
"
/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};

/* Text */
title1 c=white bcolor=vlipb Height=14pt "DATA ANALYSIS II - 1(b) The duration variable is stored in months. Find the mean duration spent in the programme by students of Irish nationality (‘IE’). How many students of Irish nationality are in the dataset?";

/* Section of table printed to shown file successfully loaded:*/
/* Filter the dataset to include only students of Irish nationality ('IE') */
DATA IrishStudents;
    SET s40840.erasmus;
    WHERE nationality = 'IE';
RUN;

/* Calculate the mean duration spent in the program by Irish students */
PROC MEANS DATA=IrishStudents MEAN;
    VAR duration;
RUN;

/* Count the number of students of Irish nationality in the dataset */
PROC FREQ DATA=s40840.erasmus;
    TABLES nationality / OUT=IrishCount(KEEP=nationality COUNT);
    WHERE nationality = 'IE';
RUN;

/* Output the results */
PROC PRINT DATA=IrishCount;
    TITLE "Number of Students of Irish Nationality";
RUN;
/* Part 1: Text */
proc odstext;
P "In general, the study indicates that there are 2765 students from Ireland ('IE') in the dataset, with an average duration of 1.4148282 months in the program.
"
/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};
/* Text */
title1 c=white bcolor=vlipb Height=14pt "DATA ANALYSIS II - 1(c) One student is older than all other participants. What is the age of this student? In what city did this student study? In what academic year did they start?
";

/*Section of table printed to shown file successfully loaded:*/
/* Find the maximum age in the dataset */
PROC SQL;
    SELECT MAX(Age) AS MaxAge
    INTO :MaxAge
    FROM s40840.erasmus;
QUIT;

/* Filter the dataset to include only the student with the maximum age */
DATA OldestStudent;
    SET s40840.erasmus;
    WHERE Age = &MaxAge;
RUN;

/* Output the age of the oldest student */
PROC PRINT DATA=OldestStudent;
    VAR Age;
    TITLE "Age of the Oldest Student";
RUN;

/* Output the city where the oldest student studied */
PROC PRINT DATA=OldestStudent;
    VAR sending_city;
    TITLE "City where the Oldest Student Studied";
RUN;

/*Output the academic year in which the oldest student started studying*/
PROC PRINT DATA=OldestStudent;
    VAR academic_year;
    TITLE "Academic Year when the Oldest Student Started Studying";
RUN;

/* Text */
proc odstext;

P "As a whole, this study finds the dataset's oldest student, who is 80 years old. They studied at Valencia and began their academic career in 2018-2019."
/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};

/* Text */
title1 c=white bcolor=vlipb Height=14pt "DATA ANALYSIS II - 1(d) Create a table of the nationality variable for students who are not from Ireland (that is, their nationality is not ‘IE’) and whose receiving city is Dublin. The table should be ordered from highest to lowest frequency. What is the most frequent nationality of non-Irish students who studied in Dublin?
";
/*Creating a variable*/
DATA NonIrishDublinStudents;
    SET s40840.erasmus;
    WHERE Nationality NE 'IE' AND receiving_city = 'Dublin';
RUN;

/*Printing above variable*/
PROC PRINT DATA=NonIrishDublinStudents(firstobs=1 obs=5);
RUN;

/* Step 1: Calculate frequencies using PROC FREQ */
PROC FREQ DATA=NonIrishDublinStudents;
   TABLES Nationality / OUT=NationalityFreq noprint;
RUN;

/* Step 2: Sort the dataset in descending order based on frequency */
PROC SORT DATA=NationalityFreq OUT=SortedFreqTable;
   BY descending COUNT;
RUN;

/* Output the table of nationality frequencies */
PROC PRINT DATA=SortedFreqTable;
    TITLE "Table of Nationality Frequencies for Non-Irish Students in Dublin";
RUN;

/* Text */
proc odstext;
P "The 1st table shows the top-5 rows of the table which has data of Dublin and Non - IE.With 37 students, the United Kingdom (UK) is the most common nationality among non-Irish students who studied in Dublin."
/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};

/* Text */
title1 c=white bcolor=vlipb Height=14pt "DATA ANALYSIS II - 1(e) In a single table, print the summary statistics for the age variable, divided into groups by both gender and academic year. Which cohort had the greatest mean age?";

/* Summary statistics for age variable by gender and academic year */
PROC MEANS DATA=s40840.erasmus;
    CLASS Gender academic_year;
    VAR age;
    OUTPUT OUT=AgeSummaryStats 
    	   MEAN=MeanAge
    	   MEDIAN = MedianAge 
    	   MIN = MinAge
    	   MAX = MaxAge
    	   STD = StdDevAge;
RUN;

/* Sort the summary statistics by MeanAge in descending order */
PROC SORT DATA=AgeSummaryStats;
    BY descending MeanAge;
RUN;

/* Output the summary statistics table */
PROC PRINT DATA=AgeSummaryStats(firstobs=1 obs=1);
    VAR Gender academic_year MeanAge;
    TITLE "Summary Statistics for Age Variable by Gender and Academic Year";
RUN;

/* Text */
proc odstext;
P "Female cohort had the greatest mean age in the 2018-2019 academic year, with a mean age of 25.021495275.
"
/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};

/* Text */
title1 c=white bcolor=vlipb Height=14pt "DATA ANALYSIS II - 1(f) Produce a clustered bar chart of the ‘academic year’ variable, clustered by gender. Describe the resulting plot.";

/*Part 1 continued: Section of table printed to shown file successfully loaded:*/
/* Find the maximum age in the dataset */
/* Clustered bar chart of academic year by gender */

PROC SGPLOT DATA=s40840.erasmus;
    VBAR academic_year / GROUP=Gender groupdisplay=cluster;
RUN;

/* Text */
proc odstext;
P "The bar chart clearly shows a considerable increase, more than tripling, in the number of students participating in the Erasmus program between academic years. 2014-2015 and 2015-2016. However, from 2016 through 2020, the total student population remained largely stable, with little growth. Notably, the overall number of female students attending the program outnumbers male students by a little margin.
"
/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};

/* Text */
title1 c=white bcolor=vlipb Height=14pt "DATA ANALYSIS II - 2. For this question, create a subset of the erasmus dataset which contains only those individuals whose receiving country is Ireland (‘IE’). Call this subset erasmus2 and use this subset for all of the follwing parts:
(a) Conduct a univariate analysis of the age variable for those individuals inerasmus2. Write a short description of your findings, including key statistics and discussion of any plots produced.";

/* Create the subset erasmus2 for individuals in Ireland ('IE') */
DATA erasmus2;
    SET s40840.erasmus;
    WHERE receiving_country = 'IE';
RUN;

/*Performing Univariate analysis for AGE Variable*/
proc univariate data=erasmus2;
	var age;
run;

/*Plotting Univariant Histogram for AGE variable*/
ods graphics on;

proc univariate data=ERASMUS2;
	ods select Histogram;
	var age;
	histogram age / kernel;
	inset n mean median std skewness / position=ne;
RUN;

ods graphics off;


/* Text */
proc odstext;
P "The resulting plot is a histogram for the Age variable with a kernel distribution line.The data set's Age variable has a mean value of 24.41 years and a median value of 20 years, showing a right-skewed distribution with several outliers that bring the mean over the median. The standard deviation of 10.23 shows a substantial spread around the mean. The age range runs from 13 years as the lowest value to 69 years as the highest value, illustrating the dataset's variety. Overall, the majority of people are younger, as demonstrated by the median and the leftward tail of the distribution, with a few elderly people contributing to the lengthier right tail."
/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l color=blue};

/* Text */
title1 c=white bcolor=vlipb Height=14pt "DATA ANALYSIS II - 2(b) Create boxplots of the age variable in erasmus2, grouped by gender. Ensure the plot is neat with an appropriate title etc. Comment on the resulting plot.";

/*Printing top 5 rows of age and gender columns*/
PROC PRINT DATA=erasmus2(firstobs=1 obs=5);
	VAR age gender;
RUN;

/* Boxplots of the age variable grouped by gender */
PROC SGPLOT DATA=erasmus2;
    VBOX age / CATEGORY=gender GROUPDISPLAY=CLUSTER CLUSTERWIDTH=0.6 LINEATTRS=(COLOR=darkgreen)FILLATTRS=(COLOR=pink);
    TITLE "Boxplots of Age in Erasmus2 Grouped by Gender";
    YAXIS LABEL="Age";
RUN;

/* Text */
proc odstext;
P "According to the box plot, Irish guys participating in the Erasmus program are 18.5 years old on average.
 The average age of Irish women participating in the Erasmus program is 20. According to the plot, males have bigger unusual ages than women, such as those above 40; and on average, more women than men engage in the Erasmus program.The data's right-skewed distribution for both men and women suggests that a sizable number of persons are older than average.
"
/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l color=pink};

/* Text */
title1 c=white bcolor=vlipb Height=14pt "DATA ANALYSIS II - 2(c) Conduct a hypothesis test to see if there is a statictially significant difference between the mean ages of female and male students, using as your sample data those students in erasmus2. State your hypotheses carefully, check all assump- tions necessary, run your chosen test, comment on the resulting plots and state your conclusion clearly. Use a significance level of α = 0.01.";

/* Create a subset containing only 'Female' and 'Male' groups */
DATA erasmus_subset;
    SET erasmus2;
    WHERE Gender IN ('Female', 'Male');
RUN;

/*Performing TTest*/
ODS GRAPHICS ON;

PROC ttest data=erasmus_subset plots=all;
	var age;
	class gender;
run;

ODS GRAPHICS OFF;

/* Text */
proc odstext;

P "A hypothesis test is run on the Erasmus2 dataset to see whether there is a statistically significant difference in the mean ages of male and female students. The level of significance (alpha) is set at 0.01. The plots illustrate that both the male and female distributions are right-skewed, but their maxima are different. The null hypothesis (H0) asserts that the average age of male and female students in Ireland's program is the same. The alternative hypothesis (H1) is expressed as (female = male), indicating that the average age of male and female students in Ireland's program differs.
Because there might be unequal variances, a two-sample t-test was used, and degrees of freedom (DF) were calculated using two different approaches. The P-Value for both processes is close to 0.0002, and the t-test values for the pooled approach are about 3.73 and 3.76 for the Satterthwaite method. We reject the null hypothesis (H0) since the p-values for both techniques are less than the significance threshold (= 0.01). The findings show that the mean ages of male and female Erasmus2 students differed statistically considerably. According to the Q- Q plot, the distribution of male and female data is not completely normally distributed and contains some outliers or extremes.
On the mean difference plot, the estimated mean difference between the two groups will be displayed as a point.The confidence interval of the mean difference plot excludes 0, showing that the difference in means is statistically significant at the 95% level of assurance. In this case, there is evidence to suggest that the means of the two groups are distinct. The average age of students is believed to be roughly 25.09 years for females and 23.63 years for males, based on the boxplot result shown above. As a result, according to the Erasmus dataset, the t-test results show that female students are older than male students among those studying in Ireland. 
The hypothesis test and summary data show a statistically significant age difference between male and female students.
"
/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};

/* Text */
title1 c=white bcolor=vlipb Height=14pt "TASKS DEMONSTRATION";

/*Printing top 5 rows of Heart Disease Dataset to apply below tasks*/
PROC print data=s40840.HeartDiseaseDataset(firstobs=1 obs=5);
run;

/* Text */
proc odstext;
options nodate nonumber; 
ods escapechar='^';
p "PURPOSE OF MULTIVARIATE ANALYSIS:" /
style=[font_size= 10pt fontweight=bold just= c];
p '^{newline 2}';
P "Using the Multivariate Analysis task, you may analyze and examine multivariate data using a wide range of tools and methods. 
In a multivariate analysis, many variables are analyzed concurrently to uncover links, patterns, and variances in the data. 
When working with datasets including several dependent and independent variables, it is very helpful. 
Principal Component Analysis, Factor Analysis, Canonical Correlation Analysis, Discriminant Analysis, Multidimensional Scaling (MDS), 
and others are a few of the task's primary functions.
"/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};

p '^{newline 2}';
p "DEMONSTRATION OF MULTIVARIATE ANALYSIS:" /
style=[font_size= 10pt fontweight=bold just= c];
P "1. LOAD THE DATASET"/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};
p '^{newline 1}';
P "2. PERFORM MULTIVARIATE ANALYSIS"/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};
p '^{newline 1}';
P "2.1 FACTOR ANALYSIS"/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};
p '^{newline 1}';
P "2.2 CANONICAL CORRELARION ANALYSIS"/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};
p '^{newline 1}';
P "Now we are going to perform MULTIVARIATE ANALYSIS by applying few functionalities to the above printed HEARTDISEASEDATASET "/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};

/*Doing Factor Analysis*/
ods noproctitle;
ods graphics / imagemap=on;

proc factor data=S40840.HEARTDISEASEDATASET method=principal nfactors=3 
		plots=(scree);
	var age cp chol;
run;

proc odstext;
options nodate nonumber; 
ods escapechar='^';
p "PURPOSE OF FACTOR ANALYSIS:" /
style=[font_size= 10pt fontweight=bold just= c color=red];
p '^{newline 2}';
P "In order to identify the common factors that contribute to the variability of the variables age, cp (type of chest pain), and chol (serum cholesterol), factor analysis is a statistical technique used to 
investigate the underlying structure or latent variables that explain the correlations among observed variables of the HEARTDISEASEDATASET dataset. 
We specify that we wish to extract three components by using nfactors=3.
"/ Style={font_size= 12pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};

p '^{newline 2}';
p "1. Initial Factor Method:(Principal Components):" / style=[font_size= 10pt fontweight=bold just= c color=red];
p '^{newline 2}';
P "The selected technique (Principal Components) and the previous communality estimates (ONE) are likely included in this table, which also provides information on the initial setup of the factor analysis.
"/ Style={font_size= 10pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};
p '^{newline 2}';
p "2. Eigenvalues of the Correlation Matrix:" / style=[font_size= 10pt fontweight=bold just= c color=red];
p '^{newline 2}';
P "The correlation matrix's eigenvalues are displayed in this table. Each eigenvalues magnitude, the difference between subsequent eigenvalues, the percentage of variance explained by each eigenvalue, and the total percentage of variance explained are all given.
"/ Style={font_size= 10pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};
p '^{newline 2}';
p "3. Scree and Variance Plots:" / style=[font_size= 10pt fontweight=bold just= c color=red];
p '^{newline 2}';
P "To identify the amount of components to maintain, this part could contain visual representations like a scree plot and variance plots.
"/ Style={font_size= 10pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};
p '^{newline 2}';
p "4. Factor Pattern:" / style=[font_size= 10pt fontweight=bold just= c color=red];
p '^{newline 2}';
P "The factor loadings, which represent the strength of each observed variable's relationship to each factor, are shown in this table as the factor pattern. For the variables age, cp, and chol, it displays the factor loadings for three factors (Factor1, Factor2, and Factor3) in this instance."
/ Style={font_size= 10pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};
p '^{newline 2}';
p "5. Variance Explained by Each Factor:" / style=[font_size= 10pt fontweight=bold just= c color=red];
p '^{newline 2}';
P "The variation that each component (component 1, Factor 2, and Factor 3) explains is shown in this table. It is equivalent to the eigenvalues from the table of the correlation matrix's eigenvalues."
/ Style={font_size= 10pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};
p '^{newline 2}';
p "6. Final Communality Estimates:" / style=[font_size= 10pt fontweight=bold just= c color=red];
p '^{newline 2}';
P "The final communality estimates for each observed variable (age, cp, and chol) are shown in this table following factor analysis. Communality is the percentage of each variable's variation that can be explained by the components that were kept."
/ Style={font_size= 10pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};


/*Performing Canonical Correlation*/
ods noproctitle;
ods graphics / imagemap=on;

proc cancorr data=S40840.HEARTDISEASEDATASET;
	/*** The VAR statement defines Variable set 1 ***/
	var age sex cp chol thalach;

	/*** The WITH statement defines Variable set 2 ***/
	with trestbps restecg exang thal target;
run;

proc odstext;
options nodate nonumber; 
ods escapechar='^';
p "PURPOSE OF CANONICAL CORRELATION ANALYSIS:" /
style=[font_size= 10pt fontweight=bold just= c color=red];
p '^{newline 2}';
P "The Canonical Correlation Analysis (CCA) tasks goal is to use Canonical Correlation Analysis to examine the connections between two sets of variables in a dataset. Users can do multivariate analysis using the CCA task in SAS Studio to see whether there are any significant correlations between the two sets of variables and to select linear combinations (canonical variables) that maximize the correlation between them.
"/ Style={font_size= 10pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just=l};

p '^{newline 2}';
p "1. Canonical Correlation:" / style=[font_size= 10pt fontweight=bold just= c color=red];
p '^{newline 2}';
P "The canonical correlations discovered during the study are displayed in this table. Canonical correlation coefficients, adjusted canonical correlation coefficients, approximative standard errors, squared canonical correlations, and eigenvalues of the product of the inverse of the error covariance matrix (E) and the correlation matrix between the canonical variables (H) are all included in this table. It also has a H0 test in it: The current row and all those that follow have zero canonical correlations."
/ Style={font_size= 10pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};
p '^{newline 2}';
p "2. Eigenvalues of Inv(E)*H:" / style=[font_size= 10pt fontweight=bold just= c color=red];
p '^{newline 2}';
P "For each canonical correlation, this table displays the eigenvalues, differences between subsequent eigenvalues, proportions, and cumulative proportions of variance explained."/ Style={font_size= 10pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};
p '^{newline 2}';
p "3. Multivariate Statistics and F Approximations:" / style=[font_size= 10pt fontweight=bold just= c color=red];
p '^{newline 2}';
P "The multivariate statistics and F-approximations in this table are used to evaluate the significance of the canonical correlations."/ Style={font_size= 10pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};
p '^{newline 2}';
p "4. Raw Canonical Coefficients for the VAR Variables:" / style=[font_size= 10pt fontweight=bold just= c color=red];
p '^{newline 2}';
P "The variables in the VAR set's raw canonical coefficients are provided in this table. The linear combinations (canonical variables) obtained from the VAR set that maximize the canonical correlation with the WITH set are shown by these coefficients.
"
/ Style={font_size= 10pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};
p '^{newline 2}';
p "5. Raw Canonical Coefficients for the WITH Variables:" / style=[font_size= 10pt fontweight=bold just= c color=red];
p '^{newline 2}';
P "This table offers the raw canonical coefficients for the variables in the WITH set, much as Table 4."
/ Style={font_size= 10pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};
p '^{newline 2}';
p "6. Standardized Canonical Coefficients for the VAR Variables:" / style=[font_size= 10pt fontweight=bold just= c color=red];
p '^{newline 2}';
P "The variables in the VAR set's standardized canonical coefficients are shown in this table. The relative weights of the individual variables in the canonical variables may be more easily compared thanks to standardized coefficients.
"
/ Style={font_size= 10pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};

p '^{newline 2}';
p "7. Standardized Canonical Coefficients for the WITH Variables:" / style=[font_size= 10pt fontweight=bold just= c color=red];
p '^{newline 2}';
P "This table displays the standardized canonical coefficients for the variables in the WITH set, similar to Table 6."
/ Style={font_size= 10pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};

p '^{newline 2}';
p "8. Canonical Structure:" / style=[font_size= 10pt fontweight=bold just= c color=red];
p '^{newline 2}';
P "The correlations between the original variables and their equivalent canonical variables are displayed in this table. It sheds light on the connections between the original variables and the standard variables."
/ Style={font_size= 10pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};

p '^{newline 2}';
p "9. Correlations Between the VAR Variables and the Canonical Variables of the WITH Variables:" 
/ style=[font_size= 10pt fontweight=bold just= c color=red];
p '^{newline 2}';
P "The correlations between the canonical variables obtained from the WITH set and the original variables in the VAR set are shown in this table. The correlations between the original variables in the WITH set and the canonical variables deduced from the VAR set are also shown in this table.
"
/ Style={font_size= 10pt font_face='Helvetica' leftmargin =.75in rightmargin =.25in just= l};
