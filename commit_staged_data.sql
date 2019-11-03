/* Add the staged data in the nw_tx table to the rest
   of the data in the transactions table.
   Also update the totals table. */

insert into transactions
  select * from nw_tx;

update totals
  select category, sum(amount)
  from transactions
  group by category;
