 select id, name FROM books WHERE books.publisher_id = (select id from publishers where name = 'Pusula Yayıncılık')  order by year;

select publishers.name as publisher, books.name as book_name, books.year FROM books INNER JOIN publishers ON publishers.id = books.publisher_id order by publishers.name, year;

select count(*) as toplamKitap, publishers.name from books inner join publishers on publishers.id = books.publisher_id group by publishers.name;

select publishers.name from publishers, books where (books.year between 2000 and 2002) group by publishers.name having count(*) > 5;

select books.name from books order by books.price desc limit 10;

select publishers.name as publisher from books inner join publishers on publishers.id = books.publisher_id where((books.year between 2000 and  2002)) GROUP by publishers.name;

select publishers.name, count(*) as book_count from books inner join publishers on publishers.id = books.publisher_id where (year > 2013) GROUP by publishers.name;

select name from books where first_author = (select first_author from books group by books.first_author order by count(*) desc limit 1);

select name from books where price > (select avg(price) as price from books);

select students.name from subjects inner join studies on studies.subject_id = subjects.id inner join students on students.id = studies.student_id inner join departments on departments.id = students.department_id WHERE subjects.stitle = 'Veritabanı' and departments.name = 'Bilgisayar Mühendisliği';

select students.name as student, departments.name department from subjects inner join studies on studies.subject_id = subjects.id inner join students on students.id = studies.student_id inner join departments on departments.id = students.department_id inner join buys on buys.student_id = students.id inner join books on books.id = buys.book_id where subjects.stitle = 'Ağlar' and (subjects.stitle = 'Ağlar' and subjects.id = books.subject_id and departments.name != 'Bilgisayar Mühendisliği');

select students.name from students inner join studies on studies.student_id = students.id inner join buys on buys.student_id = students.id inner join books on books.id = buys.book_id where (studies.student_id = buys.student_id);

select books.name from subjects inner join covers on covers.subject_id = subjects.id inner join books on books.id = covers.book_id where (books.name = 'Veritabanı') order by books.id desc limit 1;

select students.name, sum(price) as price from books inner join buys on buys.book_id = books.id inner join students on students.id = buys.student_id group by students.name having sum(price) > 200;

select * from books limit 10 offset 10;
