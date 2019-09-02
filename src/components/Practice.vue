<template>
  <v-container grid-list-md>
    <v-layout row wrap>
      <v-flex xs4 text-xs-center>
        <v-chip color="red" label x-large>
          <v-icon left>play_arrow</v-icon>
          <a style="color:white;" href="https://www.start.umd.edu/gtd/">Snowflake</a>
        </v-chip>
        <!-- <img src="../assets/snowflake-logo-blue.png" alt="snowflake" title="snowflake"/> -->
      </v-flex>
      <!-- <v-flex xs9 text-xs-left align-center>
        <a href="https://hu05637.eu-west-1.snowflakecomputing.com/console/login#/" target="_blank">https://hu05637.eu-west-1.snowflakecomputing.com/console/login#/</a>
      </v-flex> -->
      <v-flex xs4 text-xs-center>
        <v-chip color="blue" label x-large>
          <v-icon left>whatshot</v-icon>
          <a style="color:white;" href="https://www.start.umd.edu/gtd/">Teroristi - homepage</a>
        </v-chip>
      </v-flex>
      <!-- <v-flex xs9 text-xs-left align-center>
        <a href="https://www.start.umd.edu/gtd/" target="_blank">https://www.start.umd.edu/gtd/</a>
      </v-flex> -->
      <v-flex xs4 text-xs-center>
        <v-chip class="ma-2" color="green" label x-large>
          <v-icon left>whatshot</v-icon>
          <a style="color:white;" href="https://www.start.umd.edu/gtd/downloads/Codebook.pdf">Teroristi - codebook</a>
        </v-chip>
      </v-flex>
      <!-- <v-flex xs9 text-xs-left align-center>
        <a href="https://www.start.umd.edu/gtd/downloads/Codebook.pdf" target="_blank">https://www.start.umd.edu/gtd/downloads/Codebook.pdf</a>
      </v-flex> -->
      
      <v-flex xs12></v-flex>

      <v-flex xs12>
        <v-card>
          <v-tabs>
            <v-tab>Lekce 1 - Základy</v-tab>
            <v-tab>Lekce 2 - WHERE</v-tab>
            <v-tab>Lekce 3 - JOINY</v-tab>
            <v-tab>Lekce 4 - GROUP BY</v-tab>
            <v-tab>Lekce 5 - HAVING</v-tab>
            <v-tab>Lekce 6 - JOINY II</v-tab>
            <v-tab>Lekce 7 - Window funkce</v-tab>
            <v-tab>Lekce 8 - Vnořené selecty</v-tab>
            <v-tab>Opáčko - Cokoliv si budete přát</v-tab>
          

            <v-tab-item>
              <v-card flat color="basil">
                <v-card-text class="text-left">

                  <v-btn href="https://docs.google.com/presentation/d/17MPoQTt44GuqhpU4P5e0Fx8HBKzF1_tSKd9WW7UQLdw/edit?usp=sharing" target="_blank" color="primary">
                    Prezentace
                    <v-icon right dark>play_arrow</v-icon>
                  </v-btn>

                  <div style="padding: 2em;"></div>

                  <ul>
                    <li v-for="(lecture, i) in lesson_1['lectures']" :key="i">
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="headline">{{ lecture["header"] }}</span>
                        </v-flex>
                        <v-flex class="text-xs-right" xs8>
                          <v-btn color="warning" title="Zobrazit řešení" @click="showClicked('lesson_1', i)" fab small dark outline>
                            <v-icon>{{ lecture['visible'] ? "visibility_off" : "visibility" }}</v-icon>
                          </v-btn>
                        </v-flex>
                        <v-flex xs12>
                          <pre v-if="lecture['visible']" v-highlightjs>
                            <code class="sql">{{ lecture["code"].join('\n') }}</code>
                          </pre>
                        </v-flex>
                      </v-layout>
                    </li>
                  </ul>

                  <v-alert value="info" type="info" color="info" label="info" outline style="margin-bottom: 2em;">
                    ÚKOLY
                  </v-alert>

                  <ol type="A">
                    <li v-for="(task, i) in lesson_1['tasks']" :key="i">
                      <v-layout row wrap>
                        <v-flex xs10>
                          <span class="subheading">{{ task["header"] }}</span>
                        </v-flex>
                        <v-flex class="text-xs-right" xs2>
                          <v-btn color="error" title="Zobazit kód" @click="hintClicked('lesson_1', 'code', i)" fab small dark outline>
                            <v-icon>{{ task['code_visible'] ? "visibility_off" : "visibility" }}</v-icon>
                          </v-btn>
                          <v-btn color="success" title="Zobrazit výsledek" @click="hintClicked('lesson_1', 'screen', i)" fab small dark outline>
                            <v-icon>{{ task['screen_visible'] ? "visibility_off" : "visibility" }}</v-icon>
                          </v-btn>
                        </v-flex>
                        <v-flex xs12>
                          <img v-if="task['screen_visible']" :src="task['screen']" />
                          <pre v-if="task['code_visible']" v-highlightjs>
                            <code class="sql">{{ task["code"] }}</code>
                          </pre>
                        </v-flex>
                      </v-layout>
                    </li>
                  </ol>

                </v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat color="basil">
                <v-card-text class="text-left">
                  <ul>
                    <li v-for="(lesson, i) in lesson_2['lectures']" :key="i">
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="headline">{{ lesson["header"] }}</span>
                        </v-flex>
                        <v-flex class="text-xs-right" xs8>
                          <v-btn color="warning" title="Zobrazit řešení" @click="showClicked('lesson_2', i)" fab small dark outline>
                            <v-icon>{{ lesson['visible'] ? "visibility_off" : "visibility" }}</v-icon>
                          </v-btn>
                        </v-flex>
                        <v-flex xs12>
                          <pre v-if="lesson['visible']" v-highlightjs>
                            <code class="sql">{{ lesson["code"].join('\n') }}</code>
                          </pre>
                        </v-flex>
                      </v-layout>
                    </li>
                  </ul>

                <v-alert value="info" type="info" color="info" label="info" outline>
                  ÚKOLY
                </v-alert>

                <ol type="A">
                    <li v-for="(task, i) in lesson_2['tasks']" :key="i">
                      <v-layout row wrap>
                        <v-flex xs10>
                          <span class="subheading">{{ task["header"] }}</span>
                        </v-flex>
                        <v-flex class="text-xs-right" xs2>
                          <v-btn color="warning" title="Zobrazit nápovědu" @click="hintClicked('lesson_2', i)" fab small dark outline>
                            <v-icon>{{ task['visible'] ? "visibility_off" : "visibility" }}</v-icon>
                          </v-btn>
                        </v-flex>
                        <v-flex xs12>
                          <pre v-if="task['visible']" v-highlightjs>
                            <code class="sql">{{ task["hints"].join('\n') }}</code>
                          </pre>
                        </v-flex>
                      </v-layout>
                    </li>
                  </ol>
                </v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat color="basil">
                <v-card-text>
                  JOINY I

                  <v-alert value="info" type="info" color="info" label="info" outline>
                    ÚKOLY
                  </v-alert>

                  <ol type="A">
                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="subheading">Vypis eventdate, gname, nkill, nwound z tabulky teror2 (!) a pres sloupecek country pripoj zemi z tabulky country</span>
                        </v-flex>
                      </v-layout>
                    </li>
                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="subheading">Vypis eventdate, gname, nkill, nwound z tabulky teror2 (!) a 
                            -- -pres sloupecek country pripoj zemi z tabulky country
                            -- -pres sloupecek weaptype1 pripoj weaptype1 z tabulky weaptype1
                            -- -pres sloupecek weaptype2 pripoj weaptype2 z tabulky weaptype2</span>
                        </v-flex>
                      </v-layout>
                    </li>
                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="subheading">
                            Vypis eventdate, gname, nkill, nwound z tabulky teror2 (!) a 
                            -- -pres sloupecek country pripoj zemi z tabulky country
                            -- -pres sloupecek weaptype1 pripoj weaptype1 z tabulky weaptype1
                            -- -pres sloupecek weaptype2 pripoj weaptype2 z tabulky weaptype2
                            -- vypis jen utoky jejichz sekundarni zbran byla zapalna ('Incendiary')
                          </span>
                        </v-flex>
                      </v-layout>
                    </li>
                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="subheading">
                            Z tabulky teror2 vypis pocet utoku, pocty mrtvych a ranenych v roce 2016 -- podle pouzitych zbrani (WEAPTYPE1)
                          </span>
                        </v-flex>
                      </v-layout>
                    </li>
                  </ol>
                </v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat color="basil">
                <v-card-text>
                  GROUP BY
                  <v-alert value="info" type="info" color="info" label="info" outline>
                    ÚKOLY
                  </v-alert>

                  <ol>
                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="subheading">Zjisti počet obětí a raněných po letech</span>
                        </v-flex>
                      </v-layout>
                    </li>
                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="subheading">Zjisti počet obětí a raněných v západní Evropě po letech a měsících</span>
                        </v-flex>
                      </v-layout>
                    </li>
                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="subheading">Zjisti počet útoků po zemích. Seřaď je podle počtu útoků sestupně</span>
                        </v-flex>
                      </v-layout>
                    </li>
                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="subheading">Zjisti počet útoků po zemích a letech, seřaď je podle počtu útoků sestupně</span>
                        </v-flex>
                      </v-layout>
                    </li>
                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="subheading">(Chytak) Kolik která organizace spáchala útoků zápalnými zbraněmi (weaptype1_txt = 'Incendiary'), kolik při nich celkem zabila obětí, kolik zemřelo teroristů a kolik lidí bylo zraněno (nkill, nkillter, nwound)</span>
                        </v-flex>
                      </v-layout>
                    </li>
                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="subheading">Stejné jako 4e, jen ve výsledném výpisu chceme jen organizace, které zápalnými útoky zranily 50 a více lidí a nechceme tam vidět “organizaci” Unknown</span>
                        </v-flex>
                      </v-layout>
                    </li>
                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="subheading">Vypište celkový počet útoků podle druhu zbraně weaptype1_txt , počet mrtvých, mrtvých teroristů, průměrný počet mrtvých, průměrný počet mrtvých teroristů, kolik mrtvých obětí připadá na jednoho mrtvého teroristu a kolik zraněných...</span>
                        </v-flex>
                      </v-layout>
                    </li>
                  </ol>
                </v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat color="basil">
                <v-card-text>
                    HAVING
                    <v-alert value="info" type="info" color="info" label="info" outline>
                      ÚKOLY
                    </v-alert>
                </v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat color="basil">
                <v-card-text>
                  JOINY II
                  <v-alert value="info" type="info" color="info" label="info" outline>
                    ÚKOLY
                  </v-alert>
                </v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat color="basil">
                <v-card-text>
                  celodenni I - window funkce

                  Příklad:

                  select * from
                  (select gname, eventdate from teror
                  where country = 54) as subselect;

                  with cte 
                  as
                  (select gname, eventdate from teror
                  where country = 54)
                  select * from cte;

                  <v-alert value="info" type="info" color="info" label="info" outline>
                    ÚKOLY
                  </v-alert>

                  <ol type="A">
                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="subheading">
                            Vyber z tabulky teror2 'Assassination'  útoky (attacktype1 , attacktype2, attacktype3) jejichž země je bud Kolumbie, Somálsko, nebo Indie nebo je země (tabulka country - sloupecek countrytype) typu ‘Target country’. Prvni dva sloupečky budou name a countrytype z tabulky country a všechny sloupečky z tabulky terror2
                          </span>
                        </v-flex>
                      </v-layout>
                    </li>
                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="subheading">
                            spoj tabulku teror2 se subselectem nad tabulkou country (tak abychom dostali všechny řádky z tabulky teror2), který z ní vyřadí všechny země které v CountryType mají ‘Not interested’, vypiš eventdate, gname, nkill, nwound, city, country z teror2 a name (prejmenovany na country_txt) ze subselectu
                          </span>
                        </v-flex>
                      </v-layout>
                    </li>
                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="subheading">
                            to same co 5a/ jen s pomoci CTE (with)
                          </span>
                        </v-flex>
                      </v-layout>
                    </li>
                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="subheading">
                            vyberte vsechny organizace, ktere nespachaly zadny utok v evrope
                          </span>
                        </v-flex>
                      </v-layout>
                    </li>
                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="subheading">
                            vyberte vsechny organizace, které nezopakovaly útok mimo Evropu (spáchaly maximálně jeden mimoevropsky útok)
                            u kazde vypiste tri utoky s nejvetsim poctem obeti
                            do vypisu dejte gname, nwound, nkill, city a zemi pripojenou z tabulky country pres sloupecek id
                          </span>
                        </v-flex>
                      </v-layout>
                    </li>
                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="subheading">
                            co dělá následující select?
                            WITH SUCORG AS
                            (SELECT GNAME FROM TEROR2
                            WHERE NKILL > 0
                            GROUP BY GNAME
                            HAVING COUNT(1) > 5)
                            , SERAZENO AS
                            (SELECT 
                            GNAME, NKILL, IFNULL(NKILL, 0), NWOUND, EVENTDATE, COUNTRY, CITY, ROW_NUMBER() OVER (PARTITION BY GNAME ORDER BY IFNULL(NKILL, 0) DESC) RN
                            FROM TEROR2
                            WHERE GNAME IN (SELECT GNAME FROM SUCORG)
                            )
                            SELECT S.GNAME, S.NKILL, S.NWOUND, S.EVENTDATE, S.CITY,  C.NAME COUNTRY
                            FROM SERAZENO S LEFT JOIN COUNTRY C ON S.COUNTRY = C.ID
                            WHERE S.RN <= 3
                            ORDER BY S.GNAME, NKILL DESC;
                          </span>
                        </v-flex>
                      </v-layout>
                    </li>
                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="subheading">
                            tři největší útoky pro organizace s víc než 500 obětmi
                          </span>
                        </v-flex>
                      </v-layout>
                    </li>
                  </ol>
                </v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat color="basil">
                <v-card-text>
                  celodenni II - vnorene selecty
                  <v-alert value="info" type="info" color="info" label="info" outline>
                    ÚKOLY
                  </v-alert>
                </v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat color="basil">
                <v-card-text>Cokoliv si budete přát</v-card-text>
              </v-card>
            </v-tab-item>
          </v-tabs>
        </v-card>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import Vue from 'vue'

export default {
  name: "Practice",
  data() {
    return {
      lesson_1: {
        lectures: [
          {
            header: "První select",
            visible: false,
            code: ["SELECT 1;   -- vybere 1",
                    " SELECT '1'; -- vybere '1'"]
          },
          {
            header: "Kalkulačka?",
            visible: false,
            code: ["SELECT 25 * 30; -- 750",
                    " SELECT 25 * 0;  -- 0",
                    " SELECT 25 / 2.5; -- 10.0",
                    " SELECT 25/0; -- division by zero"]
          },
          {
            header: "Všechno",
            visible: false,
            code: ["SELECT * FROM teror; -- vybere vsechny sloupce a radky z tabulky teror"]
          },
          {
            header: "Omezení výběru sloupečku",
            visible: false,
            code: ["SELECT nkillter FROM teror; -- vybere pouze sloupec nkillter z tabulky teror"]
          },
          {
            header: "Filtrovaní řádek",
            visible: false,
            code: ["SELECT nkillter FROM teror WHERE nkillter > 100; -- vybere vsechny radky, kde je nkillter vetsi jak 100"]
          },
          {
            header: "Přejmenovaní sloupečku",
            visible: false,
            code: ["SELECT nkillter AS zabito_teroristu FROM teror; -- prejmenuje sloupecek nkillter na zabito_teroristu",
                    " SELECT nkillter AS \"zabito teroristu\" FROM teror; -- prejmenuje sloupecek nkillter na zabito teroristu"]
          },
          {
            header: "Spojeni sloupečků",
            visible: false,
            code: ["SELECT mesto || stat FROM teror;"]
          },
          {
            header: "Násobení sloupečků",
            visible: false,
            code: ["SELECT nkill * 3 + FROM teror;"]
          }
        ],
        tasks: [
          {
            header: "Vyber vše z tabulky terror",
            code: "SELECT * FROM TEROR;",
            code_visible: false,
            screen: "/img/snowflake-logo-blue.png",
            screen_visible: false
          },
          {
            header: "Zobraz prvních deset řádek z tabulky TEROR",
            code: "SELECT * FROM TEROR LIMIT 10;",
            code_visible: false,
            screen: "/img/snowflake-logo-blue.png",
            screen_visible: false

          },
          {
            header: "Zobraz všechny sloupečky z tabulky TEROR",
            code: "SELECT * FROM TEROR;",
            code_visible: false,
            screen: "/img/snowflake-logo-blue.png",
            screen_visible: false
          },
          {
            header: "Vyber z tabulky útoky v Německu, kde zemřel alespoň jeden terorista",
            visible: false,
            hints: [
              "lesson_1_task_1.png",
              "SELECT * FROM terror WHERE nkillter > 0 and countrytxt = 'Germany';"
            ]
          },
          {
            header: "Zobraz jen sloupečky GNAME, COUNTRY_TXT, NKILL a všechny řádky (seřazené podle počtu obětí sestupně), na kterých je víc než 340 obětí (počet obětí je ve sloupci NKILL), sloupečky přejmenuj na ORGANIZACE, ZEME, POCET_OBETI",
            visible: false,
            hints: []
          },
          {
            header: "Zobraz sloupečky IYEAR, IMONTH, IDAY, GNAME, CITY, ATTACKTYPE1_TXT, TARGTYPE1_TXT, WEAPTYPE1_TXT, WEAPDETAIL, NKILL, NWOUND a vyber jen útoky, které se staly v Czech Republic v letech 2015, 2016 a 2017. Všechna data seřaď chronologicky sestupně",
            visible: false,
            hints: []
          },
          {
            header: "Vypiš všechny organizace, které na jakémkoliv místě v názvu obsahují výraz „anti“ a výraz „extremists“",
            visible: false,
            hints: []
          }
        ],
      },
      lesson_2: {
        lectures: [
          {
            header: "Limit",
            visible: false,
            code: ["SELECT * FROM TEROR LIMIT 10; -- vybere 10 nahodnych radku z tabulky TEROR"] 
          },
          {
            header: "Distinct",
            visible: false,
            code: ["SELECT DISTINCT(country_txt) FROM TEROR; -- vybere unikatni hodnoty ve sloupi country_txt z tabulky TEROR"] 
          },
          {
            header: "Count",
            visible: false,
            code: ["SELECT COUNT(*) FROM TEROR; -- spocita pocet radku v tabulce TEROR",
                    "SELECT COUNT(*) FROM TEROR LIMIT 10;"] 
          },
          {
            header: "Where (string function)",
            visible: false,
            code: ["SELECT SPLIT('127.0.0.1', '.');",
                    "SELECT SPLIT(city, ' ') FROM TEROR; -- vybere vsechny mesta a rozdeli je podle posctu slov",
                    "SELECT city FROM TEROR WHERE ARRAY_SIZE(SPLIT(city, ' ')) > 2; -- vybere vsechny mesta, ktera maji vice jak 2 slova"] 
          },
          {
            header: "Where (math function)",
            visible: false,
            code: [] 
          },
          {
            header: "Where (date function)",
            visible: false,
            code: [] 
          },
          {
            header: "Where and or and or ((())",
            visible: false,
            code: [] 
          },
          {
            header: "Like, ilike",
            visible: false,
            code: [] 
          },
          {
            header: "Between",
            visible: false,
            code: [] 
          }
        ],
        tasks: [
          {
            header: "Vyber vše z tabulky terror",
            visible: false,
            hints: [
              "lesson_1_task_1.png",
              "SELECT * FROM TEROR;"
            ]
          },
          {
            header: "Z iYear, iMonth a iDay vytvořte sloupeček datum a vypište tohle datum a pak datum o tři měsíce později a klidně i o tři dny a tři měsíce",
            visibility: false,
            hints: []
          },
          {
            header: "Vypiš všechny druhy útoků ATTACKTYPE1_TXT",
            visibility: false,
            hints: []
          },
          {
            header: "Vypiš všechny útoky v Německu v roce 2015, vypiš sloupečky IYEAR, IMONTH, IDAY, COUNTRY_TXT, REGION_TXT, PROVSTATE, CITY, NKILL, NKILLTER, NWOUND. Ve sloupečku COUNTRY_TXT bude všude hodnota ‘Německo’",
            visibility: false,
            hints: []
          },
          {
            header: "Vypiš všechny útoky z roku 2014, ke kterým se přihlásil Islámský stát ('Islamic State of Iraq and the Levant (ISIL)').Vypiš sloupečky IYEAR, IMONTH, IDAY, GNAME, COUNTRY_TXT, REGION_TXT, PROVSTATE, CITY, NKILL, NKILLTER, NWOUND a na konec přidej sloupeček EventImpact, který bude obsahovat:\n'Massacre' pro útoky s víc než 1000 obětí</li>\n'Bloodbath' pro útoky s 501 - 1000 obětmi\n'Carnage' pro ůtoky s 251 - 500 obětmi\n'Blodshed' pro útoky se 100 - 250 obětmi\n'Slaugter' pro útoky s 1 - 100 obětmi\na ‘N/A’ pro všechny ostatní útoky.</li>",
            visibility: false,
            hints: []
          },
          {
            header: "Vypiš všechny útoky s alespoň jednou obětí z Německa, Rakouska, Švýcarska, Francie a Itálie. U Německa, Rakouska, Švýcarska nahraď region_txt za ‘DACH’ u zbytku nech původní region. Vypiš sloupečky IYEAR, IMONTH, IDAY, COUNTRY_TXT, REGION_TXT, PROVSTATE, CITY, NKILL, NKILLTER, NWOUND. Výstup seřaď podle počtu raněných sestupně",
            visibility: false,
            hints: []
          },
          {
            header: "Vypiš COUNTRY_TXT, CITY, NWOUND a přidej sloupeček vzdalenost_od_albertova obsahující vzdálenost místa útoku z pražské části Albertov v km a sloupeček kategorie obsahující ‘Blízko’ pro útoky bližší 2000 km a ‘Daleko’ pro ostatní. Vypiš jen útoky s víc než stovkou raněných a seřad je podle vzdálenosti od Albertova",
            visibility: false,
            hints: []
          },
        ]
      }  
    }
  },
  methods: {
    showClicked(lesson, index) {
      Vue.set(this[lesson]['lectures'][index], 'visible', !this[lesson]['lectures'][index]['visible']);
    },
    hintClicked(lesson, type, index) {
      console.log(this[lesson]['tasks'][index])
      Vue.set(this[lesson]['tasks'][index], type + '_visible', !this[lesson]['tasks'][index][type + '_visible']);
    }
  }
}
</script>