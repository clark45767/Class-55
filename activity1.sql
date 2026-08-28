create table if not exists restaurant (
    name text,
    neighborhood text,
    cuisine text,
    review real,
    price text,
    health text
);

--insert data
insert into restaurant (name, neighborhood, cuisine, review, price, health)

VALUES
    ('Peter', 'Brooklyn', 'Steak', 4.4, '$$$$', 'A'),
    ('Jongro', 'Midtown', 'Korea', 3.5, '$$', 'A'),
    ('Pocha', 'Midtown', 'Pizza', 4.0, '$$$', 'B'),
    ('Lighthouse', 'Queens', 'Chinise', 3.9, '$', 'A'),
    ('Minca', 'Downtown', 'American', 4.6, '$$$', 'A'),
    ('Marea', 'Chinatown', 'Chinise', 3.0, '$$', ''),
    ('Dirty Candy', 'Uptown', 'Italian', 4.9, '$$$$', 'B'),
    ('Di Fara Pizza', 'Brooklyn', 'Pizza', 3.8, '$$', 'A'),
    ('Golden Unicorn', 'Uptown', 'Italian', 3.8, '$$', 'A');

select * from restaurant;

--1) Distinct neighborhoods
select distinct neighborhood
from Restaurant;

--2) Distinct cuisine types
select distinct cuisine
from restaurant;

--3) Chinese takeout
select *
from restaurant
where cuisine = 'Chinise';

--4) restaurants with reveiws 4 and above
select *
from restaurant
where review >= 4.0;

--5) Italian restaurants with $$ to $$$
select *
from restaurant
where cuisine = 'Italian'
    and price in ('$$', '$$$');

--6) resturants with exatly $$$
select *
from restaurant
where price = '$$$';

--7) restaurant name contains "candy"
select * 
from restaurant
where name like '%Candy%';

--8) restaurant in midtow, downtown, or chinatown
select *
from restaurant
where neighborhood in ('Midtown', 'Downtown', 'Chinatown'
);

--9) health grade pending (empty value)
select *
from restaurant
where health = '' or health is null;

--10) top 4 restaurants based on reviews
select *
from restaurant
order by review DESC
limit 4