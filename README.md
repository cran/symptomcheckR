# `symptomcheckR` package

### Easy analysis and visualization of symptom checker performance metrics

<!-- badges: start -->

[![CRAN status](https://www.r-pkg.org/badges/version/symptomcheckR)](https://CRAN.R-project.org/package=symptomcheckR) [![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable) [![R-CMD-check](https://github.com/ma-kopka/symptomcheckR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ma-kopka/symptomcheckR/actions/workflows/R-CMD-check.yaml) [![](https://cranlogs.r-pkg.org/badges/grand-total/symptomcheckR)](https://cran.r-project.org/package=symptomcheckR)


<!-- badges: end -->

The `symptomcheckR` package can be used to analyze the performance of symptom checkers across various metrics. Since many studies report different metrics, we aimed to standardize performance reporting by developing more reliable metrics that future studies should include. They can be found in [Kopka et al. (2023)](https://doi.org/10.1177/20552076231194929). To make it easier for researchers and other stakeholders to report these metrics and compare different symptom checkers, we developed this package.

### Installation

```{r eval=FALSE}
install.packages("symptomcheckR")
```

### Usage

First, load the package:

```{r eval=FALSE}
library(symptomcheckR)
```

Now you can load the data set to test the commands:

```{r eval=FALSE}
data(symptomcheckRdata)
```

This will load the data set. You can run all commands from this package now. These include the following metrics:

Accuracy:

```{r eval=FALSE}
accuracy_value <- get_accuracy(
  symptomcheckRdata, 
  correct = "Correct_Triage_Advice_provided_from_app", 
  apps = "App_name")
plot_accuracy(accuracy_value)
```

Accuracy by triage level:

```{r eval=FALSE}
get_accuracy_by_triage(
  symptomcheckRdata,
  correct = "Correct_Triage_Advice_provided_from_app", 
  triagelevel = "Goldstandard_solution",
  apps = "App_name")
plot_accuracy_by_triage(accuracy_value_by_triage)
```

Safety of advice:

```{r eval=FALSE}
safety <- get_safety_of_advice(
  data = symptomcheckRdata, 
  triagelevel_correct = "Goldstandard_solution",
  triagelevel_advice = "Triage_advice_from_app",
  order_triagelevel = c("Emergency", "Non-Emergency", "Self-care"),
  apps = "App_name")
plot_safety_of_advice(safety)
```

Comprehensiveness:

```{r eval=FALSE}
comprehensiveness <- get_comprehensiveness(
  data = symptomcheckRdata, 
  triagelevel_advice = "Triage_advice_from_app", 
  vector_not_entered = c(NA),
  apps = "App_name")
plot_comprehensiveness(comprehensiveness)

```

Inclination to overtriage:

```{r eval=FALSE}
inclination_to_overtriage <- get_inclination_overtriage(
  data = symptomcheckRdata, 
  triagelevel_correct = "Goldstandard_solution",
  triagelevel_advice = "Triage_advice_from_app",
  order_triagelevel = c("Emergency", "Non-Emergency", "Self-care"),
  apps = "App_name")
plot_inclination_overtriage(inclination_to_overtriage)

```

Item Difficulty of each vignette:

```{r eval=FALSE}
get_item_difficulty(
  data = symptomcheckRdata, 
  correct = "Correct_Triage_Advice_provided_from_app",
  vignettes = "Vignette_id")

```

For all of these commands, you can set CI to TRUE (by passing the argument CI == TRUE to the corresponding function) to obtain 95% confidence intervals. 

Capability Comparison Score:

```{r eval=FALSE}
ccs <- get_ccs(
  data = symptomcheckRdata,
  correct = "Correct_Triage_Advice_provided_from_app",
  vignettes = "Vignette_id",
  apps = "App_name")
plot_ccs(ccs)
```

Capability Comparison Score on each triage level:

```{r eval=FALSE}
get_ccs_by_triage <- get_ccs_by_triage(
  data = symptomcheckRdata,
  correct = "Correct_Triage_Advice_provided_from_app",
  vignettes = "Vignette_id",
  apps = "App_name",
  triage = "Goldstandard_solution")
```

Users can also get a performance overview for one or multiple symptom checkers. To get the overview (and publication-ready figures) for a single symptom checker, you can use the following command:

```{r eval=FALSE}
df_individual <- symptomcheckRdata %>%
  filter(App_name == "Ask NHS")

plot_performance_single(
  data = df_individual, 
  triagelevel_correct = "Goldstandard_solution",
  triagelevel_advice = "Triage_advice_from_app",
  order_triagelevel = c("Emergency", "Non-Emergency", "Self-care"),
  vector_not_entered = c(NA)) 
```

To compare multiple symptom checkers (and produce publication-ready figures), you can use the following command:

```{r eval=FALSE}
plot_performance_multiple(
  data = symptomcheckRdata, 
  triagelevel_correct = "Goldstandard_solution",
  triagelevel_advice = "Triage_advice_from_app",
  order_triagelevel = c("Emergency", "Non-Emergency", "Self-care"),
  vector_not_entered = c(NA),
  vignettes = "Vignette_id",
  apps = "App_name")
```

To calculate the inter-rater reliability (if multiple inputters were involved), you can use the following command:

```{r eval=FALSE}
get_irr(
   data = df,
   ratings = c("datarater1", "datarater2", "datarater3"),
   order_triagelevel = c("Emergency", "Non-Emergency", "Self-care"),
   )
```

### Links

-   [Development and explanation of all metrics](https://doi.org/10.1177/20552076231194929)
-   [Contact the maintainer](https://de.linkedin.com/in/marvin-kopka-9b79171b5)

-   [Department of Ergonomics at TU Berlin](https://www.tu.berlin/en/awb)
