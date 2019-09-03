<template>
  <v-container grid-list-md>
    <v-layout row wrap>
      <v-flex xs3 text-xs-center>
        <a href="https://www.snowflake.com/" target="_blank"><img src="../assets/snowflake-logo-blue.png" alt="snowflake" title="snowflake"/></a>
      </v-flex>
      <v-flex xs6 text-xs-center>
        <a class="title" href="https://hu05637.eu-west-1.snowflakecomputing.com/console/login#/" target="_blank">https://hu05637.eu-west-1.snowflakecomputing.com/console/login#/</a>
      </v-flex>
      <v-flex xs3 text-xs-center>
        <span class="title">Prihlaseni: PRIJMENI/Heslo1Heslo2</span>
      </v-flex>
      <v-flex xs3 text-xs-center>
        <a class="title" href="https://www.start.umd.edu/gtd/" target="_blank"><img src="../assets/gtd-logo.gif" alt="snowflake" title="snowflake"/></a>
      </v-flex>
      <v-flex xs6 text-xs-center>
        <a class="title" href="https://www.start.umd.edu/gtd/" target="_blank">https://www.start.umd.edu/gtd/</a>
      </v-flex>
      <v-flex xs3 text-xs-center>
        <a class="title" href="https://www.start.umd.edu/gtd/downloads/Codebook.pdf" target="_blank">Codebook</a>
      </v-flex>

      <v-flex xs12>
        <v-card>
          <v-tabs>
            <v-tab v-for="(lesson, i) in lessons" :key="i">{{ "Lekce " + (i + 1) + " - " + lesson.name }}</v-tab>

            <v-tab-item v-for="(lesson, lesson_index) in lessons" :key="lesson_index">
              <v-card flat color="basil">
                <v-card-text class="text-left">
                  
                  <div v-if="lesson_index == 0" style="padding-bottom: 2em;">
                    <v-btn href="https://docs.google.com/presentation/d/17MPoQTt44GuqhpU4P5e0Fx8HBKzF1_tSKd9WW7UQLdw/edit?usp=sharing" target="_blank" color="primary">
                      Prezentace
                      <v-icon right dark>play_arrow</v-icon>
                    </v-btn>
                  </div>

                  <ul>
                    <li v-for="(lecture, lecture_index) in lesson['lectures']" :key="lecture_index">
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="headline">{{ lecture["header"] }}</span>
                          <ul>
                             <li v-for="(note, note_index) in lecture['notes']" :key="note_index">{{ note }}</li>
                          </ul>
                        </v-flex>
                        <v-flex class="text-xs-right" xs8>
                          <v-btn color="warning" title="Zobrazit řešení" @click="showClicked(lesson_index, lecture_index)" fab small dark outline>
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
                    <li v-for="(task, task_index) in lesson['tasks']" :key="task_index">
                      <v-layout row wrap>
                        <v-flex xs10>
                          <span class="subheading">{{ task["header"] }}</span>
                        </v-flex>
                        <v-flex class="text-xs-right" xs2>
                          <v-btn color="error" title="Zobazit kód" @click="hintClicked(lesson_index, 'code', task_index)" fab small dark outline>
                            <v-icon>{{ task['code_visible'] ? "visibility_off" : "visibility" }}</v-icon>
                          </v-btn>
                          <v-btn color="success" title="Zobrazit výsledek" @click="hintClicked(lesson_index, 'screen', task_index)" fab small dark outline>
                            <v-icon>{{ task['screen_visible'] ? "visibility_off" : "visibility" }}</v-icon>
                          </v-btn>
                        </v-flex>
                        <v-flex xs12>
                          <viewer style="cursor: zoom-in;" v-if="task['screen_visible']" :images="[task['screen']]" :options="viewerOptions">
                            <img :src="task['screen']">
                          </viewer>
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
          </v-tabs>
        </v-card>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import Vue from 'vue'
import 'viewerjs/dist/viewer.css'
import Viewer from 'v-viewer'
Vue.use(Viewer)

export default {
  name: "Practice",
  data() {
    return {
      viewerOptions: { "toolbar": false, "navbar": false, "title": false },
      lessons: [
        {
          name: "Základy",
          lectures: [
            {
              header: "První select",
              notes: ["klíčová slova", "velikost písmen"],
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
              header: "Limit",
              visible: false,
              code: ["SELECT * FROM teror LIMIT 10; -- vybere 10 nahodnych radku z tabulky teror"] 
            },
            {
              header: "Distinct",
              visible: false,
              code: ["SELECT DISTINCT(country_txt) FROM teror; -- vybere unikatni hodnoty ve sloupi country_txt z tabulky teror"] 
            },
            {
              header: "Count",
              visible: false,
              code: ["SELECT COUNT(*) FROM teror; -- spocita pocet radku v tabulce teror"] 
            },
            {
              header: "Order by",
              notes: ["DESC", "ASC"],
              visible: false,
              code: ["SELECT nkillter FROM teror ORDER BY nkillter; -- vypise radky serazene podle sloupce nkillter"] 
            },
            {
              header: "Přejmenovaní sloupečku",
              notes: ["uvozovky ' vs \""],
              visible: false,
              code: ["SELECT nkillter AS zabito_teroristu FROM teror; -- prejmenuje sloupecek nkillter na zabito_teroristu",
                      " SELECT nkillter AS \"zabito teroristu\" FROM teror; -- prejmenuje sloupecek nkillter na zabito teroristu"]
            },
            {
              header: "Spojení sloupečků",
              visible: false,
              code: ["SELECT city || country_txt FROM teror;", " SELECT CONCAT(city,country_txt) FROM teror;"]
            },
            {
              header: "Násobení sloupečků",
              visible: false,
              code: ["SELECT nkill * 3 + nwound FROM teror;"]
            },
            {
              header: "Filtrovaní řádek",
              visible: false,
              code: ["SELECT nkillter FROM teror WHERE nkillter > 100; -- vybere vsechny radky, kde je nkillter vetsi jak 100"]
            },
          ],
          tasks: [
            {
              header: "Vyber vše z tabulky terror",
              code: "SELECT * FROM teror;",
              code_visible: false,
              screen: require("@/assets/lessons/1/tasks/A.png"),
              screen_visible: false
            },
            {
              header: "Zobraz prvních deset řádek z tabulky teror",
              code: "SELECT * FROM teror LIMIT 10;",
              code_visible: false,
              screen: require("@/assets/lessons/1/tasks/A.png"),
              screen_visible: false

            },
            {
              header: "Vypiš jen sloupce eventid, iyear, counry_txt, region_txt",
              code: "SELECT eventid,iyear,country_txt,region_txt FROM teror;",
              code_visible: false,
              screen: require("@/assets/lessons/1/tasks/B.png"),
              screen_visible: false

            },
            {
              header: "Vypiš všechny roky vyskytující se v tabulce teror tak aby byl každý rok ve výsledné tabulce jen jednou",
              code: "SELECT DISTICT iyear FROM teror;",
              code_visible: false,
              screen: require("@/assets/lessons/1/tasks/C.png"),
              screen_visible: false

            },
            {
              header: "Vyber všechny teroristické útoky v roce 2016",
              code: "SELECT * FROM teror WHERE iyear=2016;",
              code_visible: false,
              screen: require("@/assets/lessons/1/tasks/D.png"),
              screen_visible: false

            },
            {
              header: "Vypiš všechny útoky za rok 2015 a vyber pouze sloupce eventid, iyear, counry_txt, region_txt a přejmenuj je na udalost, rok, zeme, region",
              code: "SELECT eventid as udalost,iyear as rok,country_txt as zeme,region_txt as region from teror where iyear=2015;",
              code_visible: false,
              screen: require("@/assets/lessons/1/tasks/E.png"),
              screen_visible: false

            },
            {
              header: "Vyber všechny události v roce 2014 a vyber pouze sloupce iyear, imont a iday. Spoj je do jednoho sloupce oddělené pomlčkou a pojmenuj ho datum",
              code: "SELECT iyear||'-'||imonth||'-'||iday as datum FROM teror WHERE iyear=2014;",
              code_visible: false,
              screen: require("@/assets/lessons/1/tasks/F.png"),
              screen_visible: false

            },
            {
              header: "Seřaď datum z předchozího selektu sestupně (desc) a vypiš jen jedinečné záznamy",
              code: "SELECT DISTINCT iyear||'-'||imonth||'-'||iday as datum FROM teror WHERE iyear=2014 ORDER BY datum DESC;",
              code_visible: false,
              screen: require("@/assets/lessons/1/tasks/G.png"),
              screen_visible: false

            },
            {
              header: "Vypiš počet teroristických utoků které se staly po roce 2015",
              code: "SELECT count(*) FROM teror WHERE iyear>2015;",
              code_visible: false,
              screen: require("@/assets/lessons/1/tasks/H.png"),
              screen_visible: false

            },
            /* {
              header: "Zobraz všechny sloupečky z tabulky teror",
              code: "SELECT * FROM teror;",
              code_visible: false,
              screen: require("@/assets/lessons/1/tasks/C.png"),
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
            } */
          ],
        },
        {
          name: "WHERE",
          lectures: [
            {
              header: "Where (string function)",
              visible: false,
              code: ["SELECT SPLIT('127.0.0.1', '.');",
                     " SELECT SPLIT(city, ' ') FROM teror; -- vybere vsechny mesta a rozdeli je podle posctu slov",
                     " SELECT city FROM teror WHERE ARRAY_SIZE(SPLIT(city, ' ')) > 2; -- vybere vsechny mesta, ktera maji vice jak 2 slova"] 
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
              code_visible: false,
              code: "SELECT * FROM teror;",
              screen: "lesson_1_task_1.png",
              screen_visible: false,
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
        },
        {
          name: "JOINY",
          lectures: [

          ],
          tasks: [
            {
              header: "Vypis eventdate, gname, nkill, nwound z tabulky teror2 (!) a pres sloupecek country pripoj zemi z tabulky country",
            },
            {
              header: "Vypis eventdate, gname, nkill, nwound z tabulky teror2 (!) a -pres sloupecek country pripoj zemi z tabulky country -pres sloupecek weaptype1 pripoj weaptype1 z tabulky weaptype1 -pres sloupecek weaptype2 pripoj weaptype2 z tabulky weaptype2",
            },
            {
              header: "Vypis eventdate, gname, nkill, nwound z tabulky teror2 (!) a  -pres sloupecek country pripoj zemi z tabulky country -pres sloupecek weaptype1 pripoj weaptype1 z tabulky weaptype1 -pres sloupecek weaptype2 pripoj weaptype2 z tabulky weaptype2 -- vypis jen utoky jejichz sekundarni zbran byla zapalna ('Incendiary')",
            },
            {
              header: "Z tabulky teror2 vypis pocet utoku, pocty mrtvych a ranenych v roce 2016 -- podle pouzitych zbrani (WEAPTYPE1)",
            }
          ]
        },
        {
          name: "GROUP BY",
          tasks: [
            {
              header: "Zjisti počet obětí a raněných po letech",
            },
            {
              header: "Zjisti počet obětí a raněných v západní Evropě po letech a měsících<",
            },
            {
              header: "Zjisti počet útoků po zemích. Seřaď je podle počtu útoků sestupně",
            },
            {
              header: "Zjisti počet útoků po zemích a letech, seřaď je podle počtu útoků sestupně",
            },
            {
              header: "(Chytak) Kolik která organizace spáchala útoků zápalnými zbraněmi (weaptype1_txt = 'Incendiary'), kolik při nich celkem zabila obětí, kolik zemřelo teroristů a kolik lidí bylo zraněno (nkill, nkillter, nwound)",
            },
            {
              header: "Stejné jako 4e, jen ve výsledném výpisu chceme jen organizace, které zápalnými útoky zranily 50 a více lidí a nechceme tam vidět “organizaci” Unknown",
            },
            {
              header: "Vypište celkový počet útoků podle druhu zbraně weaptype1_txt , počet mrtvých, mrtvých teroristů, průměrný počet mrtvých, průměrný počet mrtvých teroristů, kolik mrtvých obětí připadá na jednoho mrtvého teroristu a kolik zraněných...",
            }
          ]
        },
        {
          name: "HAVING",
          tasks: [
            {
              header: "",
            }
          ]
        },
        {
          name: "JOINY II", 
        },
        {
          name: "Window funkce",
          lectures: [
            {
              header: "Příklad: select * from (select gname, eventdate from teror where country = 54) as subselect; with cte as (select gname, eventdate from teror where country = 54)select * from cte;",
              visible: false,
            },
          ],
          tasks: [
            {
              header: "Vyber z tabulky teror2 'Assassination'  útoky (attacktype1 , attacktype2, attacktype3) jejichž země je bud Kolumbie, Somálsko, nebo Indie nebo je země (tabulka country - sloupecek countrytype) typu ‘Target country’. Prvni dva sloupečky budou name a countrytype z tabulky country a všechny sloupečky z tabulky terror2",
            },
            {
              header: "spoj tabulku teror2 se subselectem nad tabulkou country (tak abychom dostali všechny řádky z tabulky teror2), který z ní vyřadí všechny země které v CountryType mají ‘Not interested’, vypiš eventdate, gname, nkill, nwound, city, country z teror2 a name (prejmenovany na country_txt) ze subselectu",
            },
            {
              header: "to same co 5a/ jen s pomoci CTE (with)",
            },
            {
              header: "vyberte vsechny organizace, ktere nespachaly zadny utok v evrope",
            },
            {
              header: "vyberte vsechny organizace, které nezopakovaly útok mimo Evropu (spáchaly maximálně jeden mimoevropsky útok) u kazde vypiste tri utoky s nejvetsim poctem obeti do vypisu dejte gname, nwound, nkill, city a zemi pripojenou z tabulky country pres sloupecek id",
            },
            {
              header: "co dělá následující select? WITH SUCORG AS (SELECT GNAME FROM teror2 WHERE NKILL > 0 GROUP BY GNAME HAVING COUNT(1) > 5), SERAZENO AS" +
                      "(SELECT GNAME, NKILL, IFNULL(NKILL, 0), NWOUND, EVENTDATE, COUNTRY, CITY, ROW_NUMBER() OVER (PARTITION BY GNAME ORDER BY IFNULL(NKILL, 0) DESC) RN" +
                      "FROM teror2 WHERE GNAME IN (SELECT GNAME FROM SUCORG))" +
                      "SELECT S.GNAME, S.NKILL, S.NWOUND, S.EVENTDATE, S.CITY,  C.NAME COUNTRY" +
                      "FROM SERAZENO S LEFT JOIN COUNTRY C ON S.COUNTRY = C.ID" +
                      "WHERE S.RN <= 3" +
                      "ORDER BY S.GNAME, NKILL DESC;",
            },
            {
              header: "tři největší útoky pro organizace s víc než 500 obětmi",
            }
          ]
        },
        {
          name: "Vnořené selecty", 
        },
        {
          name: "Opáčko", 
        }
      ]
    }
  },
  methods: {
    showClicked(lesson_index, lecture_index) {
      Vue.set(this.lessons[lesson_index]['lectures'][lecture_index], 'visible', !this.lessons[lesson_index]['lectures'][lecture_index]['visible']);
    },
    hintClicked(lesson_index, hint_type, hint_index) {
      Vue.set(this.lessons[lesson_index]['tasks'][hint_index], hint_type + '_visible', !this.lessons[lesson_index]['tasks'][hint_index][hint_type + '_visible']);
    }
  }
}
</script>