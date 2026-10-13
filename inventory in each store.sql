--  All Inventory from store 1

SELECT 
	st.store_name,
    p.product_name,
    sk.quantity
FROM 
	stores as st
INNER JOIN
	stocks as sk
ON
	st.store_id = sk.store_id
INNER JOIN 
	products as p
ON
p.product_id = sk.product_id

WHERE
	st.store_id = "1"
GROUP BY
p.product_name, st.store_name, sk.quantity
ORDER BY 
	sk.quantity asc;
    
    
    
    
    -- All Inventory from store 2
    
    SELECT 
	st.store_name,
    p.product_name,
    sk.quantity
FROM 
	stores as st
INNER JOIN
	stocks as sk
ON
	st.store_id = sk.store_id
INNER JOIN 
	products as p
ON
p.product_id = sk.product_id

WHERE
	st.store_id = "2"
GROUP BY
p.product_name, st.store_name, sk.quantity
ORDER BY 
	sk.quantity asc;


-- All inventory from store 3

   SELECT 
	st.store_name,
    p.product_name,
    sk.quantity
FROM 
	stores as st
INNER JOIN
	stocks as sk
ON
	st.store_id = sk.store_id
INNER JOIN 
	products as p
ON
p.product_id = sk.product_id

WHERE
	st.store_id = "3"
GROUP BY
p.product_name, st.store_name, sk.quantity
ORDER BY 
	sk.quantity asc;

