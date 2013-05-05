create table client_master (
	client_no varchar(6) not null,
	name varchar(20) not null,
	address1 varchar(30),
	address2 varchar(30),
	city varchar(15),
	state varchar(15),
	pincode integer,
	bal_due numeric(10,2),
	CONSTRAINT cm_no_pk PRIMARY KEY(client_no)
);

create table product_master (
	product_no varchar(10) not null,
	description varchar(30) not null,
	profit_percent numeric(6,2) not null,
	unit_measure varchar(10) not null,
	qty_on_hand integer not null,
	reorder_lvl integer not null,
	sell_price integer not null,
	cost_price integer not null,
	CONSTRAINT pm_no_pk PRIMARY KEY(product_no)
);

create table salesman_master (
	salesman_no varchar(6) not null check (salesman_no ~ '^S'),
	sal_name varchar(20) not null,
	address varchar(30) not null,
	city varchar(20),
	state varchar(20),
	pincode integer,
	sal_amt integer not null check (sal_amt > 0),
	tgt_to_get numeric(6,2) not null check (tgt_to_get > 0),
	ytd_sales numeric(6,2) not null check (ytd_sales > 0),
	remarks varchar(30),
	CONSTRAINT sm_no_pk PRIMARY KEY(salesman_no)
);

create table sales_order (
	s_order_no varchar(6) not null check (s_order_no ~ '^0'),
	s_order_date date,
	client_no varchar(25),
	dely_add varchar(6),
	salesman_no varchar(6),
	dely_type char(1) default 'F',
	billed_yn char(1),
	dely_date date check (dely_date > s_order_date),
	order_status varchar(10) check (order_status = ANY(array['Ip', 'F', 'Bo', 'C'])),
	CONSTRAINT so_no_pk PRIMARY KEY(s_order_no),
	CONSTRAINT cm_no_fk FOREIGN KEY(client_no) REFERENCES client_master(client_no),
	CONSTRAINT sm_no_fk FOREIGN KEY(salesman_no) REFERENCES salesman_master(salesman_no)
);

create table sales_order_details (
	s_order_no varchar(6) not null,
	product_no varchar(6) not null,
	qty_order integer,
	qty_disp integer,
	product_rate numeric(10,2),
	CONSTRAINT sor_orpr_pk PRIMARY KEY(s_order_no, product_no),
	CONSTRAINT so_no_fk FOREIGN KEY(s_order_no) REFERENCES sales_order(s_order_no),
	CONSTRAINT pm_no_fk FOREIGN KEY(product_no) REFERENCES product_master(product_no)
);
