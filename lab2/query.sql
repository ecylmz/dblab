create index index_client_no on client_master (client_no);

create index index_s_order_no on sales_order (s_order_no);

create index index_sor_p_no on sales_order_details (s_order_no, product_no);

drop index index_sor_p_no;

create view sal_amt_3500_view as select * from salesman_master where sal_amt => 3500;

create view client_view(client_no, name, add1, add2, city, pcode, state, bal_due) as select client_no, name, address1 as add1, address2 as add2, city, pincode as pcode, state, bal_due) from client_master;

select * from client_view where city='Bombay';

drop view client_view;

create view daily_sales_order as select * from sales_order where s_order_date = NOW()::date;

select client_master.name as "Client Name", product_master.description as "Product Description" from sales_order inner join client_master on client_master.client_no = sales_order.client_no inner join sales_order_details on sales_order_details.s_order_no = sales_order.s_order_no inner join product_master on product_master.product_no = sales_order_details.product_no where s_order_date < NOW()::date - 10;
