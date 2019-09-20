/*
create table toys (
  toy_id               integer primary key,
  toy_type             varchar2(10),
  quantity_of_stuffing integer
);

insert into toys values ( 1, 'brick', null );
insert into toys values ( 2, 'penguin', 1000 );
commit;
Which of the following queries will return both rows from the table (in any order)? For example:

  TOY_ID TOY_TYPE     QUANTITY_OF_STUFFING
       1 brick
       2 penguin                      1000
*/
create table toys (
  toy_id               integer primary key,
  toy_type             varchar2(10),
  quantity_of_stuffing integer
);

insert into toys values ( 1, 'brick', null );
insert into toys values ( 2, 'penguin', 1000 );
commit;

/* END-SETUP*/

/* START-CHOICE 1 CORRECT */
select * from toys 
where  quantity_of_stuffing is null or 
       quantity_of_stuffing <= 1000;
/* END-CHOICE*/

/* START-CHOICE 2 CORRECT */
select * from toys 
where  nvl ( quantity_of_stuffing, 0 ) <= 1000;
/* END-CHOICE*/

/* START-CHOICE 3 CORRECT */
select * from toys 
where  coalesce ( quantity_of_stuffing, 0 ) <= 1000;
/* END-CHOICE*/

/* START-CHOICE 4 INCORRECT */
select * from toys 
where  value_if_null ( quantity_of_stuffing, 0 ) <= 1000;
/* END-CHOICE*/