/* - Exercici 2
Utilitzant JOIN realitzaràs les següents consultes: */

# Llistat dels països que estan fent compres.

Select distinct company.country
from company
left Join transaction
on company.id = transaction.company_id;

#Des de quants països es realitzen les compres.

Select count(distinct company.country)
from company
Join transaction
on company.id = transaction.company_id;


#Identifica la companyia amb la mitjana més gran de vendes.

select company.id, company_name, avg(transaction.amount)
from transaction
join company
on transaction.company_id = company.id
group by transaction.company_id
order by avg(transaction.amount) desc
limit 1;

/* 
- Exercici 3
Utilitzant només subconsultes (sense utilitzar JOIN): */

#Mostra totes les transaccions realitzades per empreses d'Alemanya.
Select * 
from transaction
where company_id in (select id
		from company
		where country = 'germany');
	
#Llista les empreses que han realitzat transaccions per un amount superior a la mitjana de totes les transaccions.

select distinct company_name
from company
where id in (select company_id
            from transaction
            where amount>(select avg(amount) from transaction));
								
#Eliminaran del sistema les empreses que no tenen transaccions registrades, entrega el llistat d'aquestes empreses.
Select * 
from company
where id not in (select company_id
			from transaction);



		
