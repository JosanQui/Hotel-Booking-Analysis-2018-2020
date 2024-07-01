# Hotel Booking Analysis 2018-2020
Hotel Booking analysis using data from 2018-2020 to arrive at key hotel, guest and cancellation metrics

![FINAL_Hotel Data Analysis_page-0001](https://github.com/JosanQui/test_Hotel-Booking-Analysis-2018-2020/assets/173809528/1cd756ce-b863-4a9f-b7b8-9573ea277c43)

![FINAL_Hotel Data Analysis_page-0002](https://github.com/JosanQui/test_Hotel-Booking-Analysis-2018-2020/assets/173809528/e5cb6af7-50d9-4405-8361-1f39e1018404)

![FINAL_Hotel Data Analysis_page-0003](https://github.com/JosanQui/test_Hotel-Booking-Analysis-2018-2020/assets/173809528/bbcce455-2564-481a-9093-fef0dc7caa82)


## **Data Source**

+	Excel source file contains 100,756 hotel booking records from 2018-2020
+	Source file has required fields for analysis such as arrival no. of stays (nights), average daily rate, meal type and cost, market segment and discount per segment, distribution channel, customer type, reservation status, etc.
+	Original source file credited to Gaellim Holland (https://www.youtube.com/@absentdata)


## **Points of Interest**

+	Total Room Revenue, Roomnights, Bookings and ADR per Year
+	Revenue per Distribution Channel and Market Segment
+	Identify Booking, Rate and Revenue Trend
+	Determine type of guests (Customer Type, Repeat vs. New, Country, Meal and Parking Preferences)
+	Cancellation overview (Actual vs Cancellation Revenue by year/month, per Distribution Channel and by Market Segment, Cancellation Rate)


## **Steps Taken**

1.	Convert XLSX file into CSV, then import into MySQL Workbench for cleaning and transformation 
    - Column name and type clean up 
    - Create SQL Queries to verify data and prepare for loading into Power BI (UNION)
2.	Loading into Power BI for visualization
    - Connect to MySQL and import using UNION query 
    - Transformation using Power Query
      - Data types
      - Dates/Types and null value transformations
    - Added table, columns and measures for needed for dashboard (date, roomnight, revenue, cancellation status, etc.) 
    - Creation and formatting of final dashboard


## **Summary of Findings**

1.	Since data begins with 1-Jul-2018 and ends on 21-Aug-2020, revenue and booking totals are skewed in favor of 2019 figures. That said, there is a significant increase in bookings and revenue from 2018 to 2019 for both hotel types. While there is a decrease from 2019-2020, some loss in numbers can be attributed to the missing months in 2020 (from September-December 2020). Average Rates have remained close between properties, with slight increases from 2018 until 2020.
2.	Hotel revenue distribution channels are largely contributed by the TA/TO ($14.9M) and Direct ($4.3M) channels. Consequently, the top 2 market segments come from Online TA ($10.2M) and Direct ($4.2M) segments.
3.	In terms of seasonality, July-August are the peak months while January-February are slow months.
4.	The majority of room revenue come from guests from the Transient category (mainly Transient at $15.7M followed by Transient-Party as a distant second at $2.77M). The top 3 countries generating business come from Portugal ($4.8M), UK ($3.1M) and France ($2.2M). Meanwhile, majority of the clients are new ($19.6M), likes to book BB meal package (58k requests) and do not require parking spaces (65K of guests).
5.	Due to the similar trend of bookings and revenue, it is understandable that actual revenue and cancellation revenues follow the same trend. That is, significantly increasing from 2018-2019 and slightly decreasing again from 2019-2020. Similarly, since hotel revenue comes mainly from the TA/TO and Direct distribution channels, and the Online TA and Direct market segments, these are also the main contributors of cancellation revenues. Meanwhile, cancellation rate is slightly higher in city hotels (29%) vs resort hotels (23%), while cancellation by customer type shows majority by Transient category (21%).


## **Project Takeaways**

+	While Agent and Company fields that are NULL are valid (i.e., a booking is possibly booked directly, or not associated with a company), a Country field that is NULL shows data entry error and may be addressed in data entry SOPs
+	Undefined values under Market Segment and Distribution Channel need to be reviewed vs data entry standards
+	Although slicers have been added to filter page report either by hotel type, year, market segment, distribution channel and customer type, the hotel overview and guest overview report pages in Power BI are filtered further to show only bookings that are not cancelled. Meanwhile, the cancellation overview report page shows all bookings (cancelled and non-cancelled) to show comparison.

