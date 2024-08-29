Cyclistic google analytics case study - 

ASK
- How do annual members and casual riders use the bike sharing service differently?

Once data gets imported to the appropriate format (sheets, Rstudio, or SQL), 
- what insights can be gathered with just the available data? 
- What additional data can be calculated from the data that is already given? 
    - 'trip duration' can be calculated from the start and end times
    - 'weekday' can be calculated from either start or end time



Preparing the data - 

Data is located on my google drive

Data is organized into folders -
    - One has raw csv data
    - One has cleaned csv data

There are a few considerations into credibility with this data - 
    - Some trips have a negative time delta. These entries are omitted.
    - Some trips span days or weeks. These entries are omitted.
    - Some bikes are logging trips at a testing facility. These entries are omitted. 
        WATSON TESTING - DIVVY station 676 
        Hubbard Bike-checking (LBS-WH-TEST)


    - Many trips do not have a logged start or end station id. These entries are kept, so far this information does not seem entirely useful (yet)
    - With this information, there is no way to tell if casual riders are purchasing multiple single passes.
    - There is no PII within these source files, so privacy and security are not a consideration



Verifying the integrity of the data - 
    - Calculating a time delta using started_at and ended_at times
    - 


Guiding questions
● Are there issues with bias or credibility in this data? Does your data ROCCC?
● How are you addressing licensing, privacy, security, and accessibility?

● How does it help you answer your question?

Key tasks

● Sort and filter the data.
● Determine the credibility of the data.


Deliverable
● A description of all data sources used


Typically, the most common day to use the bikeshare system is day 7, or Saturday.