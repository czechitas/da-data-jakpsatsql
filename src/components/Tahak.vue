<template>
  <v-container fluid fill-height>
    <v-layout>
        <v-flex>
           <h1>Bude pripraveno Monikou Vlckovou :)</h1>


            <v-card>
            	<v-tabs>
              	<v-tab>Barevnej select</v-tab>
              	<v-tab>Tildy a chlupatý závorky</v-tab>

              	<v-tab-item>
                 <v-card flat color="basil">
                  	<v-card-text>
                      Psaní selektů podléhá nekompromisním pravidlům. Jinak řečeno, záleží na pořadí klíčových slov. Následující "šablona" ukazuje tato pravidla na příkladu. 
                    </v-card-text>
                    <v-card-text>
                    	<pre v-highlightjs><code class="sql">
-- všechno, co je za dvěma pomlčkami až do konce řádku je komentář, tedy to engine ignoruje
/*
víceřádkové komentáře vypadají
takhle
*/
SELECT	--příkazem SELECT enginu říkáme, že chceme aby nám ukázal/vypsal data
nas_sloupecek1, nas_sloupecek2, nas_sloupecek3 AS datum, 
	/* vyjmenováním sloupečků říkáme, které chceme vidět, oddělujeme je 		
	čárkami, můžeme taky použít alias (AS) */
funkce(nas_sloupecek1) AS s1	--použitím funkcí můžeme zobrazené sloupečky měnit, kombinovat apod.
FROM	-- když chceme “selectovat” musíme enginu říct odkud
nase_tabulka
	/* nejjednodušší je výběr dat z jedné tabulky, za klíčovým slovem 	
	FROM můžeme ale i joinovat tabulky, nebo používat vnořené selecty */
WHERE	/* za WHERE patří podmínky (filtry) určující, které řádky engine vybere, 
	i 	tady můžeme použít funkce a kombinovat sloupečky */
((nas_sloupecek1 = 'textova hodnota')
OR
(nas_sloupecek2 = 11))
AND
funkce(nas_sloupecek3) > '2001-09-11'
GROUP BY 
	/* pokud chceme použít agregační funkce musíme enginu říct podle kterých
	sloupečků má data agregovat */
HAVING	/*filtrje skupinky poDLE AGREGACNICH FUNKCI, TREBA NULOVY SOUCET POCTU 
	MRTVYCH, CENY APOD.*/
nas_sloupecek1, nas_sloupecek2, nas_sloupecek3
ORDER BY 	/* pokud chceme data řadit musíme enginu říct podle kterých sloupečků */
nas_sloupecek1, nas_sloupecek2, nas_sloupecek3
LIMIT 11	-- nakonec můžeme omezit počet řádek, které chceme zobrazit 

                    	</code></pre>
					</v-card-text>
                 </v-card>
              	 </v-tab-item>

              	 <v-tab-item>
                 <v-card flat color="basil">
                  <v-card-text>Středníky a spol</v-card-text>
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
  name: "Tahak"
}
</script>