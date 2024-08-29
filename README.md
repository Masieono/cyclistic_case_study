# Cyclistic Case Study

This case study is from the [Google Data Analytics](https://www.coursera.org/professional-certificates/google-data-analytics) course on [Coursera](https://www.coursera.org/)

Data for the year 2021 was used and was sourced from [here](https://divvy-tripdata.s3.amazonaws.com/index.html) (accessed on 8/29/24). This data is available by Motivate International Inc. under [this](https://divvybikes.com/data-license-agreement) license.
---

## Scenario: 
I am a junior data analyst working for a bike-share company called Cyclistic based out of Chicago. The marketing director believes that a maximum number of annual memberships is important for the company's success.

The team of data analysts needs to determine how annual members and casual riders use Cyclistic bikes differently. These insights will drive the marketing strategy to convert casual riders into annual members, but must be backed up with factual information and professional data visualizations.

## The primary questions to answer: 
- How do annual membership holders and casual riders use Cyclistic bikes differently?

---

### Data preparation

Upon accessing the site, I downloaded the twelve CSV files that corresponded to each month of 2021, saving the raw data to my computer's hard drive. Briefly looking through a few of the files on Google Sheets, I quickly found out that these files were too large for a spreadsheet application. 

I then uploaded each CSV file into [google bigquery](cloud.google.com/bigquery) for analysis. Fortunately, each CSV file followed the same schema. It was only a matter of combining the twelve files to create one new table for the entire year. For this I used the UNION ALL operator.

image of schema within bigquery showing columns - 
	![alt text](image.jpg)


With the raw data so far, there were 6,399,415 logged bike rides in 2021.
	![alt text](image.jpg)


### Filtering out bad or incomplete data


****total number of filtered rides for entire year