/* can't run this through python, dot commands are cli-only */

/* Required to use foreign keys */
pragma foreign_keys = ON;

/* init tables */
create table if not exists categories 
       (
	name text primary key
       );

create table if not exists subcategories 
       (
	name   text primary key,
	parent text,
	foreign key(parent) 
	  references categories(name)
	    on update cascade
	    on delete set null
       );

create table if not exists transactions
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

/* Insert data into the tables */
insert into categories
   values("Fixed cost"), ("Food"), ("Item"),
         ("Transport"), ("Activity"), ("Other");

insert into subcategories
   values("Rent", "Fixed cost"),
         ("Electricity", "Fixed cost"), 
         ("Telephone bill", "Fixed cost"), 
         ("Groceries", "Food"),
         ("Takeout", "Food"), 
         ("HelloFresh", "Food"),
         ("Necessity", "Item"),
         ("Gadget", "Item"),
         ("Gift", "Item"),
	 ("Train", "Transport"),
	 ("Bus", "Transport"),
	 ("Car", "Transport"),
         ("Drinks", "Activity"),
         ("Cinema", "Activity");

create table if not exists totals
  (category text, total real);
