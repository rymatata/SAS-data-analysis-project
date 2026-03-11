options nocenter;
proc import out = WORK.household_elec
	datafile = "..\SAS_Data\household_electricity.xlsx"
	DBMS = xlsx replace;
	sheet = "Sheet1";
	getnames = yes;
run;

data power_pct_contribution;
	set household_elec;

	house_power_wh = (Global_active_power * 1000) / 60;
	subm_total_power = Sub_metering_1 + Sub_metering_2 + Sub_metering_3;

	subm1_pct = (Sub_metering_1 / house_power_wh) * 100;
	subm2_pct = (Sub_metering_2 / house_power_wh) * 100;
	subm3_pct = (Sub_metering_3 / house_power_wh) * 100;
	other_pct = 100 - (subm1_pct + subm2_pct + subm3_pct);
run;

data power_pct_contribution;
  set power_contribution;
  if other_pct < 0 then delete; 
run;


proc means data = power_pct_contribution mean median min max;
    var subm1_pct subm2_pct subm3_pct other_pct;
    title "Summary Statistics of Sub-Metering Contributions";
run;

proc reg data = power_pct_contribution;
    model Global_active_power = Sub_metering_1 Sub_metering_2 Sub_metering_3 / stb;
    title "Regression of Global Active Power on Sub-metering Categories";
run;

proc format;
    value monthfmt
        1 = "January"
        2 = "February"
        3 = "March"
        4 = "April"
        5 = "May"
        6 = "June"
        7 = "July"
        8 = "August"
        9 = "September"
        10 = "October"
        11 = "November"
        12 = "December";
run;

data monthly_contribution;
    set household_elec;
    month = month(Date);
	format month monthfmt.;
run;

proc means data = monthly_contribution;
    class month;
    var Sub_metering_1 Sub_metering_2 Sub_metering_3;
    output out = monthly_power mean = subm1_avg subm2_avg subm3_avg;
run;

proc sgplot data = monthly_power;
    series x = month y = subm1_avg / legendlabel = "Sub-metering 1" name = "s1";
    series x = month y = subm2_avg / legendlabel = "Sub-metering 2" name = "s2";
    series x = month y = subm3_avg / legendlabel = "Sub-metering 3" name = "s3";
    xaxis label = "Month" values = ("January" "February" "March" "April" "May" "June" "July" "August" 
                               "September" "October" "November" "December") type = discrete;
    yaxis label = "Average Power Consumption (per minute)";
    title "Monthly Averages in Power Consumption by Sub-Metering Group (2006-2008)";
    keylegend "s1" "s2" "s3" / title = "Sub-Metering Groups";
run;
