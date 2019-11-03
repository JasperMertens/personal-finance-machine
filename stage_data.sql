/* Required to use foreign keys */
pragma foreign_keys = ON;

/* Create staging table */
create table if not exists nw_tx
       (
	id          text, date        text,
	amount      real, currency    text,
       	name        text, account     text,
       	statement   text, category    text,
       	subcategory text, description text,
	primary key(id),
        foreign key(category)
          references categories(name)
	    on update cascade
	    on delete set null,
	foreign key(subcategory)
	  references subcategories(name)
	    on update cascade
	    on delete set null
       );

/* Import the data */
.separator ';'
.import ../Formatted_data/2019/09/Argenta_BE02973118990540_2019-09-27_233911.csv nw_tx

/*.import glob '../Formatted_data/2019/09/*.csv' nw_tx*/

/* Sort the data into categories */
.read categorise.sql
