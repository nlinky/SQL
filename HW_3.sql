-- 1. Создайте базу из представленной картинки - HW_3.jpg
--      - У каждой таблицы должно быть поле id
--      - id автоинкрементальный и является первичным ключом

--	1.1 Таблица roles:

	create table roles (
		id serial primary key,
		role_title varchar (50) unique not null
	);

--	1.2 Таблица salary:

	create table salary (
		id serial primary key,
		monthly_salary int not null
	);

--	1.3 Таблица roles_salary:

	create table roles_salary (
		id serial primary key,
		id_role int not null,
		id_salary int not null,
		foreign key (id_role)
			references roles (id),
		foreign key (id_salary)
			references salary (id)
	);

--	1.4 Таблица employees:

	create table employees (
		id serial primary key,
		employee_name varchar(50) not null
	);

--	1.5 Таблица employees_roles:

	create table employees_roles (
		id serial primary key,
		id_role int not null,
		id_employee int not null,
		foreign key (id_role)
			references roles (id),
		foreign key (id_employee)
			references employees (id)
	);

--	1.6 Таблица Service:

	create table Service (
		id serial primary key,
		service_title varchar(50) unique not null,
		price int not null
	);

--	1.7 Таблица materials:

	create table materials (
		id serial primary key,
		material_title varchar(50) not null,
		amount int not null,
		price int not null
	);

--	1.8 Таблица claim:

	create table claim (
		id serial primary key,
		service_id int not null,
		employee_id int not null,
		material_id int not null,
		claim_date date not null,
		sales_manager int not null,
		foreign key (service_id)
			references Service (id),
		foreign key (employee_id)
			references employees (id),
		foreign key (material_id)
			references materials (id),
		foreign key (sales_manager)
			references employees (id)
	);

-- 2. Заполните таблицы данными. Не менее 10 строк в каждой таблице.

--	2.1 Заполнение таблицы roles:

	insert into roles (id, role_title) values 
	(default, 'Junior Manual QA engineer'),
	(default, 'Middle Manual QA engineer'),
	(default, 'Senior Manual QA engineer'),
	(default, 'Junior Automation QA engineer'),
	(default, 'Middle Automation QA engineer'),
	(default, 'Senior Automation QA engineer'), 
	(default, 'Junior Java developer'), 
	(default, 'Middle Java developer'), 
	(default, 'Senior Java developer'),
	(default, 'Project Manager');

--	2.2 Заполнение таблицы salary:

	insert into salary (id, monthly_salary) values 
	(default, 1100), 
	(default, 2000), 
	(default, 2300), 
	(default, 1500), 
	(default, 1700),
	(default, 2500), 
	(default, 1500), 
	(default, 2200), 
	(default, 2750), 
	(default, 2600);

--	2.3 Заполнение таблицы roles_salary:

	insert into roles_salary (id, id_role, id_salary) values 
	(default, 2, 1),
	(default, 4, 2),
	(default, 6, 4),
	(default, 8, 6),
	(default, 10, 8),
	(default, 9, 10),
	(default, 7, 3),
	(default, 5, 5),
	(default, 3, 7),
	(default, 1, 9),
	(default, 2, 4), 
	(default, 4, 5), 
	(default, 6, 7), 
	(default, 8, 9), 
	(default, 3, 1);

--	2.4 Заполнение таблицы employees:

	insert into employees (id, employee_name) values 
	(default, 'Nadya'),
	(default, 'Max'),
	(default, 'Andrey'),
	(default, 'Sergey'), 
	(default, 'Yalya'), 
	(default, 'Sveta'), 
	(default, 'Kirill'),
	(default, 'Sonya'), 
	(default, 'Pasha'),
	(default, 'Olga'), 
	(default, 'Roma'), 
	(default, 'Vera'),
	(default, 'Vlad'), 
	(default, 'Anna'),
	(default, 'Masha');

--	2.5 Заполнение таблицы employees_roles:

	insert into employees_roles (id, id_role, id_employee) values 
	(default, 2, 3),
	(default, 4, 5),
	(default, 6, 7),
	(default, 8, 9),
	(default, 10, 11),
	(default, 9, 13),
	(default, 7, 15),
	(default, 5, 14),
	(default, 3, 12),
	(default, 1, 10),
	(default, 2, 8), 
	(default, 4, 6), 
	(default, 6, 4), 
	(default, 8, 2), 
	(default, 3, 1);

--	2.6 Заполнение таблицы Service:

	insert into Service (id, service_title, price) values 
	(default, 'requirements testing', 200),
	(default, 'testing', 250),
	(default, 'drawing up a test plan', 300),
	(default, 'auto tests', 400),
	(default, 'scenario development', 350),
	(default, 'bug reporting', 150),
	(default, 'writing documentation', 390),
	(default, 'writing code', 550),
	(default, 'unit testing', 500),
	(default, 'creating a database', 450);

--	2.7 Заполнение таблицы materials:

	insert into materials (id, material_title, amount, price) values 
	(default, 'paper', 1000, 10),
	(default, 'laptop', 1, 800),
	(default, 'word', 0, 12),
	(default, 'postman', 1,  0),
	(default, 'google', 1, 30),
	(default, 'jira', 1, 60),
	(default, 'pc', 5, 4300),
	(default, 'idea', 5, 550),
	(default, 'postgres', 5, 0),
	(default, 'phone', 3, 1000);

--	2.8 Заполнение таблицы claim:

	insert into claim (id, service_id, employee_id, material_id, claim_date, sales_manager) values 
	(default, 1, 11, 1, '2021-10-21', 2),
	(default, 2, 12, 2, '2021-11-01', 3),
	(default, 3, 13, 3, '2021-10-19', 4),
	(default, 4, 14, 4, '2021-12-01', 5),
	(default, 5, 15, 5, '2021-12-15', 6),
	(default, 6, 2, 6, '2021-12-07', 7),
	(default, 7, 4, 7, '2021-11-30', 8),
	(default, 8, 6, 8, '2022-02-01', 9),
	(default, 9, 8, 9, '2022-01-25', 10),
	(default, 10, 9, 10, '2021-11-25', 11);

-- 3. Добавить таблицу Suppliers с полями id, name.

	create table Suppliers (
		id serial primary key,
		name varchar (50) not null
	);

-- 4. Добавить 10 строк поставщиков в таблицу Suppliers.

	insert into Suppliers (id, name) values 
	(default, 'SvetoCopy'),
	(default, 'Lenovo'),
	(default, 'Microsoft'),
	(default, 'Postman'),
	(default, 'Google'),
	(default, 'Atlassian'),
	(default, 'Intel'),
	(default, 'JetBrains'),
	(default, 'Postgres Professional'),
	(default, 'Xiaomi Redmi');

-- 5. Обновить таблицу Materials. Добавить поле suplier_id которое связано с полем id в таблице Suppliers.

	alter table materials add column suplier_id int;

	alter table materials add foreign key (suplier_id)
		references Suppliers (id);

-- 6. Обновить таблицу Employees. Добавить varchar поле surname на 50 символов.

	alter table employees add column surname varchar (50);

-- 7. Обновить таблицу Salary. Добавить varchar поле currency на 7 символов.

	alter table salary add column currency varchar (7);

---------------------------------------------------------------------------------------
-- Результат - HW_3_diagram.png