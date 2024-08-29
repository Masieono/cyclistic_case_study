-- Combining all tables into one

CREATE TABLE cyclistic_case_study.raw_combined_data AS
(
    SELECT * FROM 'cyclistic_case_study.01_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.02_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.03_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.04_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.05_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.06_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.07_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.08_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.09_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.10_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.11_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.12_2021'
);

-- Counting up the entries within the combined table

SELECT COUNT (*)

FROM 'cyclistic_case_study.raw_combined_data';