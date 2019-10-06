/* can't run this through python, dot commands are cli-only */

/* init tables */
create table if not exists nw_tx (id integer, date string,
                    amount integer, balance integer,
	            currency string, name string,
	            account string, statement string,
	            category string, description string);

/* Import the data */
.separator ";"
.mode csv
/* . import ../Formatted_data/2019/09/Argenta_BE02973118990540_2019-09-27_233911.csv nw_tx */

.import glob '../Formatted_data/2019/09/*.csv' nw_tx

/*.read categorise.sql*/

create table if not exists totals (category string, total number);
INSERT INTO totals SELECT category,SUM(amount) FROM nw_tx GROUP BY category;
