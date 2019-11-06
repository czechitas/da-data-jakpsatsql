use czechita;
create schema zzoo;

create table zzo_table (
  id int,
  full_name varchar(255),
  email varchar(255),
  gender varchar(50),
  birth_date varchar(20),
  address varchar(255),
  city varchar(255),
  country varchar(255),
  postal_code varchar(255)
);

//truncate table zzo_table;
//alter table zzo_table
//drop column birth_date2, birth_date3;

//Úprava dat:

// 1/ Najděte řádky, kde není vyplněné jméno, nebo datum narození a ty vymažte.
-- kouknout se na data / pocet radku
select * from zzo_table limit 100;
select count(*) from zzo_table;

-- kouknout se na to, co chci vymazat
select * from zzo_table where full_name is null or full_name = '';

-- vymazat - tady bylo mozna dobre si vytvorit kopii puvodni tabulky, abychom se meli pripadne k cemu rychle vratit (a nechteli cestovat v case)

-- optional:
create or replace temporary table zzo_table_c as 
select * from zzo_table;

delete from zzo_table_c where full_name is null or full_name = '' or birth_date is null or birth_date = '';

-- podivat se, jak to vypada = pocet radku, tabulka (obcas nam nedojde, co nase zmeny muzou zpusobit - je dobre mit nad daty kontrolu, alespon letmou)
select * from zzo_table_c limit 100;
select count(*) from zzo_table_c;

// 2/ V poli Birth Date odstraňte přebytečné mezery a vytvořte sloupec s datovým typem Date.( NÁPOVĚDA: REPLACE)
-- zase zkontrolovat data - co vlastne chci delat, pouzivat limit (bude se hodit u velkych tabulek, setrite pocitace snowflaku)
select * from zzo_table_c limit 100;

-- da se to udelat vice zpusoby

-- a: natvrdo zmenime
update zzo_table_c set birth_date = replace(birth_date, ' ', '');

alter table zzo_table_c
add column birth_date_add date;
update zzo_table_c set birth_date_add = to_date(birth_date, 'DD.MM.YYYY');

-- datovy type se da zkontrolovat napriklad prikazem show columns:
show columns in table zzo_table_c;

-- b: vytvorime novy sloupecek //
create or replace temporary table zzo_table_c2 as
select *, replace(birth_date, ' ', '') as birth_date2, to_date(birth_date, 'DD. MM. YYYY') as birth_date_select 
from zzo_table_c;

-- opet kontrola
show columns in table zzo_table_c2;

// 3/ Vytvořte dva nové sloupce Name and Surname a vložte do nich rozdělená data z pole Full name.

select * From zzo_table_c2 limit 100;

-- podivat se na samotny length
create or replace temporary table zzo_table_c3 as
select split_part(full_name, ' ',1) as first_name, 
//       length(first_name), 
       substring(full_name, length(first_name)+2) as last_name, * 
From zzo_table_c2;

-- tady pozor na jednu vec - chceme mit dva sloupecky, predpokladame dve slova (jmeno prijmeni) - to ale v realite nemusi vubec tak byt => zamyslet se nad tim, co mame za data (napr. z kterych zemi)
-- da se to delat i jinak:

create or replace temporary table arrays as
select ('prvni druhy treti ctvrty paty sesty sedmy') as test;

-- array_slice(array, od, do ale ne vcetne), indexy jdou od 0 - podobne pythonu
select split(test, ' ') as split, 
       array_to_string(split, ' -> ') as back_to_string, --- muzeme si nastavit delitel
       array_slice(split, 1, 5) as vyber_z_array, -- podobne pythonu [1:5] -> musime nastavit OD - DO (do - neni vcetne => nastavit o jednu vic, nez posledni prvek ve vyberu, ale indexovani JDE OD NULY ! => 1 az 5 da DRUHY az PATY prvek
       array_to_string(array_slice(split, -1, array_size(split)+1), ' ') as posledni, -- s minusem zacina pocitani od posledniho k prvnimu, ale nemeni se smer od-do v argumentech funkce ! => -1 znamena v nasem pripade 8, DO musi byt cislo vetsi nez posledni prvek => proto musime spocitat pocet prvku a pridat jednicku
       array_to_string(array_slice(split, 0, array_size(split)-1), ' ') as vse_predtim, -- zaciname od nuly = prvni prvek, koncime u predposledniho - odecitame jednicku, protoze index zacina na nule
       array_to_string(array_slice(split, -2, array_size(split)+1), ' ') as posledni_dva, -- je dobre vyzkouset si menit cisla a koukat, co to vraci
       array_to_string(array_slice(split, 0, array_size(split)-2), ' ') as vse_pred_poslednimi_dvema
from arrays;

-- jak by to vypadalo u jmen
//create or replace temporary table zzo_tablex as
select split(full_name, ' ') as "name_array",  
       array_to_string(array_slice("name_array", 0, array_size("name_array")-1), ' ') as first_name,
       array_to_string(array_slice("name_array", -1, array_size("name_array")+1), ' ') as last_name,
       *
from zzo_table_c3;

// nebo update ....

// 4/ Pole Name a Surname upravte tak, aby první písmeno bylo vždy velké (nápověda funkce UPPER,SUBSTRING).

select upper(substring('konicek', 1, 1)) as prvni_pismeno, substring('konicek', 2) as zbytek, upper(substring('konicek', 1, 1)) || substring('konicek', 2) as dohromady;

create or replace temporary table zzo_table_c4 as
select upper(substring(last_name, 1, 1)) || substring(last_name, 2) as last_name_upper,
       upper(substring(first_name, 1, 1)) || substring(first_name, 2) as first_name_upper,
       *
from zzo_table_c3;

-- uz tam mam hodne sloupcu, tak dam pryc ty, co nepotrebuju pri transformaci


//Vypište počet klientů dle věkových kategorií (1-10,10-20,20-30,více než 30) žijících v Číně.

-- vytvorim si promennou vek z data narozeni, dalsi promennou s kategoriemi
create or replace temporary table zzo_table_c5 as
select id, first_name_upper as first_name, last_name_upper as last_name, email, gender, birth_date_add as birth_date, address, city, country, postal_code,
       datediff(year, birth_date_add, current_date()) as age, 
       case when age between 1 and 10 then '1-10'
            when age between 11 and 20 then '11-20' -- v zadani byl trochu chytak - intervaly se prekryvaly, between je interval vcetne - upper i lower bound, v matematice <x,y>
            when age between 21 and 30 then '21-30'
            when age > 30 then '>30' -- pozor keboola transformace neni tak ohebna jako snowflake sandbox - takovyto nazev by neprosel v transformaci (neumi ulozit tabulku), stejne tak tam nejde dat znak %
       else 'whaa' -- dobre pro kontrolu - obcas vam neco unikne a tohle vas na to upozorni, pokud jste si jisti (nebo nechcete, aby nekdo videl vasi chybu :D -> else '>30')
       end as age_cat
from zzo_table_c4;

select distinct country from zzo_table_c order by country;

select age_cat, count(distinct id) as lidi 
from zzo_table_c5 
where country = 'China' 
group by 1 -- misto nazvu sloupcu se da pouzit poradi (od 1), hodi se obzvlast u velkych group by statementu s velkym mnozstvim sloupcu, ale snizuje to citelnost
//order by 2 desc
;

select * from zzo_table_c5 LIMIT 100;

-- adela reseni
select SUBSTRING(full_name, 1, CHARINDEX(' ', full_name) - 1) from zzo_table_C;
select SUBSTRING(full_name, CHARINDEX(' ', full_name) + 1) from zzo_table_C;

//A) vytvorte tabulku evropa_teror_po_letech ve schematu s vasim prijmenim. Tabulka bude obsahovat sloupecky zeme, rok, mesic, typ_zbrane, mrtvych_obeti, mrtvych_teroristu, pocet_utoku, obeti_u_nejvetsiho_utoku, nejvic_mrtvych teroristu a v kazdem radku bude souhrn pro zemi, rok, mesic a weaptype1. Tabulku i sloupecky v ni nazvete malymi pismeny.
//B) vytvorte prazdnou tabulku ve svem schematu, pojmenujte ji libovolne a pouzijte v ni vsechny datove typy, ktere znate.
//C) k cemu slouzi tabulky czechita.information_schema.tables a czechita.information_schema.columns

-- ukol hana
create or replace temporary table "evropa_teror_po_letech" as
(select 
country_txt "zeme",
iyear "rok",
imonth "mesic",
weaptype1_txt "typ_zbrane",
sum(nkill) "mrtvych_obeti",
sum(nkillter) "mrtvych_teroristu",
count(*) "pocet_utoku",
max(nkill) "obeti_u_nejvetsiho_utoku",
max(nkillter) "nejvic_mrtvych_teroristu"
from "CZECHITA"."PUBLIC"."TEROR"
group by "zeme", "rok", "mesic", "typ_zbrane");

select * from czechita.information_schema.tables;
select * from czechita.information_schema.columns;


select * from "evropa_teror_po_letech";
---- JOINIKY

-- caste use casy: 

-- 1. ciselnik => country id, user id, category id, genre id, weapon type id
-- = ciselny kod pro string (napr. jmeno zeme) - pouziva se pro setreni mista v databazi a zrychluje to procesy (cislo se selectuje rychleji nez string)

select * From teror; -- region + region_text / country + country_txt

select t1.eventdate, t1.nkill, t2.name, t2.countrytype
from teror2 t1
left join country t2 -- inner join bychom pouzili v pripade, ze chceme pouze ty radky, kde je vyplneny kod zeme, takto by tam zustaly NULL hodnoty v radcich, kde zeme vyplnena neni
on t1.country = t2.id
;

-- 2. doplneni extra informace k jednotkam => mame napriklad tabulku uzivatelu a tabulku aktivity uzivatelu (napr. nakupy na webu, vypujcene knizky atp.), chci vedet, kolik celkem aktivity vygenerovali - mame zaklad vsech uzivatelu (=registrace) a aktivity (=nakup) -> kdyz tyto dve tabulky najoinujeme, tak ze dozvime, kdo se zaregistroval a nic nekoupil (najdeme ke kazdemu uzivateli jeho nakupy a prilepime tyto nakupy na tabulku registraci - pokud ma vic nakupu, radky registraci se znasobi o pocet radku v nakupech!)

-- z dat z ukolu si muzeme vytvorit ukazku - nejdrive si vytvorime kopii ciste tabulky (finalni tabulky z ukolu) - tento krok delam proto, abych si byla jista, ze puvodni data zustanou nezmenena -> toto budou nase registrace
create temporary table registrations as
select *
from zzo_table_c5;

-- nyni si vytvorim podmnozinu tabulky - budu predstirat, ze cast z nich si koupila kozich za $99 - podmnozinu vyberu pro ukazku tak, ze si vyberu lidi mezi 20 a 25 lety, ti by si mohli uzit kozich za $99, zejo -> v realu byste tohle nevytvareli, tohle by uz byla nasbirana data o nakupech
create temporary table kozich_purchases as
select id as user_id, 99 as price, 'kozich' as product
from zzo_table_c5
where age between 20 and 25;

-- podivame se, co je v datech (kolik je tam radek, jestli jsou vyplnene vsechny hodnoty, jak maji)
select * From kozich_purchases;

-- k registracim najoinujeme nakupy - registrace jsou nalevo, takze v nich zustanou VSECHNY zaznamy, z kozich_purchases se do tabulky vpisi ty, ktere najdou kamarada v id registrovaneho (i v realu by tam meli byt opravdu vsichni - pokud je registrace nutna k nakupu)
-- podivame se na par radku, nektere maji null hodnoty, nektere maji kozich hodnoty
select * 
from registrations t1
left join kozich_purchases t2
on t1.id = t2.user_id;

-- nyni nas zajima, jake procento lidi si koupilo kozich (muzeme se ptat i kolik produktu si koupili, kdybychom meli i dalsi produkty, tak bychom se mohli podivat na konkretni produkty atp.) - tady si ale jednoduse spocitame pocet registrovanych (pozor, MUSI BYT DISTINCT - pokud by si jeden registrovany koupil vice produktu, byl by tam vicekrat), dale spocitame pocet produktu - tady by kazdy produkt mel byt jen jednou (v puvodni tabulce je registrovany take reprezentovany jen jednou, proto se vysledky z kozichu nenasobi), proto staci, kdyz dame count(product) - predpokladame vyplnene null hodnoty tam, kde nakup nebyl a null hodnoty count preskakuje (null tam byt musi, protoze tak funguje left join), dale nas zajima, jake je procento, takze si vypocitame pocet nakupu/pocet lidi a mame to jako %
-- dokazali byste nyni z cisla zapsaneho jako desetinne cislo udelat string se znakem procenta?
select count(distinct t1.id) as registrations, count(product) as purchases, purchases/registrations as "%"
from registrations t1
left join kozich_purchases t2
on t1.id = t2.user_id;


-- 3. join tabulky na sebe samu - casto potrebujeme dat vedle sebe (do radky) informace jen z JEDNE tabulky - napriklad, kdyz pocitame procenta (podobne jako v predchozim prikladu - akorat tady nemame dve tabulky, pouze jednu, ze ktere vlastne vytvorime dve (da se resit ruznymi zpusoby - CTE / temporary / subquery)
-- pouzijeme data z pavlova ukolu

-- vypocitame si pocet obeti za jednotlive roky
create or replace temporary table "evropa_teror_po_letech_mrtvi_rocni_total" as
select "rok", 
       sum("mrtvych_obeti") as "mrtve_obeti_dany_rok" 
from "evropa_teror_po_letech"
group by 1;

select * from "evropa_teror_po_letech_mrtvi_rocni_total";

-- nyni najoinujeme na tabulku vytvorenou v ukolu (vypocitane reseni je vyse) - chceme ke kazdemu zaznamu z tabulky z ukolu pridat i total za rok - jelikoz je chceme najoinovat pouze na dane roky, musime joinovat na zaklade teto promenne -> on t1."rok"=t2."rok" - ja pouzivam misto zkracenin nazvu t1, t2, t3 (jako tabulka 1, tabulka 2, tabulka 3) atd. - je to ale stale jen a pouze alias a muzete si tam napsat treba princeznaConsuelaBannanaHamock jako alias, je to jedno
select *, "mrtvych_obeti"/"mrtve_obeti_dany_rok" as "%" -- jak dat do procent?
from "evropa_teror_po_letech" t1
left join "evropa_teror_po_letech_mrtvi_rocni_total" t2
on t1."rok"=t2."rok"
order by t1."rok", "%" desc
;

--> zkuste sami zjistit, jak si na tom procentualne stoji zeme bez ohledu na rok / typ zbrane atd.

-- 1. vytvorte si tabulku, kde bude seznam zemi a pocet mrtvych obeti celkem
-- 2. vytvorte si tabulku, kde bude celkovy pocet mrtvych
-- 3. najoinujte

create temporary table "zeme_mrtvi_celkem" as
select "zeme", sum("mrtvych_obeti") as "mrtve_obeti_celkem"
from "evropa_teror_po_letech"
group by 1;

create temporary table "mrtvi" as
select sum("mrtvych_obeti") as "total"
from "evropa_teror_po_letech";

select * from
(select *, "mrtve_obeti_celkem"/"total" as "%"
from "zeme_mrtvi_celkem" t1
left join "mrtvi" t2); -- tady nemame na cem joinovat, chceme cislo dat do kazde radky, takze jak uz jendou rikal ondra, on proste vsechno vynasobi vsim (kartezsky soucin) - v tomto pripade ale mame jen jedno cislo v tabulce 2, takze to vynasobi jednickou :) a to chceme..




//Co dělá následující select? 


WITH 
SUCORG AS (
  SELECT GNAME
  FROM teror2 
  WHERE NKILL > 0 
  GROUP BY GNAME 
  HAVING COUNT(1) > 5), ---- prvni tabulka vybere gname z teroru, kde je nkill nad nula a ma minimalne pet zaznamu (radku) -> chceme ty nej nej (...zabijactejsi)
SERAZENO AS (
  SELECT GNAME, NKILL, IFNULL(NKILL, 0), NWOUND, EVENTDATE, COUNTRY, CITY, ROW_NUMBER() OVER (PARTITION BY GNAME ORDER BY IFNULL(NKILL, 0) DESC) RN -- druha tabulka, kde vybereme dane sloupecky a vytvorime novy (RN) za pouziti window funkce - budete se ucit - vytvori promennou s cislem radku na zaklade serazeni poctem nkill sestupne pro kazdou gname
  FROM teror2 
  WHERE GNAME IN (SELECT GNAME FROM SUCORG)) -- tady vyuzivame tabulku vytvorenou v prvnim kroce - jen ty nejzabijactejsi gname
  SELECT S.GNAME, S.NKILL, S.NWOUND, S.EVENTDATE, S.CITY, C.NAME COUNTRY -- tady uz zacina to, co se nam skutecne vypise => chceme druhou tabulku, chceme pouze prvni tri radky (serazeno podle nkill sestupne), najoinujeme jmeno zeme (ciselnik)
  FROM SERAZENO S 
  LEFT JOIN COUNTRY C 
  ON S.COUNTRY = C.ID
  WHERE S.RN <= 3 -- tady osetrujeme ty tri radky
  ORDER BY S.GNAME, NKILL DESC;
  
//Vyber z tabulky teror2 'Assassination' útoky (attacktype1 , attacktype2, attacktype3) jejichž země je bud Kolumbie, Somálsko, nebo Indie nebo je země (tabulka country - sloupecek countrytype) typu ‘Target country’. 
-- Prvni dva sloupečky budou name a countrytype z tabulky country a všechny sloupečky z tabulky terror2


select t2.name, t2.countrytype, attacktype1 , attacktype2, attacktype3
from teror2 t1
inner join (select * from country where name in ('Colombia', 'Somalia', 'India')) t2
on t1.country = t2.id
;

//with
//countries as (
//select * from country where name in ('Colombia', 'Somalia', 'India')),
//teror_attacks as (
//select country, attacktype1 , attacktype2, attacktype3 from teror2)
//select *
//from teror_attacks t1
//inner join countries t2
//on t1.country = t2.id
//;