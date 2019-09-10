<template>
  <v-container fluid fill-height>
    <v-layout>
        <v-flex>
           <!-- <h1>Bude pripraveno Monikou Vlckovou :)</h1> -->
			
            <v-card>
            	<v-tabs>
              	<v-tab>Barevnej select</v-tab>
				<v-tab>Mončin tahák</v-tab>
              	<!-- <v-tab>Tildy a chlupatý závorky</v-tab> -->
				<v-tab>Další odkazy ke studiu</v-tab>

              	<v-tab-item>
                 <v-card flat color="basil">
                  	<v-card-text>
                      Psaní selektů podléhá nekompromisním pravidlům. Jinak řečeno, záleží na pořadí klíčových slov. Následující "šablona" ukazuje tato pravidla na příkladu. 
                    </v-card-text>
                    <v-card-text>
                    	<pre v-highlightjs><code class="sql">
-- všechno, co je za dvěma pomlčkami až do konce řádku, je komentář (tedy to engine ignoruje)
/*
víceřádkové komentáře vypadají
takhle
*/
SELECT	--příkazem SELECT enginu říkáme, že chceme, aby nám ukázal/vypsal data
nas_sloupecek1, nas_sloupecek2, nas_sloupecek3 AS datum, 
	/* vyjmenováním sloupečků říkáme, které chceme vidět, oddělujeme je 		
	čárkami, můžeme taky použít alias (AS) */
funkce(nas_sloupecek1) AS s1	--použitím funkcí můžeme zobrazené sloupečky měnit, kombinovat apod.
FROM	-- když chceme “selectovat”, musíme enginu říct odkud
nase_tabulka
	/* nejjednodušší je výběr dat z jedné tabulky, za klíčovým slovem 	
	FROM můžeme ale i joinovat tabulky, nebo používat vnořené selecty */
WHERE	/* za WHERE patří podmínky (filtry) určující, které řádky engine vybere, 
	i tady můžeme použít funkce a kombinovat sloupečky */
((nas_sloupecek1 = 'textova hodnota')
OR
(nas_sloupecek2 = 11))
AND
funkce(nas_sloupecek3) > '2001-09-11'
GROUP BY 
	/* pokud chceme použít agregační funkce, musíme enginu říct, podle kterých
sloupečků má data agregovat */
HAVING	/* filtruje skupinky podle agregačních funkcí, třeba nulový součet počtu 
	mrtvých, ceny apod.*/
nas_sloupecek1, nas_sloupecek2, nas_sloupecek3
ORDER BY 	/* pokud chceme data řadit, musíme enginu říct podle kterých sloupečků */
nas_sloupecek1, nas_sloupecek2, nas_sloupecek3
LIMIT 11	-- nakonec můžeme omezit počet řádek, které chceme zobrazit 

                    	</code></pre>
					</v-card-text>
                 </v-card>
              	 </v-tab-item>
				
				<v-tab-item>
					<v-card flat color="basil">
						 <v-card-text>
							<h2>Operátory</h2>
							<strong>;</strong>      Zakončuje příkaz. Používej vždy na konci příkazu

							<strong>--</strong>     Takto jednoduše zakomentuješ text pro poznámky

							<strong>, </strong>      Používá se při výběru sloupců. Pomůcka - "a
							<p style="padding-left: 30px;"><em>SELECT toto, toto, toto FROM tabulka;</em></p>
							<strong>.</strong>       Cesta
							<p style="padding-left: 30px;">databaze.schema.tabulka</p>
							<strong>=</strong>     Rovno, přiřazení, a další

							<strong>&lt;&gt; </strong>  Není rovno, vylučuje podmínku

							<strong>' '</strong>     Jednoduché závorky - obalují řetězec v podmínkách ('text')
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka WHERE sloupec = 'obsahuje tento text';</em></p>
							<strong>“ “ </strong>  Dvojité závorky - Objekt, struktura v databázi (sloupec, databáze,...),
							<p style="padding-left: 30px;"><em>SELECT “název_sloupce” FROM tabulka;</em></p>
							<strong>&gt; </strong>    Větší než
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka WHERE sloupec &gt; 3;</em></p>
							<strong>&lt;  </strong>   Menší než
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka WHERE sloupec &lt; 3;</em></p>
							<strong>&gt;= </strong>  Větší nebo rovno
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka WHERE sloupec &gt;= 3;</em></p>
							<strong>&lt;= </strong>  Menší nebo rovno
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka WHERE sloupec &lt;= 3;</em></p>
							<strong>+  </strong>   Sčítá, přidává
							<p style="padding-left: 30px;"><em>SELECT 2 + 3;</em></p>
							<strong>&lt;=&gt;</strong> Rovno včetně hodnot NULL

							<strong>-</strong>      Odečítá, ubírá

							<strong>* </strong>     Vybere všechno
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka;</em></p>
							<p style="padding-left: 30px;">Násobí číselné údaje</p>
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka WHERE sloupec * 2; nebo SELECT 2 * 3;</em></p>
							<strong>/</strong>     Dělí
							<p style="padding-left: 30px;"><em>SELECT 2 / 3;</em></p>
							<strong>%</strong>    Nahrazuje libovolný počet znaků (Používám, když vím pouze část textu), používá se ve spojení s
							LIKE/iLIKE
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka WHERE sloupec LIKE '%bla%';</em></p>
							<strong>_</strong>      Nahrazuje jeden znak v textu
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka WHERE sloupec LIKE 'te_t';</em></p>
							<strong>||</strong>      Slučovač. Stejné jako CONCAT Spojí dva sloupce do jednoho.

							<strong>::</strong>     Změní datový typ ve sloupci. Stejné jako CAST()
							<p style="padding-left: 30px;">datový_typ :: jiný_datový_typ</p>
							<p style="padding-left: 30px;"><em>SELECT CAST('2017-08-25' AS datetime);</em></p>
							&nbsp;
							<h2>Příkazy</h2>
							<h2><span style="color: #008000;">A</span></h2>
							<p style="padding-left: 10px;"><strong>AND</strong>           A zároveň</p>
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka WHERE sloupec LIKE 'něco' AND sloupec;</em></p>
							<p style="padding-left: 10px;"><strong>AS</strong>               Přejmenovává sloupec</p>
							<p style="padding-left: 30px;"><em>SELECT sloupec AS sloupec_jinak FROM tabulka;</em></p>
							<p style="padding-left: 10px;"><strong>ASC</strong>            Používá se společně s ORDER BY. Řadí hodnoty ve sloupci
								vzestupně</p>
							<p style="padding-left: 30px;"><em>SELECT sloupec FROM tabulka ORDER BY sloupec ASC;</em></p>
							<p style="padding-left: 10px;"><strong>AVG</strong>           Spočítá průměr</p>
							<p style="padding-left: 30px;"><em>SELECT AVG(sloupec) FROM tabulka;</em></p>
							&nbsp;
							<h2><span style="color: #008000;">B</span></h2>
							<p style="padding-left: 10px;"><strong>BETWEEN</strong>        Upřesnění výběru. Podmínka mezi tím a tím</p>
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka WHERE sloupec BETWEEN 'tím' AND 'tamtím';</em></p>
							&nbsp;
							<h2><span style="color: #008000;">C</span></h2>
							<p style="padding-left: 10px;"><strong>CASE</strong>             Vypíše hodnoty na základě splnění podmínky, pokud tam
								je</p>
							<p style="padding-left: 30px;"><em>SELECT CASE</em></p>
							<p style="padding-left: 60px;"><em>WHEN sloupec LIKE 'hledana_hodnota' THEN 'hodnota'</em></p>
							<p style="padding-left: 60px;"><em>WHEN sloupec LIKE 'hledana_hodnota2' THEN 'hodnota2'</em></p>
							<p style="padding-left: 60px;"><em>ELSE 'hodnota3'</em></p>
							<p style="padding-left: 30px;"><em>END AS nazev</em></p>
							<p style="padding-left: 30px;"><em>FROM tabulka;</em></p>
							<p style="padding-left: 10px;"><strong>CAST</strong>         Změní datový typ. Shodné s ::</p>
							<p style="padding-left: 30px;"><em>SELECT CAST('2019-09-14' as datetime);</em></p>
							<p style="padding-left: 10px;"><strong>CEIL</strong>          Vypíše nejmenší číslo hodnotu, která je větší nebo rovno
							</p>
							<p style="padding-left: 30px;"><em>SELECT CEIL(3.4);</em></p>
							<p style="padding-left: 10px;"><strong>CONCAT</strong>   Sloučí dva sloupce do jednoho. Shodné s ||</p>
							<p style="padding-left: 30px;"><em>SELECT CONCAT(sloupec1, sloupec2) FROM tabulka;</em></p>
							<p style="padding-left: 10px;"><strong>COUNT</strong>     Spočítá počet řádků</p>
							<p style="padding-left: 30px;"><em>SELECT COUNT(1) FROM tabulka;</em></p>
							<p style="padding-left: 10px;"><strong>CREATE</strong>   Vytvoří (např. tabulku, schéma,...)</p>
							<p style="padding-left: 30px;"><em>CREATE TABLE pokus (jm CHAR(20) NOT NULL, cis INT, PRIMARY KEY (jm),
								INDEX(cis));</em></p>
							&nbsp;
							<h2><span style="color: #008000;">D</span></h2>
							<p style="padding-left: 10px;"><strong>DATE_FROM_PARTS</strong>   Vytvoří datum do jednoho sloupce (formát YYYY-MM-DD)
							</p>
							<p style="padding-left: 30px;"><em>SELECT DATE_FROM_PARTS(2019, 09, 14);</em></p>
							<p style="padding-left: 10px;"><strong>DATEADD</strong>            Přidá/ubere hodnotu zadané časové úrovně (formát
								YYYY-MM-DD)</p>
							<p style="padding-left: 30px;"><em>SELECT TO_DATE('2019-09-14') AS sloupec, DATEADD(YEAR, 2, D) AS sloupec2;</em></p>
							<p style="padding-left: 10px;"><strong>DELETE</strong>   Vymaže data</p>
							<p style="padding-left: 10px;"><strong>DESC</strong>         Používá se společně s ORDER BY. Řadí hodnoty ve sloupci
								sestupně</p>
							<p style="padding-left: 30px;"><em>SELECT sloupec FROM tabulka ORDER BY sloupec DESC;</em></p>
							<p style="padding-left: 10px;"><strong>DISTINCT</strong> Vybere unikátní hodnoty (odstraní duplikáty)</p>
							<p style="padding-left: 30px;"><em>SELECT DISTINCT(sloupec) FROM tabulky;</em></p>
							<p style="padding-left: 10px;"><strong>DROP</strong>     Odebírá zadaný objekt. Lze obnovit pomocí UNDROP</p>
							&nbsp;
							<h2><span style="color: #008000;">E</span></h2>
							<p style="padding-left: 10px;"><strong>EXTRACT</strong>             Vypíše část data</p>
							<p style="padding-left: 30px;"><em>SELECT EXTRACT(DAY FROM "2019-08-31");</em></p>
							&nbsp;
							<h2><span style="color: #008000;">F</span></h2>
							<p style="padding-left: 10px;"><strong>FLOOR</strong>     Vypíše největší celočíselnou hodnotu, která je menší nebo
								rovna číslu</p>
							<p style="padding-left: 30px;"><em>SELECT FLOOR(3.4);</em></p>
							&nbsp;
							<h2><span style="color: #008000;">G</span></h2>
							<p style="padding-left: 10px;"><strong>GREATEST</strong>          Vypíše největší hodnotu (číslo i text)</p>
							<p style="padding-left: 30px;"><em>SELECT GREATEST(11, 5, 2, 73) FROM tabulka;</em></p>
							<p style="padding-left: 10px;"><strong>GROUP BY</strong>          Seskupuje hodnoty ve sloupci</p>
							<p style="padding-left: 30px;"><em>SELECT sloupec FROM tabulka WHERE sloupec='něco' GROUP BY sloupec;</em></p>
							&nbsp;
							<h2><span style="color: #008000;">H</span></h2>
							<p style="padding-left: 10px;"><strong>HAVERSINE</strong>    Vypočítá vzdálenost v kM mezi zeměpisnou šířkou a délkou
								ve stupních. (pomocí Haversinova vzorce)</p>
							<p style="padding-left: 30px;"><em>SELECT HAVERSINE(40.7127, -74.0059, 34.0500, -118.2500);</em></p>
							<p style="padding-left: 10px;"><strong>HAVING</strong>   Filtruje skupiny vytvořené GROUP BY</p>
							<p style="padding-left: 30px;"><em>SELECT sloupec FROM tabulka</em></p>
							<p style="padding-left: 30px;"><em>GROUP BY sloupec</em></p>
							<p style="padding-left: 30px;"><em>HAVING COUNT(*) &lt; 10;</em></p>
							&nbsp;
							<h2><span style="color: #008000;">I</span></h2>
							<p style="padding-left: 10px;"><strong>IFF             </strong>Podmínka pravda/nepravda</p>
							<p style="padding-left: 30px;"><em>SELECT IFF(10&gt;9, 'ANO', 'NE');</em></p>
							<p style="padding-left: 10px;"><strong>ILIKE</strong>        Upřesnění výběru (NEbere ohled na malá/velká písmena)</p>
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka WHERE sloupec LIKE 'nĚcO';</em></p>
							<p style="padding-left: 10px;"><strong>INSERT</strong>     Vkládá data</p>
							&nbsp;
							<h2><span style="color: #008000;">J</span></h2>
							<p style="padding-left: 10px;"><strong>JOIN</strong>     Spojuje tabulky. LEFT, RIGHT</p>
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka1 LEFT JOIN tabulka2 ON tabulka1.id=tabulka2.id;</em></p>
							&nbsp;
							<h2><span style="color: #008000;">L</span></h2>
							<p style="padding-left: 10px;"><strong>LEAST</strong>    Vypíše nejmenší hodnotu (čísla i písmena)</p>
							<p style="padding-left: 30px;"><em>SELECT LEAST(11,5,2,73) FROM tabulka;</em></p>
							<p style="padding-left: 10px;"><strong>LEFT</strong>         Vypíše znaky z řetězce začínající zleva</p>
							<p style="padding-left: 30px;"><em>SELECT LEFT('text', 3);</em></p>
							<p style="padding-left: 10px;"><strong>LENGTH</strong>   Vypíše délku řetěžce</p>
							<p style="padding-left: 30px;"><em>SELECT LENGTH('text');</em></p>
							<p style="padding-left: 10px;"><strong>LIKE</strong>          Upřesnění výběru (bere ohled na malá/velká písmena)</p>
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka WHERE sloupec LIKE 'něco';</em></p>
							<p style="padding-left: 10px;"><strong>LIMIT</strong>       Vypíše počet řádků ze sloupce dle podmínky</p>
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka LIMIT 10;</em></p>
							<p style="padding-left: 10px;"><strong>LOWER</strong>     Převádí písmena na malá</p>
							<p style="padding-left: 30px;"><em>SELECT LOWER('VELKÁ PÍSMENA');</em></p>
							&nbsp;
							<h2><span style="color: #008000;">M</span></h2>
							<p style="padding-left: 10px;"><strong>MAX</strong>          Zobrazí maximální hodnotu</p>
							<p style="padding-left: 30px;"><em>SELECT MAX(sloupec) FROM tabulka;</em></p>
							<p style="padding-left: 10px;"><strong>MIN</strong>           Zobrazí minimální hodnotu</p>
							<p style="padding-left: 30px;"><em>SELECT MIN(sloupec) FROM tabulka;</em></p>
							&nbsp;
							<h2><span style="color: #008000;">N</span></h2>
							<p style="padding-left: 10px;"><strong>NOT</strong>           Negace</p>
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka WHERE sloupec NOT IN (2012);</em></p>
							<p style="padding-left: 10px;"><strong>NULL</strong>         Nulová hodnota</p>
							&nbsp;
							<h2><span style="color: #008000;">O</span></h2>
							<p style="padding-left: 10px;"><strong>OR</strong>              Podmínka NEBO (buď, anebo)</p>
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka WHERE sloupec = 'toto' OR sloupec = 'tamto';</em></p>
							<p style="padding-left: 10px;"><strong>ORDER BY</strong>     Řadí hodnoty ve sloupci vzestupně. Používá se společně s
								ASC/DESC</p>
							<p style="padding-left: 30px;"><em>SELECT sloupec FROM tabulka ORDER BY sloupec;</em></p>
							&nbsp;
							<h2><span style="color: #008000;">R</span></h2>
							<p style="padding-left: 10px;"><strong>RIGHT</strong>    Vypíše znaky z řetězce začínající zprava</p>
							<p style="padding-left: 30px;"><em>SELECT RIGHT('text', 3) FROM tabulka;</em></p>
							<p style="padding-left: 10px;"><strong>ROUND</strong>    Zaokrouhluje čísla na desetinná místa</p>
							<p style="padding-left: 30px;"><em>SELECT ROUND(3.77, 2);</em></p>
							&nbsp;
							<h2><span style="color: #008000;">S</span></h2>
							<p style="padding-left: 10px;"><strong>SPLIT</strong>        Rozděluje text podle oddělovače</p>
							<p style="padding-left: 30px;"><em>SELECT SPLIT(sloupec, ' ') FROM tabulka;</em></p>
							<p style="padding-left: 10px;"><strong>SUBSTRING</strong>        Vypisuje část řetězce od dané pozice</p>
							<p style="padding-left: 30px;"><em>SELECT SUBSTRING('text', 3);</em></p>
							<p style="padding-left: 10px;"><strong>SUM</strong>           Součet</p>
							<p style="padding-left: 30px;"><em>SELECT SUM(sloupec) FROM tabulka;</em></p>
							&nbsp;
							<h2><span style="color: #008000;">T</span></h2>
							<p style="padding-left: 10px;"><strong>TIMESTAMP</strong>       Vypíše datum s časem</p>
							<p style="padding-left: 30px;"><em>SELECT TIMESTAMP('2019-09-14');</em></p>
							<p style="padding-left: 10px;"><strong>TO_DATE</strong>            Převede na datum</p>
							<p style="padding-left: 30px;"><em>SELECT TO_DATE('09/14/2019');</em></p>
							<p style="padding-left: 10px;"><strong>TRIM</strong>         Odstraní mezery</p>
							<p style="padding-left: 30px;"><em>SELECT TRIM('   bla   ');</em></p>
							&nbsp;
							<h2><span style="color: #008000;">U</span></h2>
							<p style="padding-left: 10px;"><strong>UPPER</strong>    Převádí písmena na VELKÁ</p>
							<p style="padding-left: 30px;"><em>SELECT UPPER('malá písmena');</em></p>
							<p style="padding-left: 10px;"><strong>UNION</strong>    Spojí výběr ze dvou tabulek ("požadavky" musí být shodné)</p>
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka1</em></p>
							<p style="padding-left: 30px;"><em>UNION</em></p>
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka2;</em></p>
							<p style="padding-left: 10px;"><strong>UNION ALL</strong>    Spojí výběr i s opakujícími se hodnotami</p>
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka1</em></p>
							<p style="padding-left: 30px;"><em>UNION ALL</em></p>
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka2;</em></p>
							<p style="padding-left: 10px;"><strong>UPDATE</strong>   Aktualizuje (např. data v tabulce)</p>
							<p style="padding-left: 30px;"><em>UPDATE tabulka;</em></p>
							&nbsp;
							<h2><span style="color: #008000;">W</span></h2>
							<p style="padding-left: 10px;"><strong>WHEN</strong>     Podmínka když</p>
							<p style="padding-left: 10px;"><strong>WHERE</strong></p>
							Podmínka kde
							<p style="padding-left: 30px;"><em>SELECT * FROM tabulka2 WHERE sloupec = 2019;</em></p>
						 </v-card-text>
					</v-card>
				</v-tab-item>
              	 <!-- <v-tab-item>
                 <v-card flat color="basil">
                  <v-card-text>Středníky a spol</v-card-text>
                 </v-card>
              	 </v-tab-item> -->
				 <v-tab-item>
                 <v-card flat color="basil">
                  <v-card-text>
					<p>
					Různé <b>SQL fiddlery</b> (místo, kde si můžete zkoušet psát dotazy nad nějakými daty a ta věc vám ukáže, co to vrací):
					</p>
					<ul>
						<li><a href="http://sqlfiddle.com/">http://sqlfiddle.com/</a></li>
						<li><a href="https://www.db-fiddle.com">https://www.db-fiddle.com/</a></li>
						<li>
							<a href="https://www.google.com/search?q=sql+fiddle+online&rlz=1C1GGRV_enCZ767CZ767&oq=sql+fidd&aqs=chrome.1.69i57j35i39j0l4.3029j0j7&sourceid=chrome&ie=UTF-8">
								https://www.google.com/search?q=sql+fiddle+online&rlz=1C1GGRV_enCZ767CZ767&oq=sql+fidd&aqs=chrome.1.69i57j35i39j0l4.3029j0j7&sourceid=chrome&ie=UTF-8
							</a>
						</li>
					</ul>
					<p>
						Dost podobný, ale s trochou zábavy navíc, jsou všelijaký <b>SQL challenges</b>, kde krom toho prostředí na dotazy dostanete i nějaké úkoly k vyřešení:
					</p>
					<ul>
						<li><a href="https://www.hackerrank.com/domains/sql">https://www.hackerrank.com/domains/sql</a></li>
						<li><a href="https://sqlzoo.net/%7C">https://sqlzoo.net/%7C</a></li>
						<li>
							<a href="https://www.google.com/search?q=sql+challenges+online&rlz=1C1GGRV_enCZ767CZ767&oq=sql+challenges+&aqs=chrome.1.69i57j0l5.6779j0j7&sourceid=chrome&ie=UTF-8">
								https://www.google.com/search?q=sql+challenges+online&rlz=1C1GGRV_enCZ767CZ767&oq=sql+challenges+&aqs=chrome.1.69i57j0l5.6779j0j7&sourceid=chrome&ie=UTF-8
							</a>
						</li>
					</ul>
					<p>
						A pak nějaká vaše <b>zadarmo cloudová databáze</b>, do které si můžete nalít data a hrát si s nima z SQL klienta, nebo nějáké appky, skriptu, prostě odkudkoliv:
					</p>
					<p>ZDARMA</p>
					<ul>
						<li><a href="https://www.heroku.com/postgres">https://www.heroku.com/postgres (max. 10000 radek)</a></li>
						<li><a href="https://free.caspio.com/">https://free.caspio.com/ (ruzny omezeni v zadarmo verzi, ale celkem dost toho je zadarmicko)</a></li>
					</ul>
					<p>ZDARMA NA ROK</p>
					<ul>
						<li><a href="https://azure.microsoft.com/en-us/pricing/details/sql-database/managed">https://azure.microsoft.com/en-us/pricing/details/sql-database/managed</a></li>
						<li>
							<a href="https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Categories=productcategories%23database">
								https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Categories=productcategories%23database
							</a>
						</li>
					</ul>
				  </v-card-text>
                 </v-card>
              	 </v-tab-item>
              	</v-tabs>
            </v-card>
        </v-flex>

    </v-layout>
  </v-container>
</template>

<script>
export default {
  name: "Tips"
}
</script>
