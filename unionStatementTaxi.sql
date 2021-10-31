


--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                                                 -- Create a TEMP table--
-- I created a temp temble and I also combined the tables from 2017-2020 
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

   DROP TABLE IF EXISTS #TempTaxi
   CREATE TABLE #TempTaxi(
         
         [lpep_pickup_datetime] datetime,
		 [lpep_dropoff_datetime] datetime,

		 [pickup_time] time (0),
        [dropoff_time] time (0),
		 [pu_date] date,
		 [do_date] date,
		 [MONTH] varchar (50),
		 [dayofWeek] varchar (50),
		 [Year] int,
	     [store_and_fwd_flag] varchar (5),
		 [RatecodeID] int,
		 [PULocationID] int,
         [DOLocationID] int,
		 [passenger_count] int,
         [trip_distance] float ,
         [fare_amount] float ,
		 [extra] float ,
		 [mta_tax] float ,
         [tip_amount] float ,
         [tolls_amount] float ,
         [improvement_surcharge] float,
         [total_amount] float ,
         [payment_type] int,
         [trip_type] int,
		 [LocationID] varchar (50),
		 [Borough] varchar (50),
		 [Zone] varchar (50),
		 [service_zone] varchar (50),
		 [LocationIDD] varchar (50),
		 [Boroughh] varchar (50),
		 [Zonee] varchar (50),
		 [service_zonee] varchar (50),
         
  )



  INSERT INTO #TempTaxi 
  select *
FROM
   
(SELECT		DISTINCT

     --  [lpep_pickup_datetime],
    --  [lpep_dropoff_datetime],
	case
	when  [lpep_pickup_datetime] < [lpep_dropoff_datetime] then [lpep_pickup_datetime]
	else  [lpep_dropoff_datetime] end  as [lpep_pickup_datetime],
case
	when  [lpep_dropoff_datetime] > [lpep_pickup_datetime] then [lpep_dropoff_datetime]
	else  [lpep_pickup_datetime] end  as [lpep_dropoff_datetime],

  cast(
    
		   case
		   when    
		lpep_pickup_datetime   <  [lpep_dropoff_datetime] then [lpep_pickup_datetime]
		   else [lpep_dropoff_datetime]
		   end   as time(0)
  ) [pickup_time], 
  cast(
    case
		   when [lpep_dropoff_datetime] > [lpep_pickup_datetime] then [lpep_dropoff_datetime]
		   else [lpep_pickup_datetime]
		   end  as time(0)
  ) [dropoff_time],  
  CAST([lpep_pickup_datetime] AS date ) [pu_date], 
   CAST([lpep_dropoff_datetime] AS date ) [do_date],
  DATENAME(MONTH, [lpep_dropoff_datetime]) [MONTH], 
  DATENAME(
    WEEKDAY, [lpep_dropoff_datetime]
  ) [dayofWeek], 
  YEAR([lpep_pickup_datetime]) [Year], 
  
 [store_and_fwd_flag]= Replace([store_and_fwd_flag],'"', ''), 
  [RatecodeID], 
  [PULocationID], 
  [DOLocationID], 
  [passenger_count] ,
 ABS( cast([trip_distance] as decimal( 10,2)))  [trip_distance], 
 ABS( cast([fare_amount] as decimal( 10,2))) [fare_amount], 
  ABS([extra])[extra], 
  ABS([mta_tax])[mta_tax], 
  ABS([tip_amount])[tip_amount], 
  ABS([tolls_amount])[tolls_amount], 
  ABS([improvement_surcharge]) [improvement_surcharge], 
  ABS([total_amount])[total_amount],
  [payment_type], 
  [trip_type]

  FROM [NYCTaxi].[dbo].[2017_taxi_trips]

  UNION
  SELECT  DISTINCT
 -- [lpep_pickup_datetime],
   --   [lpep_dropoff_datetime],
   case
	when  [lpep_pickup_datetime] < [lpep_dropoff_datetime] then [lpep_pickup_datetime]
	else  [lpep_dropoff_datetime] end  as [lpep_pickup_datetime],
case
	when  [lpep_dropoff_datetime] > [lpep_pickup_datetime] then [lpep_dropoff_datetime]
	else  [lpep_pickup_datetime] end  as [lpep_dropoff_datetime],
  

  cast(
    
		   case
		   when    
		lpep_pickup_datetime   <  [lpep_dropoff_datetime] then [lpep_pickup_datetime]
		   else [lpep_dropoff_datetime]
		   end   as time(0)
  ) [pickup_time], 
  cast(
    case
		   when [lpep_dropoff_datetime] > [lpep_pickup_datetime] then [lpep_dropoff_datetime]
		   else [lpep_pickup_datetime]
		   end  as time(0)
  ) [dropoff_time], 
 CAST([lpep_pickup_datetime] AS date ) [pu_date], 
   CAST([lpep_dropoff_datetime] AS date ) [do_date],
  DATENAME(MONTH, [lpep_dropoff_datetime]) [MONTH], 
  DATENAME(
    WEEKDAY, [lpep_dropoff_datetime]
  ) [dayofWeek], 
  YEAR([lpep_pickup_datetime]) [Year], 
  
  [store_and_fwd_flag]= Replace([store_and_fwd_flag],'"', ''), 
  [RatecodeID], 
  [PULocationID], 
  [DOLocationID], 
  [passenger_count],
  ABS( cast([trip_distance] as decimal( 10,2)))  [trip_distance], 
 ABS( cast([fare_amount] as decimal( 10,2))) [fare_amount], 
  ABS([extra])[extra], 
  ABS([mta_tax])[mta_tax], 
  ABS([tip_amount])[tip_amount], 
  ABS([tolls_amount])[tolls_amount], 
  ABS([improvement_surcharge]) [improvement_surcharge], 
  ABS([total_amount])[total_amount],
  [payment_type], 
  [trip_type]

  FROM [NYCTaxi].[dbo].[2018_taxi_trips]

  UNION
   SELECT DISTINCT
  
  --[lpep_pickup_datetime],
      --[lpep_dropoff_datetime],

	  case
	when  [lpep_pickup_datetime] < [lpep_dropoff_datetime] then [lpep_pickup_datetime]
	else  [lpep_dropoff_datetime] end  as [lpep_pickup_datetime],
case
	when  [lpep_dropoff_datetime] > [lpep_pickup_datetime] then [lpep_dropoff_datetime]
	else  [lpep_pickup_datetime] end  as [lpep_dropoff_datetime],
  cast(
    
		   case
		   when    
		lpep_pickup_datetime   > [lpep_dropoff_datetime] then [lpep_pickup_datetime]
		   else [lpep_dropoff_datetime]
		   end   as time(0)
  ) [pickup_time], 
  cast(
    case
		   when [lpep_dropoff_datetime] > [lpep_pickup_datetime] then [lpep_dropoff_datetime]
		   else [lpep_pickup_datetime]
		   end  as time(0)
  ) [dropoff_time], 
 CAST([lpep_pickup_datetime] AS date ) [pu_date], 
   CAST([lpep_dropoff_datetime] AS date ) [do_date],
  DATENAME(MONTH, [lpep_dropoff_datetime]) [MONTH], 
  DATENAME(
    WEEKDAY, [lpep_dropoff_datetime]
  ) [dayofWeek], 
  YEAR([lpep_pickup_datetime]) [Year], 
   
  [store_and_fwd_flag]= Replace([store_and_fwd_flag],'"', ''), 
  [RatecodeID], 
  [PULocationID], 
  [DOLocationID], 
  [passenger_count],
 ABS( cast([trip_distance] as decimal( 10,2)))  [trip_distance], 
 ABS( cast([fare_amount] as decimal( 10,2))) [fare_amount], 
  ABS([extra])[extra], 
  ABS([mta_tax])[mta_tax], 
  ABS([tip_amount])[tip_amount], 
  ABS([tolls_amount])[tolls_amount], 
  ABS([improvement_surcharge]) [improvement_surcharge], 
  ABS([total_amount])[total_amount],
  [payment_type], 
  [trip_type]

  FROM [NYCTaxi].[dbo].[2019_taxi_trips]

  UNION
   SELECT DISTINCT
  
  --[lpep_pickup_datetime],
     -- [lpep_dropoff_datetime],
case
	when  [lpep_pickup_datetime] < [lpep_dropoff_datetime] then [lpep_pickup_datetime]
	else  [lpep_dropoff_datetime] end  as [lpep_pickup_datetime],
case
	when  [lpep_dropoff_datetime] > [lpep_pickup_datetime] then [lpep_dropoff_datetime]
	else  [lpep_pickup_datetime] end  as [lpep_dropoff_datetime],


 cast(
    
		   case
		   when    
		lpep_pickup_datetime   <  [lpep_dropoff_datetime] then [lpep_pickup_datetime]
		   else [lpep_dropoff_datetime]
		   end   as time(0)
  ) [pickup_time], 
  cast(
    case
		   when [lpep_dropoff_datetime] > [lpep_pickup_datetime] then [lpep_dropoff_datetime]
		   else [lpep_pickup_datetime]
		   end  as time(0)
  ) [dropoff_time], 
 CAST([lpep_pickup_datetime] AS date ) [pu_date], 
   CAST([lpep_dropoff_datetime] AS date ) [do_date],
  DATENAME(MONTH, [lpep_dropoff_datetime]) [MONTH], 
  DATENAME(
    WEEKDAY, [lpep_dropoff_datetime]
  ) [dayofWeek], 
  YEAR([lpep_pickup_datetime]) [Year], 
  
  [store_and_fwd_flag]= Replace([store_and_fwd_flag],'"', ''), 
  [RatecodeID], 
  [PULocationID], 
  [DOLocationID], 
  [passenger_count],
  ABS( cast([trip_distance] as decimal( 10,2)))  [trip_distance], 
 ABS( cast([fare_amount] as decimal( 10,2))) [fare_amount], 
  ABS([extra])[extra], 
  ABS([mta_tax])[mta_tax], 
  ABS([tip_amount])[tip_amount], 
  ABS([tolls_amount])[tolls_amount], 
  ABS([improvement_surcharge]) [improvement_surcharge], 
  ABS([total_amount])[total_amount],
  [payment_type], 
  [trip_type]  

  FROM [NYCTaxi].[dbo].[2020_taxi_trips]
  ) AS t4
  LEFT JOIN   [NYCTaxi].[dbo].[taxi_zones] zon ON t4.[PULocationID] = zon.[LocationID]
  LEFT JOIN [NYCTaxi].[dbo].[taxi_zones] zo ON t4.[DOLocationID] = zo.[LocationID]
  
  
 WHERE 
 YEAR(t4.[lpep_pickup_datetime]) >= 2017 OR  YEAR(t4.[lpep_pickup_datetime]) <= 2020
  and
  t4.[store_and_fwd_flag] = 'N' OR  t4.[store_and_fwd_flag] != ''
  AND t4.trip_type = 1
  AND t4.RatecodeID = 1
  AND  t4.[payment_type] = 1 or t4.[payment_type] = 2
  AND [fare_amount]=	
(Case  
WHEN t4.[fare_amount]= 0 and t4.[trip_distance]!= 0 then 2.5 + (t4.[fare_amount] * 2.5)
ELSE t4.[fare_amount] END
)
and 
t4.[fare_amount] = 
(Case  
WHEN t4.[trip_distance]= 0 and  t4.[fare_amount]!= 0 then  (t4.[fare_amount] - 2.5)/ 2.5
ELSE t4.[fare_amount] END)
 AND
 CAST(t4.[lpep_pickup_datetime] AS date ) = CAST(t4.[lpep_dropoff_datetime] AS date ) AND cast(
    
		   case
		   when    
		t4.lpep_pickup_datetime   <  t4.[lpep_dropoff_datetime] then t4.[lpep_pickup_datetime]
		   else t4.[lpep_dropoff_datetime]
		   end   as time(0)
  )!= cast(
    case
		   when t4.[lpep_dropoff_datetime] > t4.[lpep_pickup_datetime] then t4.[lpep_dropoff_datetime]
		   else t4.[lpep_pickup_datetime]
		   end  as time(0)
  )
  AND
  (t4.[fare_amount]!= 0
		   or t4.[trip_distance] != 0)
		       
  

 
  

 --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
--**************************************************************************************************
  -- To alter the Temp table and adding new columns and also modifying existing columns-----
  --****************************************************************************************************
 
 --1.
 ALTER TABLE  #TempTaxi
ADD [Duration] time (0)

UPDATE #TempTaxi
SET [Duration] = cast(dateadd(second,
                    DATEDIFF(SECOND,[pickup_time],[dropoff_time]),
                    0) as time (0) )
--2
ALTER TABLE  #TempTaxi
ADD [Borough] varchar (20)


UPDATE #TempTaxi
SET [Borough]= Replace([Borough],'"', '') 

                  
--3
ALTER TABLE  #TempTaxi
ADD [Zone] varchar (50)


UPDATE #TempTaxi
SET [Zone]= Replace([Zone],'"', '')

--4
ALTER TABLE  #TempTaxi
ADD [Zone] varchar (50)
 
 UPDATE #TempTaxi
SET [Zonee]= Replace([Zonee],'"', '')
UPDATE #TempTaxi
SET [Zone]= Replace([Zone],'"', '')



----drop columns in tables------

ALTER TABLE #TempTaxi DROP COLUMN [service_zone]
ALTER TABLE #TempTaxi DROP COLUMN [service_zonee]
ALTER TABLE #TempTaxi DROP COLUMN [Borough]
ALTER TABLE #TempTaxi DROP COLUMN [Boroughh]
ALTER TABLE #TempTaxi DROP COLUMN [LocationID]
ALTER TABLE #TempTaxi DROP COLUMN [LocationIDD]

--**************************************************************************************************
  -- apply futher filter process to the temp table created----
  --****************************************************************************************************

SELECT * FROM #TempTaxi
		  where 
		  [Year] >= 2017 AND  [Year] <= 2020
		  AND
		 --([fare_amount]!= 0
		 -- and  trip_distance != 0)
		-- AND
		   [RatecodeID]= 1
		   AND Zone != 'N/A'

		-- and
	--pickup_time > dropoff_time
		  -- and 
		--(lpep_pickup_datetime < lpep_dropoff_datetime)
		AND 
	    pu_date=do_date AND pickup_time!=dropoff_time
		AND
		
		--[Duration] > '03:59:00'  and [Duration] < '23:59:59'
[fare_amount]=	
(Case  
WHEN [fare_amount]= 0 and [trip_distance]!= 0 then 2.5 + ([fare_amount] * 2.5)
ELSE [fare_amount] END
)
AND 
[fare_amount] = 
(Case  
WHEN [trip_distance]= 0 and  [fare_amount]!= 0 then  ([fare_amount] - 2.5)/ 2.5
ELSE [fare_amount] END)
order by [Year]