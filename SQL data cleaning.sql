-- creating talble called center 

drop table if exists center

select * from center

create table center (
         CustomerID varchar (30),
         First_Name varchar (30),
         Last_Name varchar (30),
         Phone_Number varchar (20),
         Address varchar (40),
         Paying_Customer varchar (10),
         Do_Not_Contact varchar (10),
         Not_Useful_Column varchar (10)  )

-- deleting row based on duplicate value
      delete from center 
       where ctid not in (
            select min (ctid) 
            from center
            group by customerid
                 )


-- deleting colum which is unnecessary 

 alter table center
 drop column not_useful_column 


-- cleaing last_name /removing any special character

UPDATE center 
SET last_name = REGEXP_REPLACE(last_name, '[^a-zA-Z0-9]', '', 'g');

-- cleaning phone_number / removing everything that is not number

update center 
set phone_number = regexp_replace (phone_number,'[^0-9]','','g')

-- fromating phone_number

update center 
set phone_number = regexp_replace (phone_number,'(\d{3})(\d{3})(\d{4})','\1-\2-\3')


-- creating new stree_adress,stat,zip_code column and spliting adress based on (-)

alter table center 
add column street_adress varchar(30),
add column stat varchar (30),
add column zip_code varchar (30);



	UPDATE center
    SET 
    street_adress = SPLIT_PART(address, '-', 1),
    stat = SPLIT_PART(address, '-', 2),
    zip_code = SPLIT_PART(address, '-', 3);


-- replacing "No" with "N" and 'Yes' with 'Y'

UPDATE center
SET paying_customer = REPLACE(paying_customer, 'No', 'N');

UPDATE center
SET paying_customer = REPLACE(paying_customer, 'Yes', 'Y');

UPDATE center
SET do_not_contact = REPLACE(do_not_contact, 'Yes', 'Y');

UPDATE center
SET do_not_contact = REPLACE(do_not_contact, 'No', 'N');






