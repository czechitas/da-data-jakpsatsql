# IMDb Dataset

Datasety jsou k dispozici na oficiálních stránkách Internet Movie Database (IMDb). Jedná se o on-line databázi obsahující informace o filmech, televizních pořadech, hercích, herečkách, režisérech a všem ostatním, co s filmovou tvorbou souvisí.

Odkaz na kompletní dokumentaci [zde](https://www.imdb.com/interfaces/)

## IMDB_TITLES 

na oficiálních stránkách: **title.basics.tsv.gz**

Dataset má přes půl milionu řádků a 9 sloupců a obsahuje následující informace o titulech:

| Sloupec | Popis |
| ------------- | ----- |
| TCONST | jedinečné ID titulu |
| TITLETYPE | typ / formát titulu (film, televizní pořad, video apod.) |
| PRIMARYTITLE | populárnější název / název používaný tvůrci na propagačních materiálech v okamžiku vydání |
| ORIGINALTITLE | původní název v původním jazyce |
| ISADULT | boolean hodnota - 0 = titul pro dospělé / 1 = titul pro dospělé |
| STARTYEAR | rok vydání titulu, v případě televizního seriálu se jedná o rok zahájení série |
| ENDYEAR | rok ukončení u televizních seriálů, NULL pro všechny ostatní typy titulů |
| RUNTIMEMINUTES | celková doba trvání v minutách |
| GENRES | zahrnuje až 3 žánry spojené s titulem |

&nbsp;
&nbsp;

## IMDB_RATINGS 

na oficiálních stránkách: **title.ratings.tsv.gz**

Dataset má přes milion řádků a 3 sloupce a obsahuje hodnocení IMDb a informace o hlasování pro jednotlivé tituly.

| Sloupec | Popis |
| ------------- | ----- |
| TCONST | jedinečné ID titulu |
| AVERAGERATING | vážený průměr hodnocení všech uživatelů |
| NUMVOTES | počet hlasů, které titul získal |