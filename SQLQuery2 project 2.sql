
with hotels as(
select* from dbo.['2018$']
union
select* from dbo.['2019$']
union
select* from dbo.['2020$'])

select * from hotels 
left join dbo.market_segment$
on hotels.market_segment=market_segment$.market_segment
left join dbo.meal_cost$
on hotels.meal=meal_cost$.meal


--OR
--combining all our tables (dbo.2018,dbo.2019,dbo.2020) with the use of union and naming it new_hotel
INTO hotels from(
select* from dbo.['2018$']
union
select* from dbo.['2019$']
union
select* from dbo.['2020$'])
AS Hotel




--in order to indicate if the hotel revenue is growing per year, we create our revenue
--by adding our weekendnights and week night and multiplying with
--adr which is the daily rate for the hotel to indicate the cost of the revenue

select 
(stays_in_weekend_nights +stays_in_week_nights)*adr as revenue
from new_hotel
select * from new_hotel



-- summing up the arrival date year with the new formed revenue to indicate rate of revenue by year
-- and to be broken down by hotel type, we add hotel type column

select arrival_date_year, hotel,sum ((stays_in_weekend_nights +stays_in_week_nights)*adr )as revenue
from new_hotel
group by arrival_date_year, hotel



--joining the other two tables in our datasets (market_segments and meal costs) with the new_hotel table


select * from new_hotel
left join dbo.market_segment$
on new_hotel.market_segment=market_segment$.market_segment
left join dbo.meal_cost$
on new_hotel.meal=meal_cost$.meal

