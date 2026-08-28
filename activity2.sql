create table if not exists salesman(
    salesman_id text primary key,
    name text, 
    city text, 
    comission text
);
insert into salesman(salesman_id, name, city, comission)
values
    ("5001","James Hong","New York","0.15"),
    ("5002","Nail knite","Paris","0.13"),
    ("5005","Pit Alex","London","0.11"),
    ("5006","Mc Lyon","Paris","0.14"),
    ("5007","Paul Adam","Rome","0.13"),
    ("5003","Lauson Hen","San Jose","0.12");

select * from salesman;

create table if not EXISTS Customer(
    customer_id text,
    cust_name text primary key,
    city text,
    grade text,
    salesman_id text
);
insert into customer(customer_id,cust_name,city,grade,salesman_id)
values
    ("3002","nick rimando","new york","100","5001"),
    ("3007","brad davis","new york","200","5001"),
    ("3005","graham zusi","california","200","5002"),
    ("3008","julian green","london","300","5002"),
    ("3002","fabian johnson","paris","300","5006"),
    ("3009","geoff cameron","berlin","100","5003"),
    ("3003","jozy altidor","moscow","200","5007"),
    ("3001","brand guzan","london","100","5005");

select * from customer;
create table if not exists orders(
    ord_no text primary key, 
    purch_amt text,
    ord_date text,
    customer_id text,
    salesman_id text
);

INSERT INTO Orders(ord_no,purch_amt,ord_date,customer_id,Salesman_id)
VALUES
    ("70001","150.5","2012-10-05","3005","5002"),
    ("70009","270.65","2012-09-10","3001","5001"),
    ("70002","65.26","2012-10-05","3002","5003"),
    ("70004","110.5","2012-08-17","3009","5007"),
    ("70007","948.5","2012-09-10","3005","5005"),
    ("70005","2400.6","2012-07-27","3007","5006");

select * from orders;

select customer.cust_name, salesman.name, salesman.city
from Customer
join salesman on customer.city = salesman.city;

select customer.cust_name as customer_name, salesman.name as salesman_name
from customer
join salesman on customer.salesman_id = salesman.salesman_id;

--fetching
select orders.ord_no, customer.crust_name = orders.customer_id, orders.salesman_id
from orders
join customer on orders.customer_id  = customer.customer_id
join salesman on orders.salesman_id = salesman.salesman_id
where customer.city <> salesman.city;

select orders.ord_no, customer.cust_name
from orders
join customer on orders.customer_id = customer.customer_id;

select customer.cust_name as customer_name,  customer.grade as "grade"
from orders
join salesman on orders.salesman_id = salesman.salesman_id
join customer on orders.customer_id = customer.customer_id
where customer.grade is not null;

--customer with salesma
select customer.cust_name as customer_name,
customer.city as "city",
salesman.name as "salesman",
salesman.comission
from customer
join salesman on customer.salesman_id = salesman.salesman_id
where salesman.comission between 0.12 and 0.14;

-calculation
select orders.ord_no, Customer.cust_name, salesman.comission
as "commission%",
orders.purch_amt * salesman.comission as "comission"
from orders
join salesman on orders.salesman_id = salesman.salesman_id
join customer on orders.customer_id = customer.customer_id
where customer.grade >= 200;


select *
from customer
join orders on customer.customer_id = orders.customer_id
where orders.ord_date = '2012-10-05';