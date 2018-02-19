# Description
This course provides a brief introduction to the fundamentals of the R language and focuses on its use for data analysis--including exploratory data analysis, linear and logistic regression, variable selection, model diagnostics, and prediction.

Please follow the [Pre-Workshop Instructions](#Instructions) prior to coming to the workshop.


# Syllabus
* **Fundamentals of R & RStudio**: the basics--including objects, subsetting, indexing, data I/O, and control structures.
* **Exploratory Data Analysis**: all the necessary tools to investigate your data before performing any formal modeling--from summary statistics to visualization including plotting histograms, boxplots, and scatterplots
* **Linear Regression**: everything you need to know to begin fitting linear models--from simple t-tests to estimation of regression coefficients, variable selection, model diagnostics, and prediction
* **Logistic Regression**: the basics of generalized linear models (GLMs) with an emphasis on binary response data--we extend the theory and modeling strategies of linear regression


# <a name="Instructions"></a>Pre-Workshop Instructions
### Step 1: Download and install R
First, visit The R Project for Statistical Computing's website through <https://www.r-project.org/>. Click on "CRAN" under the Download section on the left-hand side of the page. Then, click on any of the nearby websites under the USA section near the bottom of the page. For example, the link from the University of California, Berkley, CA or University of California, Los Angeles, CA are both fine. Download R for your platform (Linux, Mac, or Windows).

### Step 2: Download and install RStudio
RStudio is a set of integrated tools designed to help you be more productive with R; it is known to be more user-friendly. You will be doing essentially all of your programming in RStudio. To download RStudio, go to <https://www.rstudio.com/products/rstudio/download/>. Download the installer for your platform under "Installers for Supported Platforms".

### Step 3: Install R packages
In R, packages are used to share code. A package bundles together code, data, documentation, and tests. As of February 2018, there were over 12,000 packages available on the Comprehensive R Archive Network, or CRAN. This huge variety of packages is one of the reasons that R is so successful: the chances are that someone has already solved a problem that you’re working on, and you can benefit from their work by downloading their package.

In this workshop, we will be using three packages-- `car`, `leaps`, and `here`. If everyone attempts to download them at the same time, the wireless internet will become very upset with us and work slowly. Therefore, I suggest installing them before coming to class. There are a few ways to do this (which we will discuss more during the workshop). For now, please download [install_packages.R](http://ucidatascienceinitiative.github.io/IDA-with-R/install_packages.R)

### Step 4: Join the Slack chatroom
We have a chatroom set up at [ida-with-r.slack.com](https://join.slack.com/t/ida-with-r/shared_invite/enQtMjgwNjE4NDczMzY1LWQ4MGU4Y2UzMzc0NmQxZjIwNzMzYjFkODBmODNlMjFmOTA3YzE1MWIyNTYxMzMzY2Y5YWY2YWQ4NmJhZGVkYmU) for you to have discussions and ask/answer questions that may arise throughout the day.


# Schedule

| 	   Time	    |           				|							|
| ------------- | :-----------------------:	| :-----------------------: |   
| 	8:30-9:00  	| Registration & Breakfast	|							|
| 	9:00-10:15	| [Session 1: Fundamentals of R](http://ucidatascienceinitiative.github.io/IDA-with-R/IDA-with-R_Session_1.html)			| [Shell Code](https://github.com/UCIDataScienceInitiative/IDA-with-R/blob/master/IDA-with-R_Session_1_shell.R), [Complete Code](https://github.com/UCIDataScienceInitiative/IDA-with-R/blob/master/IDA-with-R_Session_1_complete.R) |
| 	10:15-10:45	| [Exercise 1](http://ucidatascienceinitiative.github.io//IDA-with-R/Exercises/IDA-with-R_Exercise_1.html)					| |
| 	10:45-11:00	| Break						| |
| 	11:00-11:15	| [Discuss Exercise 1 Solutions](http://ucidatascienceinitiative.github.io//IDA-with-R/Solutions/IDA-with-R_Exercise_1_Solutions.html) | [Solution Code](https://github.com/UCIDataScienceInitiative/IDA-with-R/blob/master/Solutions/Exercise_1.R)   |
|   11:15-12:15 | [Session 2: Exploratory Data Analysis](http://ucidatascienceinitiative.github.io/IDA-with-R/IDA-with-R_Session_2.html) 	| [Shell Code](https://github.com/UCIDataScienceInitiative/IDA-with-R/blob/master/IDA-with-R_Session_2_shell.R), [Complete Code](https://github.com/UCIDataScienceInitiative/IDA-with-R/blob/master/IDA-with-R_Session_2_complete.R) |
| 	12:15-12:30	| [Exercise 2](http://ucidatascienceinitiative.github.io//IDA-with-R/Exercises/IDA-with-R_Exercise_2.html)					| |
| 	12:30-1:00 	| Lunch						| |
| 	1:00-1:15 	|  [Discuss Exercise 2 Solutions](http://ucidatascienceinitiative.github.io//IDA-with-R/Solutions/IDA-with-R_Exercise_2_Solutions.html) | [Solution Code](https://github.com/UCIDataScienceInitiative/IDA-with-R/blob/master/Solutions/Exercise_2.R)   |
| 	1:15-2:30	| [Session 3: Linear Regression](http://ucidatascienceinitiative.github.io/IDA-with-R/IDA-with-R_Session_3.html)			| [Shell Code](https://github.com/UCIDataScienceInitiative/IDA-with-R/blob/master/IDA-with-R_Session_3_shell.R), [Complete Code](https://github.com/UCIDataScienceInitiative/IDA-with-R/blob/master/IDA-with-R_Session_3_complete.R) |
| 	2:30-3:15	| [Exercise 3](http://ucidatascienceinitiative.github.io//IDA-with-R/Exercises/IDA-with-R_Exercise_3.html)					| |
| 	3:15-3:30	| Break						| |
| 	3:30-4:00	| [Discuss Exercise 3 Solutions](http://ucidatascienceinitiative.github.io//IDA-with-R/Solutions/IDA-with-R_Exercise_3_Solutions.html) | [Solution Code](https://github.com/UCIDataScienceInitiative/IDA-with-R/blob/master/Solutions/Exercise_3.R)	|
| 	4:00-4:50	| [Session 4: Logistic Regression](http://ucidatascienceinitiative.github.io/IDA-with-R/IDA-with-R_Session_4.html)			| [Shell Code](https://github.com/UCIDataScienceInitiative/IDA-with-R/blob/master/IDA-with-R_Session_4_shell.R), [Complete Code](https://github.com/UCIDataScienceInitiative/IDA-with-R/blob/master/IDA-with-R_Session_4_complete.R) |
| 	4:50-5:00	| [Course Evaluation Survey](https://docs.google.com/forms/d/e/1FAIpQLScRCXMWlui6e5XURTVqXsRlIHqMoPygTurX7VFsD8uGqVe-gg/viewform)		| |


# <a name="Instructions"></a>Pre-Workshop Instructions
### Step 1: Download and install R
First, visit The R Project for Statistical Computing's website through <https://www.r-project.org/>. Click on "CRAN" under the Download section on the left-hand side of the page. Then, click on any of the nearby websites under the USA section near the bottom of the page. For example, the link from the University of California, Berkley, CA or University of California, Los Angeles, CA are both fine. Download R for your platform (Linux, Mac, or Windows).

### Step 2: Download and install RStudio
RStudio is a set of integrated tools designed to help you be more productive with R; it is known to be more user-friendly. You will be doing essentially all of your programming in RStudio. To download RStudio, go to <https://www.rstudio.com/products/rstudio/download/>. Download the installer for your platform under "Installers for Supported Platforms".

### Step 3: Install required R packages
In R, packages are used to share code. A package bundles together code, data, documentation, and tests. As of February 2018, there were over 12,000 packages available on the Comprehensive R Archive Network, or CRAN. This huge variety of packages is one of the reasons that R is so successful: the chances are that someone has already solved a problem that you’re working on, and you can benefit from their work by downloading their package.

In this workshop, we will be using three packages-- `car`, `leaps`, and `here`. If everyone attempts to download them at the same time, the wireless internet will become very upset with us and work slowly. Therefore, I suggest installing them before coming to class. There are a few ways to do this (which we will discuss more during the workshop). For now, please download [install_packages.R](http://ucidatascienceinitiative.github.io/IDA-with-R/install_packages.R) and open it in RStudio (`Right click > Open with > RStudio`). Once in RStudio, you should see the following three lines of code:
```r
install.packages("car")
install.packages("leaps")
install.packages("here")
```
Highlight all of this code (using your cursor, `Ctrl + A` on Windows, or `Cmd + A` on Mac) and click the Run icon (or hit `Ctrl + Enter` on Windows or `Cmd + Enter` on Mac).

### Step 4: Join the Slack chatroom
We have a chatroom set up at [ida-with-r.slack.com](https://join.slack.com/t/ida-with-r/shared_invite/enQtMjgwNjE4NDczMzY1LWQ4MGU4Y2UzMzc0NmQxZjIwNzMzYjFkODBmODNlMjFmOTA3YzE1MWIyNTYxMzMzY2Y5YWY2YWQ4NmJhZGVkYmU) for you to have discussions and ask/answer questions that may arise throughout the day.


## Authors
Chris Galbraith (<galbraic@uci.edu>)

Emily Smith (<emilyjs@uci.edu>)
