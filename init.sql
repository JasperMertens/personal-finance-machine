/* can't run this through python, dot commands are cli-only */

/* init tables */
create table if not exists nw_tx (id text primary key,
	            date text,
                    amount integer, balance integer,
	            currency text, name text,
	            account text, statement text,
	            category text, description text);

/* Import the data */
.separator ';'
.import ../Formatted_data/2019/09/Argenta_BE02973118990540_2019-09-30_004212.csv nw_tx

/*.import glob '../Formatted_data/2019/09/*.csv' nw_tx*/

/*.read categorise.sql*/

create table if not exists totals (category string, total number);
INSERT INTO totals SELECT category,SUM(amount) FROM nw_tx GROUP BY category;
