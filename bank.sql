--1. Вывести сумму всех платежей для счета плательщика с номером 40702810577711111111
--Решение.
  --1.
  Select Sum(amount) as sum_amount
  from payment p 
    join account a on p.payer_account_id = a.id
  where a.account_number = '40702810577711111111'
  --2.
  Select Sum(amount) as sum_amount 
  from payment, account 
  where payment.payer_account_id = account.id 
  and account.account_number = '40702810577711111111'
  
--2. Найти все счета плательщика (account_number), сумма платежа которых превышает 300 рублей
--Решение.
  --1.
 Select account_number
  from account
    join payment on payment.payer_account_id = account.id
    join currency on account.currency_id = currency.id
  where currency.name = 'Рубль'
  group by account_number
  having Sum(amount)>300
 
--3. Найти все рублевые платежи для клиентов (payment.id, client.name, account_number), имя которых начинается c буквы А
--Решение.
  --1.
  Select payment.id, client.name, account.account_number
  from account, payment, client, banki 
  where account.client_id = client.id 
  and account.id = payment.payer_account_id 
  and account.currency_id = currency.id
  and client.name like 'A%'
  and currency.name = 'Рубль'
  
--4. Найти все платежи(payment.id, payment.name, payment.amount), где счет плательщика имеет тип "Расчетный счет"
--Решение.
  --1.
  Select p.id, p.name, p.amount 
  from payment p 
    join account a on a.id = p.payer_account_id 
    join account_type acct on acct.id = a.account_type 
  where acct.name = 'Расчетный счет'
  --2.
  Select p.id, p.name, p.amount 
  from payment p, account a, account_type acct
  where a.id = p.payer_account_id 
  and acct.id = a.account_type 
  and acct.name = 'Расчетный счет'
  
--5. Найти всех клиентов(client.name), счета которых находятся в банке с именем "Веселый банк"
--Решение.
  --1.
  Select c.name 
  from client c, account a, bank b
  where c.id = a.client_id 
  and a.bank_id = b.id 
  and b.name = 'Веселый банк' 
  
