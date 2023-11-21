-- using invoicing database
use invoicing;
-- which clients havent made payment for their goods
select c.client_id, c.name, payment_date, invoice_id
from clients c
join invoices i
on i.client_id = c.client_id
where payment_date IS NULL;

-- what payment method was used to pay in the month of Feburary
select c.client_id, c.name, pm.name, i.payment_date
from clients c
join payments p 
on p.client_id = c.client_id
join invoices i 
on i.invoice_id = p.invoice_id
join payment_methods pm
on pm.payment_method_id = p.payment_method
where i.payment_date like '____-02-__';


-- whats is the due date of payment in month of July and which clients have it
select c.client_id, c.name, i.payment_total, i.due_date
from clients c
join invoices i
on c.client_id = i.client_id
where due_date like '%-07-%';
-- which clients havent purchase goods from the company
select *
from clients c 
left join payments p
on c.client_id = p.client_id
where p.client_id is null;
