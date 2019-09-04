<,template>
  <v-container fluid fill-height>
    <v-layout>
        <v-flex>
           <!-- <h1>Bude pripraveno Monikou Vlckovou :)</h1> -->
			
            <v-card>
            	<v-tabs>
              	<v-tab>Barevnej select</v-tab>
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
