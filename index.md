title       : Expolore the mtcars dataset
subtitle    : 
author      : Haiqiang Zhang
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

```r
head(mtcars)
```

```
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
## Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```

--- 

## Relationship Between WT and MPG

```r
ggplot(data=mtcars,aes(x=wt,y=mpg)) + geom_point() + geom_smooth()
```

```
## Error in eval(expr, envir, enclos): could not find function "ggplot"
```

--- 

## Expore Two Variable

```r
ggplot(data=mtcars,aes(x=wt,y=mpg)) + geom_point(aes(color=factor(cyl))) + geom_smooth()
```

```
## Error in eval(expr, envir, enclos): could not find function "ggplot"
```

--- 

## Build A Linear Model

```r
fit = lm(mpg ~ wt + factor(cyl), data=mtcars)
fit$coefficients
```

```
##  (Intercept)           wt factor(cyl)6 factor(cyl)8 
##    33.990794    -3.205613    -4.255582    -6.070860
```


