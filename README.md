
<!-- README.md is generated from README.Rmd. Please edit that file -->

# jofou.lib

<!-- badges: start -->
<!-- badges: end -->

The goal of `jofou.lib` is to regroup all the functions that are useful
for me to work efficiently.

## Installation

You can install the released version of hr.churn from
[CRAN](https://CRAN.R-project.org) with:

``` r
devtools::install_github("jofou/jofou.lib")
```

## Example

This are basics examples which shows you how use the my\_inspect group
function:

``` r
library(tidyverse)
library(jofou.lib)

iris %>% 
  my_inspect_cat()
```

<table class="table table-condensed" style="width: auto !important; ">
<caption>
Resume et comparaison des variables categoriques
</caption>
<thead>
<tr>
<th style="text-align:left;">
Nom de la variable
</th>
<th style="text-align:right;">
Nombre
</th>
<th style="text-align:left;">
Commun
</th>
<th style="text-align:right;">
pourcentage
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Species
</td>
<td style="text-align:right;">
3
</td>
<td style="text-align:left;">
setosa
</td>
<td style="text-align:right;">
33
</td>
</tr>
</tbody>
</table>

``` r
library(tidyverse)
library(jofou.lib)

iris %>% 
  my_inspect_cor()
```

<table class="table table-condensed" style="width: auto !important; ">
<caption>
Coeficient de correlation pour toutes les variables numeriques
</caption>
<thead>
<tr>
<th style="text-align:left;">
col\_1
</th>
<th style="text-align:left;">
col\_2
</th>
<th style="text-align:right;">
corr
</th>
<th style="text-align:right;">
p\_value
</th>
<th style="text-align:right;">
lower
</th>
<th style="text-align:right;">
upper
</th>
<th style="text-align:right;">
pcnt\_nna
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Petal.Width
</td>
<td style="text-align:left;">
Petal.Length
</td>
<td style="text-align:right;">
0.96
</td>
<td style="text-align:right;">
0.000000
</td>
<td style="text-align:right;">
0.95
</td>
<td style="text-align:right;">
0.97
</td>
<td style="text-align:right;">
100
</td>
</tr>
<tr>
<td style="text-align:left;">
Petal.Length
</td>
<td style="text-align:left;">
Sepal.Length
</td>
<td style="text-align:right;">
0.87
</td>
<td style="text-align:right;">
0.000000
</td>
<td style="text-align:right;">
0.83
</td>
<td style="text-align:right;">
0.91
</td>
<td style="text-align:right;">
100
</td>
</tr>
<tr>
<td style="text-align:left;">
Petal.Width
</td>
<td style="text-align:left;">
Sepal.Length
</td>
<td style="text-align:right;">
0.82
</td>
<td style="text-align:right;">
0.000000
</td>
<td style="text-align:right;">
0.76
</td>
<td style="text-align:right;">
0.86
</td>
<td style="text-align:right;">
100
</td>
</tr>
<tr>
<td style="text-align:left;">
Petal.Length
</td>
<td style="text-align:left;">
Sepal.Width
</td>
<td style="text-align:right;">
-0.43
</td>
<td style="text-align:right;">
0.000000
</td>
<td style="text-align:right;">
-0.55
</td>
<td style="text-align:right;">
-0.29
</td>
<td style="text-align:right;">
100
</td>
</tr>
<tr>
<td style="text-align:left;">
Petal.Width
</td>
<td style="text-align:left;">
Sepal.Width
</td>
<td style="text-align:right;">
-0.37
</td>
<td style="text-align:right;">
0.000009
</td>
<td style="text-align:right;">
-0.50
</td>
<td style="text-align:right;">
-0.22
</td>
<td style="text-align:right;">
100
</td>
</tr>
<tr>
<td style="text-align:left;">
Sepal.Width
</td>
<td style="text-align:left;">
Sepal.Length
</td>
<td style="text-align:right;">
-0.12
</td>
<td style="text-align:right;">
0.154025
</td>
<td style="text-align:right;">
-0.27
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
100
</td>
</tr>
</tbody>
</table>

``` r
library(tidyverse)
library(jofou.lib)

iris %>% 
  my_inspect_imb()
```

<table class="table table-striped table-condensed" style="width: auto !important; ">
<caption>
Resume des categories les plus utilisees
</caption>
<thead>
<tr>
<th style="text-align:left;">
Nom de la variable
</th>
<th style="text-align:left;">
Categorie
</th>
<th style="text-align:right;">
Pourcentage
</th>
<th style="text-align:right;">
Nombre
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Species
</td>
<td style="text-align:left;">
setosa
</td>
<td style="text-align:right;">
33
</td>
<td style="text-align:right;">
50
</td>
</tr>
</tbody>
</table>

``` r
library(tidyverse)
library(jofou.lib)

iris %>% 
  my_inspect_na()
```

<table class="table table-condensed" style="width: auto !important; ">
<caption>
Nombre de valeur manquante pour chaque variable
</caption>
<thead>
<tr>
<th style="text-align:left;">
Nom de la variable
</th>
<th style="text-align:right;">
NA
</th>
<th style="text-align:right;">
Pourcentage
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Sepal.Length
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
Sepal.Width
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
Petal.Length
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
Petal.Width
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
Species
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
</tr>
</tbody>
</table>

``` r
library(tidyverse)
library(jofou.lib)

iris %>% 
  my_inspect_num()
```

<table class="table table-condensed" style="width: auto !important; ">
<caption>
Resume et comparaison des variables numeriques
</caption>
<thead>
<tr>
<th style="text-align:left;">
Nom de la variable
</th>
<th style="text-align:right;">
min
</th>
<th style="text-align:right;">
q1
</th>
<th style="text-align:right;">
median
</th>
<th style="text-align:right;">
moyenne
</th>
<th style="text-align:right;">
q3
</th>
<th style="text-align:right;">
max
</th>
<th style="text-align:right;">
sd
</th>
<th style="text-align:right;">
NA (%)
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Sepal.Length
</td>
<td style="text-align:right;">
4
</td>
<td style="text-align:right;">
5
</td>
<td style="text-align:right;">
6
</td>
<td style="text-align:right;">
6
</td>
<td style="text-align:right;">
6
</td>
<td style="text-align:right;">
8
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
Sepal.Width
</td>
<td style="text-align:right;">
2
</td>
<td style="text-align:right;">
3
</td>
<td style="text-align:right;">
3
</td>
<td style="text-align:right;">
3
</td>
<td style="text-align:right;">
3
</td>
<td style="text-align:right;">
4
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
Petal.Length
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
2
</td>
<td style="text-align:right;">
4
</td>
<td style="text-align:right;">
4
</td>
<td style="text-align:right;">
5
</td>
<td style="text-align:right;">
7
</td>
<td style="text-align:right;">
2
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
Petal.Width
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
2
</td>
<td style="text-align:right;">
2
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
0
</td>
</tr>
</tbody>
</table>

``` r
library(tidyverse)
library(jofou.lib)

iris %>% 
  my_inspect_types()
```

<table class="table table-condensed" style="width: auto !important; ">
<caption>
Types de variables disponibles
</caption>
<thead>
<tr>
<th style="text-align:left;">
Type
</th>
<th style="text-align:right;">
Nombre
</th>
<th style="text-align:right;">
Pourcentage
</th>
<th style="text-align:left;">
Nom des variables
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:right;">
4
</td>
<td style="text-align:right;">
80
</td>
<td style="text-align:left;">
Sepal.Length, Sepal.Width , Petal.Length, Petal.Width
</td>
</tr>
<tr>
<td style="text-align:left;">
factor
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
20
</td>
<td style="text-align:left;">
Species
</td>
</tr>
</tbody>
</table>
