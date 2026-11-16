-- ORDER STATUS DEFINITIONS:
1:PENDING
2:PROCESSING
3:REJECTED
4:COMPLETED

STORE ID:
	SANTA CRUZ =1
	BALWIND = 2
	ROWLETT = 3
	
------------------------------------------------------------------
-- Amount of orders in Pending in each store
SELECT
	s.store_name,
	COUNT(o.order_status) as AmtOrdersPending
FROM
	orders as o
INNER JOIN
	stores as s
ON
	o.store_id = s.store_id
WHERE
	o.order_status ="1"
GROUP BY
	s.store_name
ORDER BY
	COUNT(o.order_status) desc

	
    -- Amount of orders in Processing in each store
--- WHERE ORDER IS Processing
SELECT
	s.store_name,
	COUNT(o.order_status) as AmtOrdersProcessing
FROM
	orders as o
INNER JOIN
	stores as s
ON
	o.store_id = s.store_id
WHERE
	o.order_status ="2"
GROUP BY
	s.store_name
ORDER BY
	COUNT(o.order_status) desc

    -- Amount of orders in Rejected in each store
--- WHERE ORDER IS Rejected
SELECT
	s.store_name,
	COUNT(o.order_status) as AmtOrdersRejected
FROM
	orders as o
INNER JOIN
	stores as s
ON
	o.store_id = s.store_id
WHERE
	o.order_status ="3"
GROUP BY
	s.store_name
ORDER BY
	COUNT(o.order_status) desc
	
    
-- Amount of orders in Completed in each store
SELECT
	s.store_name,
	COUNT(o.order_status) as AmtOrdersCompleted
FROM
	orders as o
INNER JOIN
	stores as s
ON
	o.store_id = s.store_id
WHERE
	o.order_status ="4"
GROUP BY
	s.store_name
ORDER BY
	COUNT(o.order_status) desc
    ------------------------------------------------------
	-- HOW MANY COMPLETED WERE ORDERS SHIPPED LATE FOR EACH STORE
SELECT
	s.store_name,
   COUNT(*) as LateOrders
FROM
	orders as o
INNER JOIN
	stores as s
ON    	
	o.store_id = s.store_id
WHERE
	o.shipped_date > o.required_date and order_status = "4"
GROUP BY 
	s.store_name
ORDER BY
	COUNT(*) desc
    
-- HOW MANY COMPLETED WERE ORDERS SHIPPED EARLIER THAN REQUIRED FOR EACH STORE
	SELECT
	s.store_name,
   COUNT(*) as LateOrders
FROM
	orders as o
INNER JOIN
	stores as s
ON    	
	o.store_id = s.store_id
WHERE
	o.required_date > o.shipped_date  and order_status = "4"
GROUP BY 
	s.store_name
ORDER BY
	COUNT(*) desc
    
 -- TOP 3 STATES-MOST ORDERS PLACED 
 SELECT                                                     
	c.state,
	COUNT(c.state)                                 
FROM
	orders as o
INNER JOIN
	customers as c
ON
o.customer_id = c.customer_id
	GROUP BY
c.state
ORDER BY
	COUNT(c.state)	desc
LIMIT
	3

-- TOP 3 States- Sales

SELECT 
	st.store_name,
    cus.state,
    ROUND(SUM(oi.quantity * oi.list_price),2) as TotalSales
FROM
	stores as st
INNER JOIN
	orders as ord
ON
	st.store_id = ord.store_id
INNER JOIN
	 order_items as oi
ON
	ord.order_id = oi.order_id
INNER JOIN
	customers as cus
ON
	ord.customer_id = cus.customer_id
WHERE
	ord.order_status ='4'
GROUP BY
	st.store_name,
    cus.state
 ORDER BY
	SUM(oi.quantity * oi.list_price);
--------------------------------------------------------------------
-- TOP 5 ordered bikes in each store( number of times ordered) 
SANTA CRUZ STORE
	
SELECT 
	st.store_name,
    p.product_name,
    COUNT(p.product_name) as AmountTimesOrdered
FROM
	stores as st
INNER JOIN
	orders as ord
ON
	st.store_id = ord.store_id
INNER JOIN
	 order_items as oi
ON
	ord.order_id = oi.order_id
INNER JOIN
	products as p
ON
	p.product_id = oi.product_id
INNER JOIN
	customers as cus
ON
	ord.customer_id = cus.customer_id
WHERE
	ord.order_status ='4' 
    AND
    st.store_id = '1'
GROUP BY
	 st.store_name,
     P.product_name
ORDER BY
	    COUNT(p.product_name) desc
	limit 5

   BALDWIN BIKE STORE
	
    SELECT 
	st.store_name,
    p.product_name,
    COUNT(p.product_name) as AmountTimesOrdered
FROM
	stores as st
INNER JOIN
	orders as ord
ON
	st.store_id = ord.store_id
INNER JOIN
	 order_items as oi
ON
	ord.order_id = oi.order_id
INNER JOIN
	products as p
ON
	p.product_id = oi.product_id
INNER JOIN
	customers as cus
ON
	ord.customer_id = cus.customer_id
WHERE
	ord.order_status ='4' 
    AND
    st.store_id = '2'
GROUP BY
	 st.store_name,
     P.product_name
ORDER BY
	    COUNT(p.product_name) desc
	limit 5
	
 ROWLETT BIKES STORE
 
 SELECT 
	st.store_name,
    p.product_name,
    COUNT(p.product_name) as AmountTimesOrdered
FROM
	stores as st
INNER JOIN
	orders as ord
ON
	st.store_id = ord.store_id
INNER JOIN
	 order_items as oi
ON
	ord.order_id = oi.order_id
INNER JOIN
	products as p
ON
	p.product_id = oi.product_id
INNER JOIN
	customers as cus
ON
	ord.customer_id = cus.customer_id
WHERE
	ord.order_status ='4' 
    AND
    st.store_id = '3'
GROUP BY
	 st.store_name,
     P.product_name
ORDER BY
	    COUNT(p.product_name) desc
	limit 5
    

    
    
    



    
    
    
    
	
 
 
    
     


	




 
 
	

    
	
    


	
	





