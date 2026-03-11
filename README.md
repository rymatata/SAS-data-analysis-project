# Analysis of Individual Household Electric Power Consumption
The aim of this project is to analyze data collection through the utilization of SAS. The dataset being analyzed was donated to UCI on August of 2012 and contains measurements of power consumption throughout a singular household located in Sceaux, an affluent town located roughly 7 kilometers outside of Paris. The data was sampled every minute of the day from December 2006 to 2008. In conducting this data analysis, various common household appliances and their power usage will be revealed. Allowing for homeowners to gain a better understanding of which appliances take up the most power and contribute the most towards expenses and electric bills.

The code and results can be found within this repository in their respective folders.

# Research Question
## Which sub-metering category contributes the most to the household's gloval active power consumption over the observed period? How does this contribution vary over time?
Various plots, regression models, R-squared tests, and variance analyses will be utilized in the effort to analyze the data and provide a valid answer.

### Variables 
| Variable Name  | Description |
| ------------- | ------------- |
| Date | The day of data collection (mm/dd/yyyy) |
| Time | Time of the day of data collection (hh:mm:ss) |
| Global_reactive_power | Represents the power that is constantly flowing back and forth between the source and load; household global minute-averaged reactive power (kW) |
| Global_active_power | Represents the power actually consumed by a load; Household global minute-averaged active power (kW) |
| Global_intensity | Household global minute-averaged current intensity (A) |
| Voltage | Minute-averaged voltage (V) |
| Sub_metering_1 | Kitchen; contains a dishwasher, oven, and microwave |
| Sub_metering_2 | Laundry room; contains a washing-machine, tumble-drier, refrigerator, and overhead light |
| Sub_metering_3 | Electric water-heater and an air-conditioner |

The sub metering groups consist of multiple appliances so as to simplify data collection. Grouping them this way is also done in a logical manner as the included appliances are commonly found in the same room/grouped together in nearly every household.

# Results
The P-value was found to be less than 0.0001, which indicates that the overall model is highly statistically significant. R-square of 0.6924 suggests that 69.24% of the variability in "Global_active_power" is accounted for the three sub metering groups. This is a rather strong fit for regression, though it does leave about 30.76% unexplained. "Sub_metering_3" has the highest mean percentage at 22.67% and consistently measured values greater than the other two groups throughout the months.

The unexplained ~30% of data is due to external variables that impacted the data collection but were not included in the model. This may include space heaters, lighting, unmonitored appliances, and many more that still contributed but were simply not measured. What was most interesting was that the three sub metering groups combined didn't even produce a majority of the overall power consumed in the household.

# Conclusion
The group that contributed the most to power consumption in the household out of the three groups was "Sub_metering_3". This can be explained by the heating and air conditioning, which are units that must remain on and functioning throughout each day so as to maintain the climate of the house. For future use, it would most likely be beneficial to include more household appliances throughout each group and even add more groups if need be. Perhaps even measuring each appliance individually would allow for more relevant data and accurate conclusions as to which appliance specifically contributes the most to power consumption.

# Reference
Hebrail, G. & Berard, A. (2006). Individual Household Electric Power Consumption [Dataset]. UCI Machine Learning Repository. https://doi.org/10.24432/C58K54.
