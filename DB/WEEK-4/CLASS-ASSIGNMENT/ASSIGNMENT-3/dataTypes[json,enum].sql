-- Special data types in mysql --------------------------------------------------------
-- ENUM
-- BOOLEAN
-- JSON

-- create table table_name(
--     col ENUM ('value1', 'value2', 'value3')
-- )

create database today;
use today; 

create table tickets(
    id INT primary key auto_increment,
    title varchar(100) NOT NULL,
    priority ENUM('Low', 'Medium', 'High') NOT NULL
);

insert into tickets(title, priority)
values
('scan for viruses','Medium'),
('scan for boot','High'),
('create a new user','High'),
('upgrade windows for 11 version','Low'),
('install new game','Low');

alter table tickets
add completed BOOLEAN after priority;

update tickets
set completed = 0 where id = 5;

// type: JSON
create table events(
    id int auto_increment primary key,
    name varchar(50),
    visitor varchar(10),
    properties JSON,
    browser JSON
);

insert into events(name, visitor, properties, browser)
values
(
    'pageview',
    '1',
    '{ "page": "/" }',
    '{ "name": "Safari", "os": "Mac", "resolution": {"x": 1920, "y": 1080} }'
),
(
    'pageview',
    '2',
    '{ "page": "/contact" }',
    '{ "name": "Firefox", "os": "Windows", "resolution": {"x": 2560, "y": 16000} }'
),
(
    'pageview',
    '1',
    '{ "page": "/products" }',
    '{ "name": "Safari", "os": "Mac", "resolution": {"x": 1920, "y": 1080} }'
),
(
    'purchase',
    '4',
    '{ "amount": 150 }',
    '{ "name": "Firefox", "os": "Windows", "resolution": {"x": 1280, "y": 800} }'
),
(
    'purchase',
    '4',
    '{ "amount": 500 }',
    '{ "name": "Chrome", "os": "Windows", "resolution": {"x": 1680, "y": 1050} }'
);

-- To pull values out of the JSON columns, you use the column path operator ( ->).
select id, browser ->> '$.name' as browser
from events;

-- To get the browser usage, you can use the following statement:
select browser ->> '$.name' as browser, count(browser)
from events
group by browser ->> '$.name' ;

-- To calculate the total revenue by the visitor, you use the following query:
SELECT visitor, SUM(properties ->> '$.amount') revenue
FROM events
WHERE properties ->> '$.amount' > 0
GROUP BY visitor;