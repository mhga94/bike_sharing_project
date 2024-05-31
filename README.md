# Market entry analysis: Washington DC bike sharing

[Summary](#Summary)
[Observations](#Observations)
[Conclusions](#Conclusions)
[Expansion](#Expansion)
[Slides](#Slides)
[Install](#Install)
[Development](#Development)
[Contributors](#Contributors)


## Summary

This analysis uses historical bike rental scheme data from Washington DC in the years of 2011 and 2012. The trends and insights observed in the data inform a wider (fictional) market entry analysis for Lime cycles, an ebike rental company. The analysis includes indicative customer profiles, observations, estimated required fleet size and indicative marketing/promotions strategy. A brief summary of the SQL setup is also included for the purposes of the bootcamp learning goals. 

## Insights

The following trends were observed in the data:
* Casual renters used bikes predominantly at weekends and during Spring/Summer months.
* Registered renters used bikes predominantly on Monday-Friday, suggesting a cohort that uses the bikes for commuting.
* Environmental factors such as temperature were found to influence the likelihood of rentals, particularly in the casual sector.

## Conclusions

Based on the above observations, the following can be concluded in relation to the market entry opportunity for Lime cycles:
* In 2011-2012, there was a market opportunity for ebike companies to disrupt existing cycle rental schemes based on a broad range in demand across the year (as seen in the seasonal data).
* An indicative initial outlay of $250k on active cycle fleet was outlined, based on estimations for cycle recharge, repair and replacement on a weekly and annual basis. Maintenance and plant costs were not considered.

## Expansion

Additional areas to explore in the data might include:
* **Visualisation**: An interactive dashboard (e.g. using the Dash package) to explore the data would be beneficial for further comparison of factors contributing to changes in renter behaviour. 

## Slides

The slides presenting the data and analysis can be found at: [slides]: ['https://docs.google.com/presentation/d/193zeGFAs-aB0kKN8d_4R18fLPNvRBr2MHIilBwYj59g/edit?usp=sharing']

## Install

### Python

The data cleaning and visualisations in Python used the following packages:
* numpy
* pandas
* matplotlib
* seaborn

The versions for the above packages can be found in the requirements text file.

### MySQL

Database work was completed with MySQL Workbench 8.0.36 Community under the GNU General Public License (GPLv2) distributed by Oracle.

## Development

Data is taken from the UCI ML repository and was loaded into a 3-table MySQL schema using MySQL Workbench. Plots were constructed using pandas and matplotlib.

## Contributors

mhga94
ryanvandenakker
vsalto