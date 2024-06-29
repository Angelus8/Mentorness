/*
**1\. TOTAL NUMBER OF RESERVATION**
*/

SELECT COUNT(*) total_reservation FROM hotels;

/*
**2\. THE MOST POPULAR MEAL PLAN**
*/

SELECT TOP 1 type_of_meal_plan, COUNT(*) AS total_order FROM hotels
GROUP BY type_of_meal_plan
ORDER BY total_order DESC;

/*
### **3\. The average price per room for reservations involving children**
*/

SELECT room_type_reserved, AVG(avg_price_per_room) AS avg_price_per_room FROM 
hotels WHERE no_of_children > 0
GROUP BY room_type_reserved;

/*
### **4\. Number of reservation for the year 2018**
*/

SELECT COUNT(*) AS num_reservation
FROM hotels WHERE YEAR(arrival_date) = 2018

/*
### **5\. The most commonly booked room type**
*/

SELECT TOP 1 room_type_reserved, COUNT(*) total_reservation
FROM hotels
GROUP BY room_type_reserved
ORDER BY total_reservation DESC;

/*
### **6\. Total reservation fall on a week-end**
*/

SELECT COUNT(*) AS total_reservation
FROM hotels
WHERE no_of_weekend_nights > 0

/*
### **7\. The highest and lowest lead time for reservations**
*/

SELECT MAX(lead_time) AS max_lead_time, MIN(lead_time) AS min_lead_time
FROM hotels

/*
### **8\. The most common market segment type for reservation**
*/

SELECT TOP 1 market_segment_type, COUNT(*) AS total_reservation
FROM hotels
GROUP BY market_segment_type
ORDER BY total_reservation DESC

/*
### **9\. The number of reservations that have a booking status of "Confirmed"**
*/

SELECT COUNT(*) AS total_reservation FROM hotels WHERE booking_status='Confirmed';

/*
### **10\. The total number of adults and children across all reservations**
*/

SELECT SUM(no_of_adults) AS total_adult,
       SUM(no_of_children) AS total_children 
FROM hotels 
WHERE no_of_adults > 0 AND no_of_children > 0

/*
### **11\. The average number of weekend nights for reservations involving children**
*/

SELECT AVG(no_of_week_nights) AS avg_week_night  FROM hotels WHERE no_of_children > 0

/*
### **12\. Number of reservation made in each month of the year**
*/

SELECT MONTH(arrival_date) AS Month, 
       YEAR(arrival_date) AS Year, 
       COUNT(*) AS Total 
FROM hotels
GROUP BY YEAR(arrival_date), 
         MONTH(arrival_date) 
ORDER BY [Year], [Month]

/*
### **13. the average number of nights (both weekend and weekday) spent by guests for each room type**
*/

SELECT room_type_reserved, AVG(no_of_week_nights + no_of_weekend_nights) AS avg_night 
FROM hotels
GROUP BY room_type_reserved

/*
### **14. the most common room type and he average** **price for that room type with children**
*/

SELECT TOP 1 room_type_reserved, AVG(avg_price_per_room) AS avg_price
FROM hotels 
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY COUNT(*) DESC

/*
### **15\. The market segment type that generates the highest average price per room**
*/

SELECT TOP 1 market_segment_type, AVG(avg_price_per_room) AS avg_price_per_room
FROM hotels
GROUP BY market_segment_type
ORDER BY avg_price_per_room DESC