
.print ''
.print 'overall profit/loss by month'
/*select strftime('%Y-%m', date),SUM(amount) 
    from ( select date, amount, description from cc_tx
            UNION
            select date, amount, description from nw_tx 
            UNION
            select date, amount, description from fcc_tx )*/
select strftime('%Y-%m', date),SUM(amount) 
    from ( select date, amount, description from nw_tx )
    GROUP BY date(date, 'start of month')
    ORDER BY date(date, 'start of month') DESC;
.print ''

