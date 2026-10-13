-- LISTING BRANDS AND THEIR AFFILIATED PRODUCTS
SELECT
br.brand_name,
pr.product_name
FROM 
	brands as br
INNER JOIN
	products as pr
ON
	br.brand_id = pr.brand_ID
GROUP BY 
	br.brand_name,
	pr.product_name
ORDER BY
	br.brand_name;
    
-- LISTING CATEGORIES AND THEIR AFFILIATED PRODUCTS
SELECT
cat.category_name,
pr.product_name
FROM 
	categories as cat
INNER JOIN
	products as pr
ON
	cat.category_id = pr.category_id
GROUP BY
cat.category_name,
pr.product_name
ORDER BY
	cat.category_name;
    
-- PRODUCTS WITH MOST INVENTORY IN EACH STORE
-- Store 1- Santa Cruz Bikes

    SELECT
		s.store_name,
        p.product_name,
		stk.quantity
    FROM
		stores as s
	INNER JOIN
		Stocks as stk
	ON 
		s.store_id = stk.store_id
    INNER JOIN
		products as p
	ON
		p.product_id = stk.product_id
	WHERE
		s.store_id = "1"
	GROUP BY 
    	s.store_name,
        p.product_name,
		stk.quantity
	ORDER BY
		stk.quantity desc;
		
     -- Store 2- Baldwin Bikes
    SELECT
		s.store_name,
        p.product_name,
		stk.quantity
    FROM
		stores as s
	INNER JOIN
		Stocks as stk
	ON 
		s.store_id = stk.store_id
    INNER JOIN
		products as p
	ON
		p.product_id = stk.product_id
	WHERE
		s.store_id = "2"
	GROUP BY 
    	s.store_name,
        p.product_name,
		stk.quantity
	ORDER BY
		stk.quantity desc;
        
	-- store 3 = Rowlett Bikes
      SELECT
		s.store_name,
        p.product_name,
		stk.quantity
    FROM
		stores as s
	INNER JOIN
		Stocks as stk
	ON 
		s.store_id = stk.store_id
    INNER JOIN
		products as p
	ON
		p.product_id = stk.product_id
	WHERE
		s.store_id = "3"
	GROUP BY 
    	s.store_name,
        p.product_name,
		stk.quantity
	ORDER BY
		stk.quantity desc
		
    
    
    
	
 