<template>
  <v-container fluid fill-height>
    <v-layout row wrap>
        <v-flex>
          Dil prvni, knihovny, kartoteky, enginy a transakcni databáze
 
Bylo nebylo
Knihovny a kartoteky, velky kartoteky, jeste vetsi kartoteky
 
Byly doby, kdy si lidi data ukladaly na disky a na flashky a to samy se delo ve firmach. Tak uz to ted proste neni, protoze kdyz uz ma data nekdo ulozeny, chce je mi I rychle pristupny, vyhledavatelny, porovnavatelny apod, je vlastne vsechno ulozeny v databazich. Vsechno. I soubory na Windows, nebo pocitaci, jsou vlastne ulozeny v databazi, jen je ta database troche specialni a pred nama skryta.
Jo, vsechno je ulozeny v db, facebook, vstupni karta do budovy, prichody, odchody, snad jen netflix a kamerovy systemy ne, i kdyz …
 
Srdcem a mozkem kazde database je engine
Engine je proste ten program schovanej v databazi, co zpusobuje, ze databaze odpovida na nase selecty a inserty.
Jako nam webovej server serviruje stranky do prohlizece, engine nam serviruje data z database
SQL enginy jsou treba ms sql, snowflake, postgresql, mysql atd
Kazdej engine ma nejaky svy specialitky, muze mit trochu jinou syntaxi, umi par veci navic proti ostatnim a neco jinyho zase neumi
 
Enginy vznikly v padesatkach kvuli sekretarkam a nahradily vetsinu kartotek a podobnych prehistorickych technologii, ucetnich knih, seznamu obyvatelstva atd
Pak se to v devadesatkach rozmohlo, protoze kazdej idiot byl najednou web developer a netusil jak delat s datama a tak pouzil nejakej sql engine
 
Enginu je hodne, nektery jsou za prachy nektery zadarmo, nektery si clovek nainstaluje na svuj server, jiny bezej na cizim serveru v cloudu
a jsou ruzne specializovany
existuji vlastne tri druhy, transakcni, data warehousovy a specialni anebo kombinovany
 
A jeste se deli na tradicni SQL a takzvany nosql
Rozdil mezi nima je v datumu narozeni, tradicni systemy jsou tu v podstate od valky, zatimco nosql se vyrojily nekdy kolem roku 2005
Dalsi rozdil je v technologii nebo pristupu k problemum, nosql casto spoustu veci neumi, ale v tech, ktere umi jsou nekdy o nekolik radu vykonnejsi, nebo skalovatelnejsi nez tradicni sql
 
Peeeeep
 
Konecne se dostavame k necemu konkretnejsimu. K asi nejrozsirenejsimu typu tradisni database.
Tradicni SQL
Transakcni aka OLTP
K cemu to je?
napr. v DHL diky databazi vsichni vi, kterej balik kam jede, ctecky to dokazou ukazat nebo zmenit,, stav baliku, objednavky a tak.
Casto to byva pro firmu kriticky system:
- 5 minut je nedostupna a
- 20 tisic lidi kouka na tocici se kolecko na ctecce nebo v navigaci
- pasy v depech se toci a baliky jen pribyvaj
- na letistich se tvori hromady baliku o kterych nikdo nevi, kam maji letet
 
Transakcni je od slova transakce. A transakce je sled operaci, ktere po databazi chceme v jednom vrzu. Napriklad zjisteni stavu na jednom uctu, odepsani penez z nej a pripsani penez na druhy ucet. Nic slozityho. Ale nesmi se stat jenom pulka tech operaci, vzdycky je to bud vsechno, nevbo nic. Nechceme mit penize na jednom uctu odepsany a na druhym nepripsany, to proste nejde. Kdyz se neco nepovede, musi byt oba ucty presne v tom stavu, v jakem byly pred zahajenim nasi transakce. Dalsi dulezita vec je, ze kdyz transakce uspesne probehne a engine posle vysledek aplikaci nebo uzivateli, uz se za zadnych okolnosti nesmi zmenit nebo zrusit. Ani kdyby mel shoret ten server, kde database bezi. K tomu slouzi vychytanej system zaloh.
 
Transakcni db Stoji na indexech
Nad vsemi dulezitymi sloupci buva index a ten uplne stejnym zpusobem jako kartoteka zrychluje hledani v tabulkach.
Priklad: hleda se balik cislo 666 666, index vezme vsechny baliky zacinajici sestkou, pokracujici dalsi sestkou a dalsi a dalsi a v sesti krocich ma v hrsti presne ta data, co potrebuje
To jsou indexy, nic vic, nic min.
 
Oltp (jak se transakcnim taky rika) databaze je dobra v tom, ze kdyz se cteckou nacte carovy kod z krabice a poslem dotaz do database vrati se nam detaily o zbozi i z miliardove tabulky do par desitek milivterin a svetlu trva dele prenest vysledek zpatky do ctecky pres ocean, nez samotne cteni z database.
a skoro stejne rychle trvaji zapisy do databaze, takze kdyz chlapik na ctecce zmackne "doruceno" a necha to zakaznika podepsat, v databazi je to vlastne hned
 
jak to?
vcechno je ulozeny v malejch blokach, rika se jim stranky a vsude jsou indexy. takze kdyz do engine pribehne dotaz a v nem je podminka, ze cislo baliku se rovna xy, engine se podiva do indexu a behem milivterin vi, kde se takzvana stranka s tim balikem nachazi, nacte ji a vrati vysledek. Totez pri zapisu, zase rychle najde tu spravnou stranku a zapise na ni tteba zmenu stavu baliku z na ceste na doruceno
 
konzistence je priorita, lepsi to mit jen na jednom miste/regionalne pentagon, mezikontinentalni, , co neprijde do pentagon neni potverzeny, se nestalo, mozna vyjimka na bojisti, ze se data odeslou az po konci mise… mrtvej vojak
synchronizace, to bude na dyl
 
long story short: Presny data, casto v nich jde o penize a jsou vsude napr. v dhl, sparkasse, tesco, ministerstva, eshopy, proste vsude. Rychle vrati jeden konkretni radek, rychle do nej zapisou zmenu diky indexum.
 

Zase pozde, na nekoho bych to hodil, ale jediny, co me napada, je, ze avast pred chvilkou vstoupil na burzu, chvilku vstoupi platnost gdpr a vubec jsem lina ves a prokrastinuju na facebooku, instaci a linked inu, misto abych vam cet pohadky.
Minule jsem vypravel o OLTP aneb transakcnich databazich, tentokrat vas budu uspavat vetama o data warehousech, datovych skladech znamych take jako decission support system neboli systemy na podporu rozhodovani. ma to urcite jeste i dalsi nazvy, ale furt je to to samy. sklad, ve kterym cely dny sedi padak a strasne rychle neco dela.

DWH nebo DSS
- taky jsou to tradicni systemy ne nejaka nosql postmoderna, akorat jsou misto transakci orientovany na analytiku, group by a desitky joinu
DWH:
Dwh je ta vec na podporu rozhodovani
napr. neco jako tesco, diky databazi vymysli, co zdrazit, co zlevnit, jaky zbozi postavit vedle sebe, poznavaji zakazniky, segmentujou si je, odmenujou a tak
- data z uctenek
- data z darkovejch kuponu
- data z mobilni site
- data z eshopu
- data o konkurenci, o pocasi a kde se co namane...
 
puvodni pristup, pustit do databaze selekt kterej spocita neco slozityho
- ve kterych regionech se prodava nejvic mleka a kolik dni tam stoji na regalu
- ktere zbozi ma nejhorsi/nejlepsi pomer doby valeni v regalu a marze, v kazdem regionu/prodejne
takova query se da pustit primo nad databazi, do ktere vsechny pokladny a ctecky ve skladech a na regalech zapisuji a ze ktere ctou
- takova query dokaze vsechno ostatni zabrzdit, nebo jet pomalu a vratit za tri dny chybu...

takze kdyz se vratim k prikladu s 20 tisicema lidi, co se divaji na tocici se kolecko na ctecce baliku v dhl, nebo stohy bezcilnych baliku hromadici se na pasech na letisti, tak to nemusi byt dusledek vypadku databaze, to se muze stat, kdyz nejaky kreativni analytik pusti dostatecne narocnou query.

Resenim obvykle je, postavit si datovy sklad anebo aspon data marty. oboji ma stejny zaklad, puvodni data z OLTP databaze se kopirujou jinam, kde ta zatez nikoho neomezuje a analytici muzou vesele poustet sve tri dny trvajici dotazy.
pro vetsinu analyz staci mit data za posledni dva tri roky ale zato ze vsech systemu ve firme a casto byva dulezite mit v datech kompletni vcerejsek. Proc? No protoze manazeri jsou rano tak nejak zvykli ptat se, jak to vcera dopadlo. Tahle otazka byva jeste zajimavejsi, kdyz vcera skoncil mesic, kvartal, nebo rok...
(tohle je vtipny s casovejma zonama, aneb manazerovi se da oponovat jednoduse - definuj kompletni vcerejsek, ktera v globalni firme ma tri mozne odpovedi 
lokalni cas, ten v sobe nese jen a jen komplikace, v nekterych zemich v ru dobu ubehla asi tak polovina dne, coz muze mit na cisla celkem vliv a letni a zimni casy casto vyvolaji patrani po chybejici, nebo prebyvajici hodine v reportech
UTC, to znamena ze vcerejsek konci uderem pulnoci v greenwichi)
ukonceny cely den ve vsech casovych zonach, coz dava trochu vic casu na zpracovani vcerejska, pokud firma nesidli na aljasce
 
Rozdil mezi data martem a data warehousem je jenom poradek, v jakem data jsou. Data warehouse jsou vymazlena data, kde se prodeje, reklamni naklady, zamestnanci firmy, pocasi a vubec vsechno da tzv. rezat stejnymi dimenzemi, to znamena ze se na vsechna cisla da divat po zemich, nebo po regionech, nebo po kategoriich produktu zakazniku a nikde nic nechybi, neprebyva, jeden kazdy radek i sloupecek je presne definovany a kdo nevi, podiva se do manualu nebo dokumentace datoveho skladu a dozvi se vse potrebne.
Teoreticky krasne, realne temer nemozne. Nove zdroje dat se ve firmach objevuji mnohem rychleji, nez je mozne je pekne prozkoumat, ocistit, zdokumentovat a pripravit neco, co je bude navzdy bezchybne kopirovat ze zdrojoveho systemu do skladu.
Varianta b je mit data marty, data zkopirovana ze zdrojovych systemu a obohacena o data z ostatnich systemu, tam, kde je to potreba. Proste o dost vetsi bordel, ale prostredi, kde se da mnohem rychleji vyvinout neco noveho, nebo reagovat na zmeny.
Jak uz to byva, v praxi se vetsinou pouziva mix obou pristupu.

Engine ma samozrejme radsi data pekne vycistena, s peknymi primarnimi klici, aby se to hezky joinovalo. Ale vetsina enginu se popere i s daty z data martu, ktera uz tak vypulirovana nejsou.

Dotazy do skladu typicky trvaji mnohem dele, nez dotazy do OLTP, rozdil je v tom, ze ctecka v dhl, nebo sporitelni bankomat cte ze sve databaze jen par radek, zatimco dotaz do skladu scita vetsinou data o vsech balicich v poslednim roce, nebo o vsech vyberech z bankomatu od jaksteziva. Vysledkem takoveho dotazu pak muze byt treba seznam dep kde se nejcasteji baliky zdrzuji o vic nez 20% vic, nez v okolnich depech, nebo seznam podezrelych vyberu z bankomatu a telefonnich cisel majitelu karet k obvolani a pripadnemu zablokovani karty.


Jakto ze je to ve skladech tak rychly?
Za to muze Padak, je ve skladech pecenej varenej a jeho rychlost a pohotovost jste zazily na vlastni kuzi.
Ale neni to jenom Padakem. U DWH se hodne pouziva komprese, databaze nebyvaji ulozene ve strankach, ale ve velikych blocich radove 100 000 krat vetsich nez klasicka stranka a vsechno se optimalizuje a paralelizuje, jak jen to jde.
Napriklad kdyz se spusti groupovaci select nad dvema sloupecky mesic a celkova cena v tabulce prodeju s podminkou na posledniho pul roku, nactou se z disku jen data techhle dvou sloupecku a to jeste jen tech, ktere obsahuji relevantni mesice.
A protoze jsou data na disku komprimovana a ctou se jen ta, co jsou potreba a ne cele stranky jako u transakcni databaze, svisti to treba 100x rychleji. A protoze se nektere z operaci, ktere s daty delame daji delat paralelne, muze to byt jeste vic nez 100x rychlejsi.

Jeste jednou a pomaleji. presdstavme si select do milionove tabulky objednavek, ktery je zgrupuje a secte po mesicich a stavech objednavky. Kdyz se v transakcni databazi budeme snazit nacist milion transakci, muze se v krajnim pripade stat, ze si databazovy engine milionkrat sahne na disk, milionkrat pricte posledni radek k nasemu select sum(cena_v_korunach) a milionkrat v dalsi tabulce vyhleda jaky je stav objednavky, protoze v nasem selectu je join na stav objednavky. Warehouse v extremnim pripade sahne na disk jednou, rozseka radky na nekolik mensich casti, kazdou necha secist a zgroupovat na jinem procesoru a hotovo.


Long story short: warehouse, datovy sklad, anebo DSS aka decision support system je databaze, ktera je dobra na zpracovani velkych objemu dat, ruzne group by a windowing funkce. Pomahaji tomu velke bloky dat, paralelizace, komprese a mnoho dalsich triku, ktere maji enginy pod kapotou.
 

Specialni use case
- jiny dokazou prezit i zavazny chyby na disku, pravidelny vypadky elektriny apod. (firebird - vyvinuta puvodne pro pouzivani v tancich apod, kde dost casto vypadava elektrika a drncani tockovejm diskum nedela dobre) long story short: exoticka databaze obcas se vyskytuje v ruznych CRM systemech
 
NoSQL
Key value story
- dalsi dokazou stovce milionu uzivatelu ukazovat, co kamosi postli a kolik lajku ma jejich selficko na petrine (a aby to nestalo majlant, je to postaveny tak, ze kdyz to nahodou nedopadne, uzivatel proste klikne na refresh a snad to napodruhy projde...) (kasandra, scuba apod) https://research.fb.com/wp-content/uploads/2016/11/scuba-diving-into-data-at-facebook.pdf

Columnstore a in memory Data warehousy, OLAP. DSS
- taky jsou takovy, ktery udelaj group by nad desetimiliardovou tabulkou o devadesati sloupcich rychlejc, nez ho stihne prohlizec vykreslit do gridu - tim myslim proste ve vterinach (snowflake, redshift, hadoop, columnstore obecne) firmy na zeleny louce, startupy, moderni korporaty

Spatial DB – prostorove databaze
- nebo takovy, co jsou dobry na mapovy operace, jakoze se u dat casto pouzivaj souradnice a radius a takovy veci, jo, i tohle se da indexovat (napr. postGIS) google maps, seznam mapy, kiwi.com apor.
a tak dal
 
shrnuti
kazda se da narazit na jeakej ucel, je to jako zapalovac, vetsina lidi s nim neco zapaluje, ale najdou se I taci, co s nim otviraji pivo
nebudes pouzivat nejakou prostorovou databazi na aplikaci pro hlasovani zaku ve skole
na druhou stranu nebudes tu samou databazi nuti vypocitat vsechny moznosti sachovych partii za posledni rok v mezinarodni sachove lize
 
zakladni rozdeleni OLTP vs DWH
 
 
 
 
Pá, pá, a ted ty specialitky
jak funguje treba ta facebook/instagram/google photos/quora apod?
obecne databaze pro socialni sit muze kaslat na nejakou konzistenci
- kdyz se cloveku nepovede uploadnout fotka, posle ji znova
- kdyz ji posle dvakrat, ukaze se ta posledni
- kdyz mu v news feedu bude neco chybet, vzdycky se to misto da zaplnit reklamou a jeste na tom vydelat ;)
 
v cem je trik?
Aby se nemuselo pri kazdym zobrazeni feedu / clanku hledat, koho mam v pratelich, a co ti lidi postli, coz by bylo celkem narocny, data se proste duplikujou.
jak?
no kdyz nahraju fotku z petrina s nejakou kraskou pod tresni na facebook, ta fotka se ulozi ke me, a ke vsem mejm kamosum do feedu
to je jednoducha operace, proste jednoduchejch 600 zapisu, ktery jsou vlastne vsechny stejny.
a kdyz pak nekdo otevre svuj feed, vidi tam vsechno, co mu tam jeho kamosi nahrali
zase jednoduchy, udela se jeden "select where userid" a zpatky prijde nejakej megavelikej JSON se vsema tema postama
proc takhle? proc je to rychlejsi?
protoze kdyby se melo pri kazdym zobrazeni feedu projet 600 cizich feedu a zjistit, jestli v nich je neco novyho, trvalo by to dlooooouho, databaze by se uhledala k smrti
 
Jak funguje hadoop a proc vubec vznikl
kazda databaze ma svuj strop, u tech komercnich jsou ty stropy stratosfericky vysoko.
jakoze sileny cisla
velikost databaze oracle 2048 PB, MSSQL 524 PB
velikost pameti windows (mssql) 24 TB, red hat 12 [64] TB
pocet jader procesoru red hat 576[5120], windows 512
 
takovy masinky neco stojej a licence pro ne jakbysmet. v realu jich na svete existuje par a ty jsou pouzity bud pro vedu nebo pro marketing ;)
 
obecne plati, ze cim vykonnejsi server, tim drazsi je ho o pulku zrychlit.
 
disclaimer: pohadka v pohadce
nekdy kolem roku 2006 chlapik jmenem Doug Cutting (stanford university) odesel z prace, protoze se chtel vic venovat open source.
pro ty co nevedi, open source je proste software zadarmo, ktery vyviji komunita vyvojaru pro vseobecny dobro, cest a slavu
treba linux, firefox, postgresql, python, scikit learn, pandas to jsou priklady slavnejch opensource projektu
a rozhodl se jeste s Mikem Cafarellou (University of Michigan/Washington/Edinburgh) napsat si vlastni search engine a webcrawler,
kterej by umel prohledavat a indexovat celej internet. Na takovy to domaci googleni.
proste san franciskej geek jak ma bejt.
napsali jeste s jednim chlapikem hodnotici software, kterej dokazal zjistit, kolik na kterou stranku odkazuje stranek a jak jsou ty stranky relevantni apod. ohodnotit je a pak pri prohledavani vracet neco jako ted vraci google
jenze ten engine byl proste narocnej, dokazali takhle hodnotit asi sto stranek za vterinu na jednom pocitaci a tak to prepsali pro vic pocitacu
hmm, zrychlilo se to, ale protoze to bezelo na vic pocitacich, furt se nekde kopirovaly data, dochazelo misto a bylo to cely dost nestabilni, nekdo u toho musel vlastne furt sedet
tak je napadlo, ze tohleto kopirovani a vubec distribuovany uloziste a distribuovanej vykon si napisou nejak zvlast, at se tim nemusej trapit
a tak asi za tri mesice napsali pro svuj projekt nutch (webcrawler) neco, cemu jeste nedali jmeno, proste cca 5000 radek kodu pro distribuovany file system a dalsich 6000 pro dotazovaci engine
tou dobou google vydal blogpost/paper o tom, jak neco podobnyho delaj v googlu, sice bez technickych detailu, proste jen takovej prehled architektury.
a yahoo se toho chytlo taky, a par dalsich firem taky. Snehova koule se rozjela z kopce. Bezejmenej projekt nakonec pojmenoval chlapik z google, podle oblibeny hracky svyho syna, zlutyho slona - hadoop.
 
 
 
 
jen pro predstavu ted ma hadoop 18,931 komitu od 247 vyvojaru a celkem 2,918,489 radek kodu
https://www.openhub.net/p/Hadoop
 
hadoop je taky jednim ze zastupcu distribuovanych systemu
co to je distribuoovany system?
je to neco jako mraveniste, ale misto mravencu v tom jsou servery, kterym se v tomhle pripade casto rika nody, z anglickyho node, uzel
nainstaluje se treba 20 serveru, nastavi se a pak uz je to hodne samoudrzovaci.
servery si mezi sebou udelaj hlasovani a jeden vyhraje roli velitele a uz to frci.
kdyz nejakej server umre a dlouho ostatni neodpovida, velitel ho odrizne a jeho data rozdeli mezi ostatni.
 
hezky se to vysvetluje na prikladu kasandry anebo obecne facebook like dat
predstav si, ze na kazdem serveru jsou facebookova data pro lidi s prijmenim zacinajicim na stejne pismeno abecedy
jeden server pro lidi s prijmenim zacinajicim na A
jeden pro lidi s prijmenim na B, jeden na C a tak dal...
no a kdyz se appka z telefonu zepta kteryhokoliv serveru na chocholouse, tak pokud to neni server, co ma na starosti ch, zepta se velitele, kdo ma ch na starosti
preposle tam dotaz na chocholouse a na chvilku si to zapamatuje, at tak casto neotravuje velitele.
kdyz na nej prijde dotaz na data, ktery ma na starosti, proste ho vyridi a hotovo.
to je cely. jen je to mnohem levnejsi, nez mit jeden velikej server pro vsechna data a od urcity velikosti uz proste jediny reseni, ne kazdymu staci 2048 PB, a uz vubec nikdo za ne nechce platit oraclu...
 
a jak to funguje? to, co normalne dela databaze se rozdeli mezi spoustu stroju. a protoze pro tyhle ucely nejsou potreba zadny transakce a v datech se ocekava spousta bordelu, je to cely vlastne dost na prasaka
distribuovanej file system vlastne znamena, ze v hadoopu jsou ulozeny giganticky CSVcka. aby to bylo rychly, kdyz se tam to CSVcko nahrava, rozseka se na kusy treba po 100 MB a kazdej ten kus se nahraje na jinej stroj
a kdyz pak to csvcko chceme proletet select * from csv where page like '%pavel@chocholous.net%', zacne se najednou projizdet na kazdym stroji zvlast.
takze kdy budeme mit 10 TB csv a 25 stroju, bude to trvat, jako bychom na jednom stroji cetli 200 GB, tj. minuty. zatimco na jednom stroji by to byla treba hodina, nebo i vic.
 
a to je principem na kterem hadoop stoji, kdyz si v nem pustime group by, nejdriv se udela group by na kazdem stroji nad podmnozinou dat, pak se data spoji, zagregujou jeste jednou a voila, nas group by nad 10 miliardama radek je za minutu a pul hotovej.
mnohem levneji, nez by to trvalo na tradicnim databazovem stroji.
 
a je tu jeste par dalsich veci, ktere hadoop umoznuje:
- column store comprese, stejne jako u dwh to rapidne zlepsuje vykon na analyticke query
- pouzivat javu, Rko, scalu, spark, python pro praci s daty misto SQL
- nemit pro tabulku jasne definovane schema, takze zadne datove typy, ale proste JSON. priklad:
                - predstav si, ze chrome nekam do hadoopu posila info o tom, kde lidi brouzdaj internetem
                - a vzdycky posle url, nejaky svoje idcko, dobu jak dlouho stranku nacital a bla bla bla, vsechno pekne v JSON formatu
                - prileti to do hadoopu, ulozi se to do 'tabulky' browsing_data (nebo aspon neceho tabulce podobnymu)
                - no a s novou verzi chromu to zacne posilat jeste
                                - verzi operacniho systemu
                                - fotku z kamery, pokud v pocitaci je
                                - dobu jak dlouho uz nespadnul a bla bla bla
                - nebo zacne z ciny posilat data sifrovane, z iranu rovnou kratky videa z kamery a podobne
no a vsechno se to hazi do jedny tabulky a v selectech se proste clovek pta do toho JSONu treba na URL, to je vsude anebo na fotku z kamery, ktera ja jen v novych verzich, nebo odjakziva v cine a iranu... vsechno je tam nahazeny na jedny hromade a je ukolem analytika overit si, ze data dostava jakz takz dobre
 
 
 
column store comprese
spatra nablind proste to popsat jak to je

        </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  name: "LongStoryShort",
}
</script>