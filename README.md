### Cyclistic Case Study

This case study is from the [Google Data Analytics](https://www.coursera.org/professional-certificates/google-data-analytics) course on [Coursera](https://www.coursera.org/). Data for the year 2021 was used and sourced from [here](https://divvy-tripdata.s3.amazonaws.com/index.html) (accessed on 8/29/24). This data was made available by Motivate International Inc. under [this](https://divvybikes.com/data-license-agreement) license.

---

### Scenario: 
I am a junior data analyst working for a bike-share company called Cyclistic based out of Chicago. The marketing director believes that a maximum number of annual memberships is important for the company's success.

The team of data analysts needs to determine how annual members and casual riders use Cyclistic bikes differently. These insights will drive the marketing strategy to convert casual riders into annual members, but must be backed up with factual information and professional data visualizations.

### The primary question to answer: 
- How do annual membership holders and casual riders use Cyclistic bikes differently?

---

### Data preparation

Upon accessing the site, I downloaded the twelve CSV files that corresponded to each month of 2021, saving the raw data to my computer. Briefly looking through a few of the files on Google Sheets, I quickly found out that these files were too large for a spreadsheet application. 

I then uploaded each CSV file into [google bigquery](cloud.google.com/bigquery) for analysis. Fortunately, each CSV file followed the same schema. It was only a matter of combining the twelve files to create one new table for the entire year. For this I used the UNION ALL operator.

Available columns from the raw data - 

  <img width="373" alt="01_raw_combined_data_schema" src="https://github.com/user-attachments/assets/cfba06d8-bea0-446a-8e74-6427b85af4d4">

With the raw data so far, there were 6,399,415 logged bike rides in 2021 (about 5 million more than a spreadsheet will allow).

  <img width="232" alt="02_total_raw_entries" src="https://github.com/user-attachments/assets/b2feff7c-70e8-437e-ab8e-c4bb7d7000a9">

The next step was to add a few columns to help with later analysis - 
- Total trip time for each bike ride, calculated by subtracting the start time from the end time.
- Month, extracted from the 'started_at' timestamp.
- Specific day of the week, also extracted from the 'started_at' timestamp. 

A new table was saved with these columns added and formatted appropriately -

<img width="334" alt="Screenshot 2024-08-30 at 12 35 57 PM" src="https://github.com/user-attachments/assets/31f65df5-620c-45a0-8149-1fd36a708a26">

---

### Data exploration

The next step was to take a look through the data for any thing that may suggest the data needs cleaning. 

When checking the min and max values of trip durations, there are trips that have a negative time difference (impossible) as well as trips that lasted hundreds of hours - 

<img width="295" alt="Screenshot 2024-08-30 at 1 02 13 PM" src="https://github.com/user-attachments/assets/dcf91fae-2145-4f5a-b336-fbc6f2cfe53c">


---

### Filtering out bad or incomplete data
Throughout the data exploration, there were a few different things I noticed that gave me suspicion that some of the data was either erroneous or unneccessary for analysis:
- 



*****img of newly implemented columns


****total number + img of filtered rides for entire year
