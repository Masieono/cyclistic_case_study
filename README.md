<img width="788" alt="00_narrow_cover" src="https://github.com/user-attachments/assets/eb150de7-5768-4605-a288-ae576da02b55">

### Cyclistic Case Study

This case study is from the [Google Data Analytics](https://www.coursera.org/professional-certificates/google-data-analytics) course on [Coursera](https://www.coursera.org/). Data for the year 2021 was used and sourced from [here](https://divvy-tripdata.s3.amazonaws.com/index.html) (accessed on 8/29/24). This data was made available by Motivate International Inc. under [this](https://divvybikes.com/data-license-agreement) license.

Primary tools used include SQL via [Google BigQuery](cloud.google.com/bigquery) for data manipulation and analysis, and [Tableau Public](https://public.tableau.com/) for data visualization.

---

### Scenario: 
I am a junior data analyst working for a bike-share company called Cyclistic based out of Chicago. The marketing director believes that a maximum number of annual memberships is important for the company's success. The team of data analysts needs to determine how annual members and casual riders use Cyclistic bikes differently. These insights will drive the marketing strategy to convert casual riders into annual members, but must be backed up with factual information and professional data visualizations.

### The primary question to answer: 
> How do annual membership holders and casual riders use Cyclistic bikes differently?

---

### Data preparation
[SQL Queries](https://github.com/Masieono/cyclistic_case_study/blob/191616340c95c13e8bc9b20618ac05098b55126b/01_data_preparation.sql)

Upon accessing the site, I downloaded the twelve CSV files that corresponded to each month of 2021, saving the raw data to my computer. Briefly looking through a few of the files on Google Sheets, I quickly found out that these files were too large for a spreadsheet application. 

I then uploaded each CSV file into [google bigquery](cloud.google.com/bigquery) for analysis. Fortunately, each CSV file followed the same schema. It was only a matter of combining the twelve files to create one new table for the entire year. For this I used the UNION ALL operator.

Available columns from the raw data - 

  <img width="373" alt="01_raw_combined_data_schema" src="https://github.com/user-attachments/assets/cfba06d8-bea0-446a-8e74-6427b85af4d4">

With the raw data so far, there were 5,595,063 logged bike rides in 2021 (over 4 million more than a spreadsheet will allow).

<img width="111" alt="02_total_raw_entries" src="https://github.com/user-attachments/assets/c9c5b2e6-5775-4ab9-91cc-fcef1fe7bd22">

The next step was to add a few columns to help with later analysis - 
- Total trip time for each bike ride, calculated by subtracting the start time from the end time.
- Month, extracted from the 'started_at' timestamp.
- Specific day of the week, also extracted from the 'started_at' timestamp. 

A new table was saved with these columns added and formatted appropriately -

<img width="334" alt="Screenshot 2024-08-30 at 12 35 57 PM" src="https://github.com/user-attachments/assets/31f65df5-620c-45a0-8149-1fd36a708a26">

---

### Data exploration
[SQL Queries](https://github.com/Masieono/cyclistic_case_study/blob/191616340c95c13e8bc9b20618ac05098b55126b/02_data_exploration.sql)

The next step was to take a look through the data for any thing that may suggest the data needs cleaning. 

When checking the min and max values of trip durations, there are trips that have a negative time difference (impossible) as well as trips that lasted hundreds of hours - 

<img width="295" alt="Screenshot 2024-08-30 at 1 02 13 PM" src="https://github.com/user-attachments/assets/dcf91fae-2145-4f5a-b336-fbc6f2cfe53c">

Next step was to check for any null values. Those entries would need to get removed in the cleaning process.

<img width="801" alt="05_nulls_by_column" src="https://github.com/user-attachments/assets/86cf662e-596c-48c0-b346-5a4d36649e8f">

It looks like there are only nulls dealing with the start and end points of entries. All other columns are fully populated. 

There are no nulls or duplicates in the ride_id column, so this will be the primary key.

<img width="392" alt="06_check_duplicates" src="https://github.com/user-attachments/assets/1f929e46-7c46-45ac-8826-e591f4ef8ada">

The rideable_type column seems to only have three different types.

<img width="299" alt="06_rideable_type_breakdown" src="https://github.com/user-attachments/assets/13846daa-08bd-42d6-a5b2-d29d8ad56c38">

Similarly, member_casual only has two variants.

<img width="300" alt="07_member_casual_breakdown" src="https://github.com/user-attachments/assets/b2377499-05b8-458e-8ca7-006b0521900f">

The start and end destinations also need to be checked. It appears there are some start and endpoints that serve as testing or storage locations, judging by their names - 
- Hubbard Bike-checking (LBS-WH-TEST)
- Base - 2132 W Hubbard Warehouse
- DIVVY CASSETTE REPAIR MOBILE STATION
- DIVVY 001

These locations are most likely used by the company, not the customers. Trips that involve these locations will need to be removed in the cleaning phase.

Based on the data given, there isn't a way to tell if customers are buying multiple bike passes in the same day. This means there isn't a clear connection with the number of logged casual rides and number of casual customers. 

---

### Data cleaning
[SQL Queries](https://github.com/Masieono/cyclistic_case_study/blob/191616340c95c13e8bc9b20618ac05098b55126b/03_data_cleaning.sql)

Just to be safe, I duplicated the raw combined data as a new table for cleaning. Once this was made, it was finally time to start filtering out all the erroneous information:
- Trips with null values. This removed 1,006,761 rows
- Trips with negative trip durations. This removed 116 rows
- Trips with trip durations over 24 hours. This removed 1,275 rows
- Trips that involve a testing facility or storage warehouse. This removed 589 rows

This brought the total number of trips down from 5,595,063 to 4,586,322 - a removal of 1,008,741 rows!

--- 

### Data analysis and visualizations
[SQL Queries](https://github.com/Masieono/cyclistic_case_study/blob/191616340c95c13e8bc9b20618ac05098b55126b/04_data_analysis.sql)

Now that the data was much more reliable and complete, it was time to truly answer the question at hand - 

> How do annual membership holders and casual riders use Cyclistic bikes differently?

There were a few metrics I wanted to make sure to explore - 
- how does ridership change throughout the year for both members and casuals? 
- Which locations do members and casuals most often use? Does their geographic location imply anything?
- Do members and casuals prefer to use a specific bike type?
- Is there any difference between casuals and members in terms of what time of day they ride?

To better illustrate these questions, I used Tableau to create visualizations of the cleaned data. A few of the visualizations are copied here, but you can find the full showcase on my [Tableau Dashboard](https://public.tableau.com/app/profile/mason.voskamp/viz/CyclisticCaseStudy_17253054375820/RidesBreakdown).


<img width="831" alt="Screenshot 2024-09-09 at 11 36 30 AM" src="https://github.com/user-attachments/assets/fb5c2fe9-f510-47ff-9607-c1c21d317d3e">

Only casual riders choose the docked bike type.

<img width="928" alt="Screenshot 2024-09-09 at 11 38 47 AM" src="https://github.com/user-attachments/assets/c44fe06e-aefa-4ffa-8caf-bd2c224ce171">

Casuals prefer to ride in the evenings. Members tend to ride during rush-hours.

<img width="928" alt="Screenshot 2024-09-09 at 11 37 39 AM" src="https://github.com/user-attachments/assets/0f8fa61c-0d8a-441e-a96c-dd10772d5d31">

Casual riders consistently take longer trips on average.



---
### Conclusions

Based on the analyzed data, there are some clear differences between casual riders and members:

| Casuals  | Members |
| ------------- | ------------- |
| Use bikes primarily on weekends | Use bikes primarily on weekdays  |
| Take longer trips  | Take shorter trips  |
| Start and end trips closer to the coastline, next to tourist and leisure sites  | Start and end trips more inland, next to residential and commercial areas  |
| Tend to use docked bikes  | Virtually never use docked bikes  |

Based on these conclusions, Cyclistic could convert casual riders into members with a few different strategies:

1. Offer a "vacationers" membership to attract riders that primarily use the bikes during the warmer months in Q2 and Q3.

2. Offer a membership package specific to docked bikes, riding on weekends, or for taking trips longer than 20 minutes.

3. Advertise more heavily near the coast at locations that casuals are more likely to start or end their trip.
