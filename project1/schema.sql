DROP TABLE IF EXISTS quotes cascade;
DROP TABLE IF EXISTS authors cascade;
DROP TABLE IF EXISTS tags cascade;
DROP TABLE IF EXISTS tags_quotes;


create table authors (
  id serial primary key,
  name varchar(255),
  photo_url text,
  career_field varchar(255),
  birthyear varchar(255)
);

create table quotes (
  id serial primary key,
  description text,
  name varchar,
  authors_id integer references authors
);


create table tags (
  id serial primary key,
  name varchar(255)

);

create table tags_quotes (
  tags_id integer references tags,
  quotes_id integer references quotes
);
