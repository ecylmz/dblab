copy client_master (client_no, name, city, pincode, state, bal_due) from stdin;
0001	Ivan	Bombay	400054	Maharashtra	15000
0002	Vandana	Madras	780001	Tamilnadu	0
0003	Pramada	Bombay	400057	Maharashtra	5000
0004	Basu	Bombay	400056	Maharashtra	0
0005	Ravi	Delhi	100001	null	2000
0006	Rukmini	Bombay	400050	Maharashtra	0
\.

copy product_master (product_no, description, profit_percent, unit_measure, qty_on_hand, reorder_lvl, sell_price, cost_price) from stdin;
P00001	1.44 floppies	5	piece	100	20	525	500
P03453	Monitors	6	piece	10	3	12000	11200
P06734	Mouse	5	piece	20	5	1050	500
P07865	1.22 floppies	5	piece	100	20	525	500
P07868	Keyboards	2	piece	10	3	3150	3050
P07885	CD Drive	2.5	piece	10	3	5250	5100
P07965	540 HDD	4	piece	10	3	8400	8000
P07975	1.44 Drive	5	piece	10	3	1050	1000
P08865	1.22 Drive	5	piece	2	3	1050	1000
\.

copy salesman_master (salesman_no, sal_name, address, city, pincode, state, sal_amt, tgt_to_get, ytd_sales, remarks) from stdin;
S00001	Kiran	A/14 Worli	Bombay	400002	Mah	3000	100	50	Good
S00002	Manish	65,nariman	Bombay	400001	Mah	3000	200	100	Good
S00003	Ravi	P-7 Bandra	Bombay	400032	Mah	3000	200	100	Good
S00004	Ashish	A/5 Juhu	Bombay	400044	Mah	3500	200	150	Good
\.

copy sales_order (s_order_no, s_order_date, client_no, dely_type, billed_yn, salesman_no, dely_date, order_status) from stdin;
019001	12-jan-96	0001	F	N	S00001	20-jan-96	Ip
019002	25-jan-96	0002	P	N	S00002	27-jan-96	C
046865	18-feb-96	0003	F	Y	S00003	20-feb-96	F
019003	03-apr-96	0001	F	Y	S00001	07-apr-96	F
046866	20-may-96	0004	P	N	S00002	22-may-96	C
010008	24-may-96	0005	F	N	S00004	26-may-96	Ip
\.

copy sales_order_details (s_order_no, product_no, qty_order, qty_disp, product_rate) from stdin;
019001	P00001	4	4	525
019001	P07965	2	1	8400
019001	P07885	2	1	5250
019002	P00001	10	0	525
046865	P07868	3	3	3150
046865	P07885	10	10	5250
019003	P00001	4	4	1050
019003	P03453	2	2	1050
046866	P06734	1	1	12000
046866	P07965	1	0	8400
010008	P07975	1	0	1050
010008	P00001	10	5	525
\.
