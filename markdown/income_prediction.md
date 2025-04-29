Income Prediction
================
Trevor Okinda
2024

- [Student Details](#student-details)
- [Setup Chunk](#setup-chunk)
  - [Source:](#source)
  - [Reference:](#reference)
- [Understanding the Dataset (Exploratory Data Analysis
  (EDA))](#understanding-the-dataset-exploratory-data-analysis-eda)
  - [Loading the Dataset](#loading-the-dataset)

# Student Details

|                       |                   |
|-----------------------|-------------------|
| **Student ID Number** | 134780            |
| **Student Name**      | Trevor Okinda     |
| **BBIT 4.2 Group**    | C                 |
| **Project Name**      | Income Prediction |

# Setup Chunk

**Note:** the following KnitR options have been set as the global
defaults: <BR>
`knitr::opts_chunk$set(echo = TRUE, warning = FALSE, eval = TRUE, collapse = FALSE, tidy = TRUE)`.

More KnitR options are documented here
<https://bookdown.org/yihui/rmarkdown-cookbook/chunk-options.html> and
here <https://yihui.org/knitr/options/>.

### Source:

The dataset that was used can be downloaded here: *\<<a
href="https://www.kaggle.com/datasets/aldol07/socioeconomic-factors-and-income-dataset/data\"
class="uri">https://www.kaggle.com/datasets/aldol07/socioeconomic-factors-and-income-dataset/data\</a>\>*

### Reference:

*\<aldol07. (n.d.). Socioeconomic Factors and Income Dataset \[Data
set\]. Kaggle. <a
href="https://www.kaggle.com/datasets/aldol07/socioeconomic-factors-and-income-dataset\"
class="uri">https://www.kaggle.com/datasets/aldol07/socioeconomic-factors-and-income-dataset\</a>\>  
Refer to the APA 7th edition manual for rules on how to cite datasets:
<https://apastyle.apa.org/style-grammar-guidelines/references/examples/data-set-references>*

# Understanding the Dataset (Exploratory Data Analysis (EDA))

## Loading the Dataset

``` r
# Load customer data with specified column classes
CustomerData <- read.csv("sgdata.csv", colClasses = c(
  Sex = "factor",                  # 0 or 1, treat as categorical
  Marital_status = "factor",      # single or non-single
  Age = "numeric",
  Education = "factor",           # high school or university
  Income = "numeric",
  Occupation = "factor",          # skilled employee or unemployed
  Settlement_size = "factor"      # 0, 1, 2 - treat as categorical size class
))

# View the structure of the dataset
str(CustomerData)
```

    ## 'data.frame':    2000 obs. of  7 variables:
    ##  $ Sex            : Factor w/ 2 levels "0","1": 1 2 1 1 1 1 1 1 1 1 ...
    ##  $ Marital_status : Factor w/ 2 levels "non-single ",..: 2 1 2 2 2 2 2 2 1 1 ...
    ##  $ Age            : num  67 22 49 45 53 35 53 35 61 28 ...
    ##  $ Education      : Factor w/ 4 levels "graduate school",..: 4 2 2 2 2 2 2 2 4 2 ...
    ##  $ Income         : num  124670 150773 89210 171565 149031 ...
    ##  $ Occupation     : Factor w/ 3 levels "management ",..: 2 2 3 2 2 3 2 1 3 1 ...
    ##  $ Settlement_size: Factor w/ 3 levels "0","1","2": 3 3 1 2 2 1 2 2 1 1 ...

``` r
# Preview the data
head(CustomerData)
```

    ##   Sex Marital_status Age   Education Income        Occupation Settlement_size
    ## 1   0         single  67  university 124670 skilled employee                2
    ## 2   1    non-single   22 high school 150773 skilled employee                2
    ## 3   0         single  49 high school  89210       unemployed                0
    ## 4   0         single  45 high school 171565 skilled employee                1
    ## 5   0         single  53 high school 149031 skilled employee                1
    ## 6   0         single  35 high school 144848       unemployed                0

``` r
View(CustomerData)
```
