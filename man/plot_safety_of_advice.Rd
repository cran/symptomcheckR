% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_safety_of_advice.R
\name{plot_safety_of_advice}
\alias{plot_safety_of_advice}
\title{plot_safety_of_advice}
\usage{
plot_safety_of_advice(input)
}
\arguments{
\item{input}{A dataframe containing the output of get_safety_of_advice()}
}
\value{
A ggplot object visualizing the safety of advice for either one or multiple symptom checkers
}
\description{
Plots the safety of advice for one or multiple symptom checkers
}
\examples{
data(symptomcheckRdata)
safety_of_advice <- get_safety_of_advice(
  data = symptomcheckRdata,
  triagelevel_correct = "Goldstandard_solution",
  triagelevel_advice = "Triage_advice_from_app",
  order_triagelevel = c("Emergency", "Non-Emergency", "Self-care"),
  apps = "App_name"
  )
safety_plot <- plot_safety_of_advice(safety_of_advice)

}
