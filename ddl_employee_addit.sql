create table if not exists employee (
    id serial primary key,
    name varchar(30) not null
);

create table if not exists department (
    id serial primary key,
    name text not null
);

create table if not exists title (
    id serial primary key,
    name text not null
);

create table if not exists employee_position (
    id serial primary key,
    employee_id integer not null references employee(id),
    department_id integer not null references department(id),
    title_id integer not null references title(id),
    constraint ep_unique unique (employee_id, department_id, title_id)
)
