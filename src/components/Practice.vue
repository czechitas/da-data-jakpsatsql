<template>
  <v-container grid-list-md>
    <v-layout row wrap>
      <v-flex xs12 md4 lg4>
        <v-list class="pa-0">
          <v-list-item>
            <v-list-item-avatar>
              <img src="../assets/practice/snowflake-logo.png">
            </v-list-item-avatar>

            <v-list-item-content>
              <v-list-item-title>Snowflake</v-list-item-title>
              <v-list-item-subtitle><a href="https://revolt_bi_partner.eu-central-1.snowflakecomputing.com/console/login#/" target="_blank">https://revolt_bi_partner.eu-central-1.snowflakecomputing.com/console/login#/</a></v-list-item-subtitle>
              <v-list-item-subtitle>Prihlaseni: czechita_prijmenik   (k je 1. písmeno křestního jména)</v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-flex>
      <v-flex xs12 md4 lg4>
        <v-list class="pa-0">
          <v-list-item>
            <v-list-item-avatar>
              <img src="../assets/practice/gtb-logo.jpg">
            </v-list-item-avatar>

            <v-list-item-content>
              <v-list-item-title>Global Terrorism Database (GTD)</v-list-item-title>
              <v-list-item-subtitle><a href="https://www.start.umd.edu/gtd/" target="_blank">https://www.start.umd.edu/gtd/</a></v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-flex>
      <v-flex xs12 md4 lg4>
        <v-list class="pa-0">
          <v-list-item>
            <v-list-item-avatar>
              <img src="../assets/practice/gtb-logo.jpg">
            </v-list-item-avatar>

            <v-list-item-content>
              <v-list-item-title>GTD - Codebook</v-list-item-title>
              <v-list-item-subtitle><a href="https://www.start.umd.edu/gtd/downloads/Codebook.pdf" target="_blank">https://www.start.umd.edu/gtd/downloads/Codebook.pdf</a></v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item>
        </v-list>
       </v-flex>
      
      <v-flex xs12></v-flex>

      <v-flex xs12>
        <v-card>
          <v-tabs>
            <v-tab v-for="(lesson, i) in lessons" :key="i">{{ "Lekce " + (i + 1) + " - " + lesson.name }}</v-tab>

            <v-tab-item v-for="(lesson, lesson_index) in lessons" :key="lesson_index">
              <v-card flat color="basil">
                <v-card-text class="text-left">
                  
                  <div v-if="lesson_index == 0" style="padding-bottom: 2em;">
                    <center>
                      <v-btn href="https://docs.google.com/presentation/d/1i6WRNuwMw4MuwBl2guX7sIBP3aspdHDzcAq4LbmTAnk/edit?usp=sharing" target="_blank" color="primary">
                        Prezentace
                        <v-icon right dark>mdi-play</v-icon>
                      </v-btn>
                    </center>
                  </div>

                  <div v-if="lesson_index == 3" style="padding-bottom: 2em;">
                    <center>
                      <v-btn href="https://drive.google.com/file/d/1Etyhq-gBka5-K1do905Q5SXLF-CdEPoh/view?usp=sharing" target="_blank" color="primary">
                        Join Bingo
                        <v-icon right dark>mdi-play</v-icon>
                      </v-btn>
                      <viewer style="cursor: zoom-in;"  :images="['../assets/practice/join.svg']" :options="viewerOptions">
                        <img src="../assets/practice/join.svg" alt="join" title="join" />
                      </viewer>
                      <v-alert color="info" outlined style="margin-bottom: 2em;">
                      <div class="headline">
                      SELECT
                        <span style="color: #ff0000;">eventid, eventdate, country, gname,</span>
                        <span style="color: #6aa84f;"> c.*</span>
                        FROM <span style="color: #ff0000;">teror2</span> AS <span style="color: #ff0000;">t2</span>
                        LEFT JOIN <span style="color: #6aa84f;">country</span> AS <span style="color: #6aa84f;">c</span>
                        &nbsp;<span style="color: #0000ff;">ON t2.country = c.id</span>
                      </div>
                      </v-alert>
                    </center>
                  </div>

                   <div v-if="lesson_index == 4" style="padding-bottom: 2em;">
                    <center>

                      <v-btn :href='require("@/assets/practice/data/data.csv")' target="_blank" color="primary" download>
                        Stáhnout data.csv
                        <v-icon right dark>mdi-download</v-icon>
                      </v-btn>

                      <v-btn :href='require("@/assets/practice/data/ukol.csv")' target="_blank" color="primary" download>
                        Stáhnout ukol.csv
                        <v-icon right dark>mdi-download</v-icon>
                      </v-btn>
                    </center>
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
                        <v-flex class="text-right" xs8>
                          <v-btn color="warning" title="Zobrazit řešení" @click="showClicked(lesson_index, lecture_index)" fab small dark outlined>
                            <v-icon>{{ lecture['visible'] ? "mdi-eye-off" : "mdi-presentation" }}</v-icon>
                          </v-btn>
                        </v-flex>
                        <v-flex xs12>
                          <pre v-if="lecture['visible']" v-highlightjs>
                            <code class="sql">{{ lecture["code"].join('\n') }}</code>
                          </pre>
                        </v-flex>
                        <v-flex v-if="lecture['visible'] && lecture['images']" xs12>
                          <viewer style="cursor: zoom-in;" :images="lecture['images']" :options='{ "inline": true, "button": true, "navbar": true, "title": false, "toolbar": true, "tooltip": false, "movable": false, "zoomable": false, "rotatable": false, "scalable": false, "transition": false, "fullscreen": false, "keyboard": true, "url": "data-source" }'>
                            <img v-for="src in lecture['images']" :src="src" :key="src">
                          </viewer>
                        </v-flex>
                      </v-layout>
                    </li>
                  </ul>

                  <div v-if="lesson_index == 3" style="padding: 2em 0;">
                    <center>
                      <viewer style="cursor: zoom-in;"  :images="['../assets/join2.png']" :options="viewerOptions">
                        <img src="../assets/practice/join2.png" alt="join" title="join" />
                      </viewer>
                    </center>
                  </div>

                  <v-alert v-if="lesson['tasks'].length > 0" type="info" color="info" label="info" outlined style="margin-bottom: 2em;">
                    ÚKOLY
                  </v-alert>

                  <ol type="A">
                    <li v-for="(task, task_index) in lesson['tasks']" :key="task_index">
                      <v-layout row wrap>
                        <v-flex xs10>
                          <span class="subheading">{{ task["header"] }}</span>
                        </v-flex>
                        <v-flex class="text-right" xs2>
                          <v-btn v-if="task['code']" color="error" title="Zobrazit kód" @click="hintClicked(lesson_index, 'code', task_index)" fab small dark outlined>
                            <v-icon>{{ task['code_visible'] ? "mdi-eye-off" : "mdi-code-braces" }}</v-icon>
                          </v-btn>
                          <v-btn v-if="task['screen']" color="success" title="Zobrazit výsledek" @click="hintClicked(lesson_index, 'screen', task_index)" fab small dark outlined>
                            <v-icon>{{ task['screen_visible'] ? "mdi-eye-off" : "mdi-help" }}</v-icon>
                          </v-btn>
                        </v-flex>
                        <v-flex xs12>
                          <ul>
                            <li v-for="(subheader, subheader_index) in task['subheaders']" :key="subheader_index">{{ subheader }}</li>
                          </ul>
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

export default {
  name: "Practice",
  data() {
    return {
      viewerOptions: { "toolbar": false, "navbar": false, "title": false },
      taskLink: require("@/assets/practice/data/ukol.csv"),
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
              header: "LIMIT",
              visible: false,
              code: ["SELECT * FROM teror LIMIT 10; -- vybere 10 nahodnych radku z tabulky teror"] 
            },
            {
              header: "DISTINCT",
              visible: false,
              code: ["SELECT DISTINCT(country_txt) FROM teror; -- vybere unikatni hodnoty ve sloupi country_txt z tabulky teror"] 
            },
            {
              header: "COUNT",
              visible: false,
              code: ["SELECT COUNT(*) FROM teror; -- spocita pocet radku v tabulce teror"] 
            },
            {
              header: "ORDER BY",
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
              header: "Vybrání vlastní hodnoty do sloupečku",
              notes: ["nový sloupeček", "sloupeček existující v tabulce"],
              visible: false,
              code: ["SELECT 'Indonésie' AS region_txt FROM teror;"]
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
            }
          ],
          tasks: [
            {
              header: "Vyber vše z tabulky teror",
              code: "SELECT * FROM teror;",
              code_visible: false,
              screen: require("@/assets/practice/lessons/1A.png"),
              screen_visible: false
            },
            {
              header: "Zobraz náhodných deset řádek z tabulky teror",
              code: "SELECT * FROM teror LIMIT 10;",
              code_visible: false,
              screen: require("@/assets/practice/lessons/1A.png"),
              screen_visible: false

            },
            {
              header: "Vypiš jen sloupce eventid, iyear, country_txt, region_txt",
              code: "SELECT eventid,iyear,country_txt,region_txt FROM teror;",
              code_visible: false,
              screen: require("@/assets/practice/lessons/1B.png"),
              screen_visible: false

            },
            {
              header: "Vypiš všechny roky vyskytující se v tabulce teror, tak aby byl každý rok ve výsledné tabulce jen jednou",
              code: "SELECT DISTINCT iyear FROM teror;",
              code_visible: false,
              screen: require("@/assets/practice/lessons/1C.png"),
              screen_visible: false

            },
            {
              header: "Vyber všechny teroristické útoky v roce 2016",
              code: "SELECT * FROM teror WHERE iyear=2016;",
              code_visible: false,
              screen: require("@/assets/practice/lessons/1D.png"),
              screen_visible: false

            },
            {
              header: "Vypiš všechny útoky za rok 2015 a vyber pouze sloupce eventid, iyear, country_txt, region_txt a přejmenuj je na udalost, rok, zeme, region",
              code: "SELECT eventid AS udalost,iyear AS rok,country_txt AS zeme,region_txt AS region FROM teror WHERE iyear=2015;",
              code_visible: false,
              screen: require("@/assets/practice/lessons/1E.png"),
              screen_visible: false

            },
            {
              header: "Vyber všechny události v roce 2014 a vyber pouze sloupce iyear, imonth a iday. Spoj je do jednoho sloupce oddělené pomlčkou a pojmenuj ho datum",
              code: "SELECT iyear||'-'||imonth||'-'||iday AS datum FROM teror WHERE iyear=2014;",
              code_visible: false,
              screen: require("@/assets/practice/lessons/1F.png"),
              screen_visible: false

            },
            {
              header: "Seřaď datum z předchozího selektu sestupně (desc) a vypiš jen jedinečné záznamy",
              code: "SELECT DISTINCT iyear||'-'||imonth||'-'||iday AS datum FROM teror WHERE iyear=2014 ORDER BY datum DESC;",
              code_visible: false,
              screen: require("@/assets/practice/lessons/1G.png"),
              screen_visible: false

            },
            {
              header: "Vypiš počet teroristických útoků, které se staly po roce 2015",
              code: "SELECT COUNT(*) FROM teror WHERE iyear>2015;",
              code_visible: false,
              screen: require("@/assets/practice/lessons/1H.png"),
              screen_visible: false

            }
          ]
        },
        {
          name: "WHERE",
          lectures: [
            {
              header: "Zakladní operátory",
              notes: [">", "<", "<=", ">=", "!= <>", "="],
              visible: false,
              code: ["SELECT city FROM teror WHERE city = 'Prague';",
                     " SELECT city FROM teror WHERE nhostkid = 1; -- vybere mesta, kde byl pri utoku unesen prave jeden clovek",
                     " SELECT * FROM teror WHERE nkillter > 1; -- vybere vsechny utoky, kde zemrel vic jak jeden terorista"] 
            },
            {
              header: "WHERE (string function)",
              notes: ["SPLIT", "SUBSTRING", "LEFT", "RIGHT", "UPPER", "LENGTH"],
              visible: false,
              code: ["SELECT SPLIT('127.0.0.1', '.');",
                     " SELECT SPLIT(city, ' ') FROM teror; -- vybere vsechny mesta a rozdeli je podle poctu slov",
                     " SELECT city FROM teror WHERE ARRAY_SIZE(SPLIT(city, ' ')) > 2; -- vybere vsechny mesta, ktera maji vice jak 2 slova",
                     " SELECT city FROM teror WHERE length(city) - length(replace(city, ' ','')) >= 2; -- vybere vsechny mesta, ktera maji vice jak 2 slova",
                     " SELECT city, SUBSTRING(city,0,1) AS prvni_pismeno FROM teror; -- vybere mesto a jeho prvni pismeno",                     
                     " SELECT city, LEFT(city,1) AS prvni_pismeno FROM teror; -- vybere mesto a jeho prvni pismeno",
                     " SELECT city, UPPER(RIGHT(city,3)) AS posledni_tri_pismena FROM teror; -- vybere mesto a jeho posledni tri pismena v UPPERCASE"] 
            },
            {
              header: "WHERE (math function)",
              notes: ["HAVERSINE", "ROUND", "FLOOR", "CEIL"],
              visible: false,
              code: ["SELECT gname, city, iyear, nkill, HAVERSINE(50.052134, 14.442047, latitude, longitude ) AS vzdalenost_od_nas FROM teror WHERE vzdalenost_od_nas < 100 ORDER BY nkill DESC;", 
                     " SELECT nkill, nkillter, nkill/nkillter AS prumer FROM teror WHERE  nkill > 0 AND nkillter > 0 AND prumer > 1 ORDER BY prumer DESC;",
                     " SELECT CEIL(1.5), ROUND(1.5), TRUNC(1.5), FLOOR(1.5), CEIL(1.1), ROUND(1.1), TRUNC(1.1);",
                     " SELECT FLOOR(1574.14), FLOOR(1574.14,1), FLOOR(1574.14,2), FLOOR(1574.14,-1), FLOOR(1574.14,-2);"] 
            },
            {
              header: "WHERE (date function)",
              notes: ["TO_DATE", "DATE_FROM_PARTS", "DATEADD", "EXTRACT"],
              visible: false,
              code: ["SELECT TO_DATE(imonth || '/' || iday || '/' || iyear) AS datum, imonth, iday, iyear FROM teror WHERE DATEADD(year, 2, datum) = DATE_FROM_PARTS(2016, 1, 1);",
                     " SELECT DATE_FROM_PARTS(iyear, imonth, iday) AS datum FROM teror WHERE DATEDIFF('year',datum, DATE_FROM_PARTS(2015,1,1)) = -2;",
                     " SELECT DATE_FROM_PARTS(iyear, imonth, iday) datum, iyear, imonth, iday, DATEADD(day, 1, datum) AS zitra FROM teror;",
                     " SELECT EXTRACT(YEAR FROM eventdate) AS rok FROM teror2;"] 
            },
            {
              header: "AND, OR a závorky",
              visible: false,
              code: ["SELECT * FROM teror WHERE country_txt='Germany' AND (city='Berlin' OR city='München'); -- vybere vsechny utoky v Nemecku, ktere se staly v Berline nebo Mnichove"] 
            },
            {
              header: "LIKE, ILIKE",
              notes: ["% - 0 az N znaku", "_ - jeden znak", "[] - vyber", "^ - not", "- - rozsah"],
              visible: false,
              code: ["SELECT DISTINCT(attacktype1_txt) FROM teror WHERE attacktype1_txt LIKE '%bomb%'; -- vybere unikatni typy utoku, ktere obsahuji slovo bomb(kdekoliv)",
                     " SELECT DISTINCT(region_txt) FROM teror WHERE region_txt ILIKE '%cz%'; -- vybere unikatni nazvy regionu, ktere obsahuji cz (kdekoliv a v jakekoliv velikosti)",
                     " SELECT DISTINCT(gname) FROM teror WHERE gname ILIKE 'a%'; -- vybere unikatni nazvy organizaci, ktere zacinaji na a",
                     " SELECT DISTINCT(gname) FROM teror WHERE gname ILIKE '_a%'; -- vybere unikatni nazvy organizaci, ktere maji v nazvu druhe pismeno a", 
                     " SELECT city FROM teror WHERE city like '% % %'; -- vybere vsechny mesta, ktera maji vice jak 2 slova"]
                     
            },
            {
              header: "IN, NOT IN, IS NOT",
              visible: false,
              code: ["SELECT city FROM teror WHERE region_txt NOT IN ('South America','South Asia');",
                     " SELECT GNAME FROM teror WHERE region_txt IN ('Eastern Europe','Western Europe');",
                     " SELECT weaptype1_txt, nkillter FROM teror WHERE nkillter IS NOT NULL ORDER BY nkillter DESC;"] 
            },
            {
              header: "BETWEEN",
              visible: false,
              code: ["SELECT DISTINCT(iyear) FROM teror WHERE iyear BETWEEN 2014 AND 2016; -- vybere unikatni roky mezi roky 2014 a 2016 (vcetne krajnich hodnot)",
                     " SELECT city, SUBSTRING(city,0,1) AS prvni_pismeno FROM teror WHERE prvni_pismeno BETWEEN 'A' AND 'C'; -- vybere mesta, ktera zacinaji na A B nebo C"] 
            },
            {
              header: "SELECT CASE",
              notes: ["IFNULL"],
              visible: false,
              code: [`SELECT CASE
    WHEN nkill IS NULL THEN 1
    WHEN nkill = 0 THEN 1
    ELSE nkill
END AS upraveny_nkill
FROM teror; -- upravi sloupec nkill aby tam nebyl NULL a 0`,
`SELECT CASE
    WHEN region_txt ILIKE '%america%' THEN 'Amerika'
    WHEN region_txt ILIKE '%africa%' THEN 'Afrika'
    WHEN region_txt ILIKE '%asia%' THEN 'Asie'
    ELSE region_txt
END AS continent
FROM teror; -- vytvorime sloupec kontinent podle regionu`, "SELECT IFNULL(nkillter,0) FROM teror;"]

            }
          ],
          tasks: [
            {
              header: "Vyber z tabulky útoky v Německu, kde zemřel alespoň jeden terorista",
              code: "SELECT * FROM teror WHERE nkillter > 0 AND country_txt = 'Germany';",
              code_visible: false,
              screen: require("@/assets/practice/lessons/2A.jpg"),
              screen_visible: false
            },
            {
              header: "Zobraz jen sloupečky GNAME, COUNTRY_TXT, NKILL a všechny řádky (seřazené podle počtu obětí sestupně), na kterých je víc než 340 obětí (počet obětí je ve sloupci NKILL), sloupečky přejmenuj na ORGANIZACE, ZEME, POCET_OBETI",
              code: "SELECT gname AS ORGANIZACE, country_txt AS zeme, nkill AS POCET_OBETI FROM teror WHERE nkill > 340 ORDER BY POCET_OBETI DESC;",
              code_visible: false,
              screen: require("@/assets/practice/lessons/2B.jpg"),
              screen_visible: false
            },
            {
              header: "Zobraz sloupečky IYEAR, IMONTH, IDAY, GNAME, CITY, ATTACKTYPE1_TXT, TARGTYPE1_TXT, WEAPTYPE1_TXT, WEAPDETAIL, NKILL, NWOUND a vyber jen útoky, které se staly v Czech Republic v letech 2015, 2016 a 2017. Všechna data seřaď chronologicky sestupně",
              code: "SELECT iyear, imonth, iday, gname, city, attacktype1_txt, targtype1_txt, weaptype1_txt, weapdetail, nkill, nwound FROM teror WHERE country_txt='Czech Republic' AND IYEAR IN (2015, 2016, 2017) ORDER BY iyear DESC, imonth DESC, iday DESC;",
              code_visible: false,
              screen: require("@/assets/practice/lessons/2C.jpg"),
              screen_visible: false
            },
            {
              header: "Vypiš všechny organizace, které na jakémkoliv místě v názvu obsahují výraz „anti“ a výraz „extremists“",
              code: "SELECT DISTINCT gname FROM teror WHERE gname ilike '%anti%' AND gname ilike '%extremists%';",
              code_visible: false,
              screen: require("@/assets/practice/lessons/2D.jpg"),
              screen_visible: false
            },
            {
              header: "Z iYear, iMonth a iDay vytvořte sloupeček datum a vypište tohle datum a pak datum o tři měsíce později a klidně i o tři dny a tři měsíce",
              code: "SELECT DATE_FROM_PARTS(iyear, imonth, iday) datum, iyear, imonth, iday, DATEADD(month, 3, DATE_FROM_PARTS(iyear, imonth, iday)) o_tri_mesice_pozdeji, DATEADD(day, 3, DATEADD(month, 3, DATE_FROM_PARTS(iyear, imonth, iday))) o_tri_mesice_a_tri_dny_pozdeji FROM teror;",
              code_visible: false,
              screen: require("@/assets/practice/lessons/2E.jpg"),
              screen_visible: false
            },
            {
              header: "Vypiš všechny druhy útoků ATTACKTYPE1_TXT",
              code: "SELECT DISTINCT attacktype1_txt FROM teror;",
              code_visible: false,
              screen: require("@/assets/practice/lessons/2F.jpg"),
              screen_visible: false
            },
            {
              header: "Vypiš všechny útoky v Německu v roce 2015, vypiš sloupečky IYEAR, IMONTH, IDAY, COUNTRY_TXT, REGION_TXT, PROVSTATE, CITY, NKILL, NKILLTER, NWOUND. Ve sloupečku COUNTRY_TXT bude všude hodnota ‘Německo’",
              code: "SELECT iyear AS rok, imonth AS mesic, iday AS den, 'Německo' AS COUNTRY_TXT /*naplni sloupecek country_txt nasim textem*/, region_txt, provstate, city, nkill, nkillter, nwound FROM teror WHERE country_txt = 'Germany' AND iyear = 2015;",
              code_visible: false,
              screen: require("@/assets/practice/lessons/2G.jpg"),
              screen_visible: false
            },
            {
              header: "Kolik událostí se stalo ve třetím a čtvrtém měsíci a počet mrtvých teroristů není NULL?",
              code: `SELECT COUNT(*) FROM teror WHERE imonth BETWEEN 3 AND 4 AND nkillter IS NOT NULL;
 SELECT COUNT(*) FROM teror WHERE imonth IN (3,4) AND nkillter IS NOT NULL;
 SELECT COUNT(*) FROM teror WHERE (imonth = 3 OR imonth = 4) AND nkillter IS NOT NULL;`,
              code_visible: false,
              screen: require("@/assets/practice/lessons/2H.png"),
              screen_visible: false
            },
            {
              header: "Vypiš první 3 města seřazena abecedně kde bylo zabito 30 až 100 teroristů nebo zabito 500 až 1000 lidí. Vypiš i sloupečky nkillter a nkill.",
              code: "SELECT city, nkillter, nkill FROM teror WHERE nkillter BETWEEN 30 AND 100 OR nkill BETWEEN 500 AND 1000 ORDER BY city LIMIT 3;",
              screen: require("@/assets/practice/lessons/2I.png"),
              screen_visible: false
            },
            {
              header: "Vypiš všechny útoky z roku 2014, ke kterým se přihlásil Islámský stát ('Islamic State of Iraq and the Levant (ISIL)').Vypiš sloupečky IYEAR, IMONTH, IDAY, GNAME, COUNTRY_TXT, REGION_TXT, PROVSTATE, CITY, NKILL, NKILLTER, NWOUND a na konec přidej sloupeček EventImpact, který bude obsahovat:",
              subheaders: ["'Massacre' pro útoky s víc než 1000 obětí", "'Bloodbath' pro útoky s 501 - 1000 obětmi","'Carnage' pro ůtoky s 251 - 500 obětmi","'Blodshed' pro útoky se 100 - 250 obětmi","'Slaugter' pro útoky s 1 - 100 obětmi","a ‘N/A’ pro všechny ostatní útoky."],
              code: `SELECT iyear, imonth, iday, gname, country_txt, region_txt, provstate, city, nkill, nkillter, nwound,
 CASE 
   WHEN nkill > 1000 THEN 'Massacre'
   WHEN nkill > 500  THEN 'Bloodbath'
   WHEN nkill > 250  THEN 'Carnage'
   WHEN nkill > 100  THEN 'Blodshed'
   WHEN nkill > 0    THEN 'Slaugter'
   ELSE 'N/A'
 END AS EventImpact
 FROM teror
 WHERE gname = 'Islamic State of Iraq and the Levant (ISIL)' AND iyear = 2014
 ORDER BY nkill DESC;`,
              code_visible: false,
              screen: require("@/assets/practice/lessons/2J.jpg"),
              screen_visible: false
            },
            {
              header: "Vypiš všechny útoky s alespoň jednou obětí z Německa, Rakouska, Švýcarska, Francie a Itálie. U Německa, Rakouska, Švýcarska nahraď region_txt za ‘DACH’ u zbytku nech původní region. Vypiš sloupečky IYEAR, IMONTH, IDAY, COUNTRY_TXT, REGION_TXT, PROVSTATE, CITY, NKILL, NKILLTER, NWOUND. Výstup seřaď podle počtu raněných sestupně",
              code: `SELECT iyear, imonth, iday, country_txt, 
 CASE
    WHEN country_txt IN ('Germany', 'Austria', 'Switzerland') THEN ' DACH'
    ELSE region_txt
 END AS region_txt, provstate, city, nkill, nkillter, nwound
 FROM teror 
 WHERE nkill > 0 AND COUNTRY_TXT in ('Germany', 'Austria', 'Switzerland', 'France', 'Italy')
 ORDER BY NWOUND DESC;`,
              code_visible: false,
              screen: require("@/assets/practice/lessons/2K.jpg"),
              screen_visible: false
            },
            {
              header: "Vypiš COUNTRY_TXT, CITY, NWOUND a přidej sloupeček vzdalenost_od_albertova obsahující vzdálenost místa útoku z pražské části Albertov v km a sloupeček kategorie obsahující ‘Blízko’ pro útoky bližší 2000 km a ‘Daleko’ pro ostatní. Vypiš jen útoky s víc než stovkou raněných a seřad je podle vzdálenosti od Albertova",
              code: `SELECT country_txt, city, nwound,  haversine(50.0688111, 14.4243694, latitude, longitude) vzdalenost_od_albertova,
 CASE
    WHEN HAVERSINE(50.0688111, 14.4243694, latitude, longitude) < 2000 THEN 'Blízko'
    ELSE 'Daleko'
 END AS Kategorie
 FROM teror WHERE nwound > 100
 ORDER BY vzdalenost_od_albertova;`,
              code_visible: false,
              screen: require("@/assets/practice/lessons/2L.jpg"),
              screen_visible: false
            },
          ]
        },
        {
          name: "GROUP BY + HAVING",
          lectures: [
            {
              header: "SUM() - součet",
              notes: [],
              visible: false,
              code: ["SELECT SUM(nkill) AS pocet_mrtvych FROM teror;"]
            },
            {
              header: "COUNT() - počet",
              notes: [],
              visible: false,
              code: ["SELECT COUNT(*) AS pocet_zaznamu FROM teror; --- pocet vsech radku  56 354",
                     " SELECT COUNT(nkill) AS pocet_zaznamu FROM teror; ---- vylouci null hodnoty 53 134",
                     " SELECT * FROM teror WHERE nkill IS NULL; --- 3 220 null hodnot"]
            },
            {
              header: "AVG() - průměr",
              notes: [],
              visible: false,
              code: ["SELECT AVG(nkill) AS prumerny_pocet_mrtvych FROM teror; -- do prumeru se nepocitaji null hodnoty"]
            },
            {
              header: "MAX() - maximální hodnota",
              notes: [],
              visible: false,
              code: ["SELECT MAX(nkill) AS max_pocet_mrtvych FROM teror;",
                     " SELECT nkill AS max_pocet_mrtvych FROM teror WHERE nkill IS NOT NULL ORDER BY nkill DESC LIMIT 1; -- stejny vysledek jinou cestou"]
            },
            {
              header: "MIN() - minimální hodnota",
              notes: [],
              visible: false,
              code: ["SELECT MIN(nkill) AS min_pocet_mrtvych FROM teror;",
                     " SELECT nkill AS min_pocet_mrtvych FROM teror WHERE nkill IS NOT NULL ORDER BY nkill LIMIT 1; -- stejny vysledek jinou cestou"]
            },
            {
              header: "GROUP BY - vytváření skupin",
              notes: [],
              visible: false,
              code: ["SELECT gname, SUM(nkill) AS pocet_mrtvych FROM teror GROUP BY gname ORDER BY pocet_mrtvych DESC; --- pocet mrtvych podle teroristicke organizace",]
            },
            {
              header: "HAVING - možnost zapsat podmínky ke skupinám (nalezení duplicitních záznamů)",
              notes: [],
              visible: false,
              code: ["SELECT gname, SUM(nkill) AS pocet_mrtvych FROM teror GROUP BY gname HAVING SUM(nkill) > 0 ORDER BY pocet_mrtvych DESC; --- pocet mrtvych podle teroristicke organizace kde je pocet obeti vetsi nez nula",
                     " SELECT gname, SUM(nkill), SUM(nkillter) FROM teror GROUP BY gname HAVING SUM(nkill) > 0 AND SUM(nkillter) >= 1 ORDER BY SUM(nkill) DESC; --- pocet mrtvych podle teroristicke organizace kde je pocet obeti a pocet mrtvych teroristu vetsi nez nula"]
            }
          ],
          tasks: [
            {
              header: "Zjisti počet obětí a raněných po letech a měsících",
              code: "SELECT iyear, imonth, SUM(nkill) AS killed, SUM(nwound) AS wounded FROM teror GROUP BY iyear, imonth ORDER BY  iyear, imonth;",
              code_visible: false,
              screen: require("@/assets/practice/lessons/3A.png"),
              screen_visible: false
            },
            {
              header: "Zjisti počet obětí a raněných v západní Evropě po letech a měsících",
              code: "SELECT iyear, imonth, SUM(nkill) AS killed, SUM(nwound) AS wounded FROM teror WHERE region_txt = 'Western Europe' GROUP By iyear, imonth ORDER BY  iyear, imonth;",
              code_visible: false,
              screen: require("@/assets/practice/lessons/3B.png"),
              screen_visible: false
            },
            {
              header: "Zjisti počet útoků po zemích. Seřaď je podle počtu útoků sestupně",
              code: `SELECT country_txt, COUNT(*) FROM teror GROUP BY 1 ORDER BY COUNT(*) DESC;
 SELECT country_txt, COUNT(1) FROM teror GROUP BY country_txt ORDER BY COUNT(1) DESC;
 SELECT country_txt, COUNT('1') FROM teror GROUP BY country_txt ORDER BY 2 DESC;`,            
              screen: require("@/assets/practice/lessons/3C.png"),
              screen_visible: false
            },
            {
              header: "Zjisti počet útoků po zemích a letech, seřaď je podle počtu útoků sestupně",
              code: "SELECT country_txt, iyear, COUNT(*) FROM teror GROUP BY country_txt, iyear ORDER BY COUNT(*) DESC;",
              screen: require("@/assets/practice/lessons/3D.png"),
              screen_visible: false
            },
            {
              header: "(Chytak) Kolik která organizace spáchala útoků zápalnými zbraněmi (weaptype1_txt = 'Incendiary'), kolik při nich celkem zabila obětí, kolik zemřelo teroristů a kolik lidí bylo zraněno (nkill, nkillter, nwound)",
              code: "SELECT gname, COUNT(eventid), SUM(nkill), SUM(nkillter), SUM(nwound) FROM teror WHERE weaptype1_txt = 'Incendiary' GROUP BY gname;",
              screen: require("@/assets/practice/lessons/3E.png"),
              screen_visible: false
            },
            {
              header: "Stejné jako 3e, jen ve výsledném výpisu chceme jen organizace, které zápalnými útoky zranily 50 a více lidí a nechceme tam vidět “organizaci” Unknown",
              code: "SELECT gname, COUNT(eventid), SUM(nkill), SUM(nkillter), SUM(nwound) FROM teror WHERE weaptype1_txt = 'Incendiary' GROUP BY gname HAVING gname <> 'Unknown' AND sum(nwound) >= 50;",
              screen: require("@/assets/practice/lessons/3F.png"),
              screen_visible: false
            },
            {
              header: "Vypište celkový počet útoků podle druhu zbraně weaptype1_txt , počet mrtvých, mrtvých teroristů, průměrný počet mrtvých, průměrný počet mrtvých teroristů, kolik mrtvých obětí připadá na jednoho mrtvého teroristu a kolik zraněných...",
              code: `SELECT weaptype1_txt, 
       COUNT(*) AS pocet_utoku, 
       SUM(nkill) AS pocet_obeti, 
       SUM(nkillter) AS pocet_zabitych_teroristu, 
       AVG(nkill) AS prumerne_obeti, 
       AVG(nkillter) AS prumerne_zabitych_teroristu,
       CASE  
         WHEN sum(nkillter) <> 0 THEN sum(nkill) / sum(nkillter)
         ELSE NULL
       END AS pocet_obeti_na_mrtveho_teroristu,
       CASE  
         WHEN sum(nkillter) <> 0 THEN sum(nwound) / sum(nkillter)
         ELSE NULL
       END AS pocet_zranenych_na_mrtveho_teroristu
 FROM teror GROUP BY weaptype1_txt ORDER BY COUNT(*) DESC;`,
              screen: require("@/assets/practice/lessons/3G.png"),
              screen_visible: false
            }
          ]
        },
        {
          name: "JOINY",
          lectures: [
            {
              header: "Základní JOIN (podle numeric)",
              notes: [],
              visible: false,
              code: [`SELECT country.name 
 FROM teror2
 LEFT JOIN country ON teror2.country = country.id;`,
 `
 SELECT c.name, t2.nkill, t2.nkillter, t2.gname, t2.latitude, t2.longitude
 FROM teror2 AS t2
 LEFT JOIN country AS c 
 ON t2.country = c.id; -- pro line`,
 `
 SELECT c.name, t2.nkill, t2.nkillter, t2.gname, t2.latitude, t2.longitude
 FROM teror2 t2
 LEFT JOIN country c 
 ON t2.country = c.id; -- pro linejsi`,
 `
 SELECT b.name, a.nkill, a.nkillter, a.gname, a.latitude, a.longitude
 FROM teror2 a
 LEFT JOIN country b ON a.country = b.id; -- pro bordelare`]
            },
            {
              header: "Základní JOIN (pozor na sloupce)",
              notes: ["Takto se to nedělá!!!"],
              visible: false,
              code: [`SELECT c.name
 FROM teror2 as t2
 LEFT JOIN country as c 
 ON t2.attacktype1 = c.id;`]
            },
            {
              header: "Základní JOIN (jde to i pres stringy)",
              notes: [],
              visible: false,
              code: [`SELECT c.name
 FROM teror as t
 LEFT JOIN country as c
 ON t.country_txt = c.name;`]
            },
            {
              header: "Základní JOIN (vice tabulek)",
              notes: [],
              visible: false,
              code: [`SELECT c.name, atyp.name
 FROM teror2 as t2
 LEFT JOIN country AS c
 ON t2.country = c.id
 LEFT JOIN attacktype AS atyp
 ON t2.attacktype1 = atyp.id;`]
            },
            {
              header: "JOIN (vice sloupců)",
              notes: ["Můžeme dostat i více řádků než je v původní tabulce"],
              visible: false,
              code: [`SELECT dd.name, t2.nkill
 FROM teror2 AS t2
 JOIN country_dirtydata AS dd
 ON t2.country = dd.id;`]
            },
            {
              header: "JOIN (LEFT a RIGHT)",
              notes: [],
              visible: false,
              code: [`SELECT t2.gname, 
       c.name as country, 
       atyp1.name as attack_type1, 
       atyp2.name as attack_type2, 
       atyp3.name as attack_type3
 FROM teror2 as t2
 LEFT JOIN country as c 
 ON t2.country = c.id
 LEFT JOIN attacktype as atyp1 
 ON t2.attacktype1 = atyp1.id
 LEFT JOIN attacktype as atyp2
 ON t2.attacktype2 = atyp2.id
 LEFT JOIN attacktype as atyp3 
 ON t2.attacktype3 = atyp3.id;`]
            },
            {
              header: "JOIN (INNER vs LEFT)",
              notes: [],
              visible: false,
              code: [
                `SELECT c.name as country, 
       atyp1.name as attack_type1, 
       atyp2.name as attack_type2, 
       atyp3.name as attack_type3
FROM teror2 as t2
LEFT JOIN country as c 
ON t2.country = c.id
JOIN attacktype as atyp1 
ON t2.attacktype1 = atyp1.id
JOIN attacktype as atyp2
ON t2.attacktype2 = atyp2.id
JOIN attacktype as atyp3 
ON t2.attacktype3 = atyp3.id; -- default pro JOIN je INNER JOIN (neni treba specifikovat), vrati pouze zaznamy, pro ktere najde v obou tabulkach shodu
                          
SELECT c.name as country, 
       atyp1.name as attack_type1, 
       atyp2.name as attack_type2, 
       atyp3.name as attack_type3
FROM teror2 as t2
LEFT JOIN country as c 
ON t2.country = c.id
JOIN attacktype as atyp1 
ON t2.attacktype1 = atyp1.id
JOIN attacktype as atyp2
ON t2.attacktype2 = atyp2.id
JOIN attacktype as atyp3 
ON t2.attacktype3 = atyp3.id; -- to stejne jako predchozi

SELECT c.name as country, 
       atyp1.name as attack_type1, 
       atyp2.name as attack_type2, 
       atyp3.name as attack_type3
FROM teror2 as t2
LEFT JOIN country as c 
ON t2.country = c.id
LEFT JOIN attacktype as atyp1 
ON t2.attacktype1 = atyp1.id
LEFT JOIN attacktype as atyp2
ON t2.attacktype2 = atyp2.id
LEFT JOIN attacktype as atyp3 
ON t2.attacktype3 = atyp3.id; -- vrati vsechny zaznamy z tabulky teror2 a snazi se k nim doparovat attack type
`,
              ]
            },
            {
              header: "FULL OUTER JOIN",
              notes: [],
              visible: false,
              code: ["-- vrati zaznamy, pro ktere najde shodu plus zbyle zaznamy z obou tabulek, pouziva se zridka"]
            },
            {
              header: "JOIN a WHERE",
              notes: [],
              visible: false,
              code: [`SELECT gname, city, nwound FROM teror2 AS t2 
 JOIN country AS c ON t2.country = c.id 
 WHERE c.name = 'Slovak Republic' AND YEAR(t2.eventdate) = 2016;`]
            },
          ],
          tasks: [
            {
              header: "Vypiš eventdate, gname, nkill, nwound z tabulky teror2 (!) a přes sloupeček country připoj zemi z tabulky country",
              screen: require("@/assets/practice/lessons/4A.png"),
              code: `SELECT t2.eventdate, t2.gname, t2.nkill, t2.nwound, c.name as country_name
 FROM teror2 AS t2
 LEFT JOIN country AS c 
 ON t2.country = c.id;`
            },
            {
              header: "Vypiš eventdate, gname, nkill, nwound z tabulky teror2 (!) a",
              subheaders: ["přes sloupecek country pripoj zemi z tabulky country","přes sloupecek weaptype1 připoj nazev zbrane z tabulky weaptype", "přes sloupecek weaptype2 připoj nazev zbrane z tabulky weaptype"],
              screen: require("@/assets/practice/lessons/4B.png"),
              code: `SELECT t2.eventdate, t2.gname, t2.nkill, t2.nwound, c.name as country_name, wt1.name as weapon_type1, wt2.name as weapon_type2
 FROM teror2 AS t2
 LEFT JOIN country as c ON t2.country = c.id
 LEFT JOIN weaptype as wt1 ON t2.weaptype1 = wt1.id
 LEFT JOIN weaptype as wt2 ON t2.weaptype2 = wt2.id;`
            },
            {
              header: "Vypis eventdate, gname, nkill, nwound z tabulky teror2 (!) a",
              subheaders: ["pres sloupecek country připoj zemi z tabulky country","pres sloupecek weaptype1 připoj nazev zbrane z tabulky weaptype","pres sloupecek weaptype2 připoj nazev zbrane z tabulky weaptype","vypis jen utoky jejichz sekundarni zbran byla zapalna ('Incendiary')"],
              screen: require("@/assets/practice/lessons/4C.png"),
              code: `SELECT t2.eventdate, t2.gname, t2.nkill, t2.nwound, c.name as country_name, wt1.name as weapon_type1, wt2.name as weapon_type2
 FROM teror2 AS t2
 LEFT JOIN country as c ON t2.country = c.id
 LEFT JOIN weaptype as wt1 ON t2.weaptype1 = wt1.id
 LEFT JOIN weaptype as wt2 ON t2.weaptype2 = wt2.id
 WHERE wt2.name = 'Incendiary';`,
            },
            {
              header: "Z tabulky teror2 vypis pocet utoku, pocty mrtvych a ranenych v roce 2016 -- podle pouzitych zbrani (WEAPTYPE1)",
              screen: require("@/assets/practice/lessons/4D.png"),
              code: `SELECT wt1.name as weapon_type1, count(*) as attacks, sum(t2.nkill) as nkill_sum, sum(t2.nwound) as nwound_sum 
FROM teror2 as t2
 LEFT JOIN country as c ON t2.country = c.id
 LEFT JOIN weaptype as wt1 ON t2.weaptype1 = wt1.id
 WHERE date_part(year, eventdate) = 2016
 GROUP BY wt1.name
 ORDER BY COUNT(*) DESC;`
            },
            {
              header: "Vypiste pocet unesenych lidi (kdy byl typ utoku unos rukojmich) a pocet udalosti podle regionu a roku. Vysledek seradte podle poctu unesenych lidi sestupne. Sloupecky pojmenujte region, rok, pocet_unesenych, pocet_udalosti",
              code: `SELECT reg.name AS region, year(t2.eventdate) AS rok, SUM(t2.nhostkid) AS pocet_unesenych, COUNT(*) AS pocet_udalosti
 FROM teror2 AS t2
 JOIN attacktype AS at1 ON t2.attacktype1 = at1.id
 JOIN region AS reg ON t2.region = reg.id
 WHERE at1.name LIKE 'Hostage Taking %' AND t2.nhostkid > 0
 GROUP BY reg.name, year(t2.eventdate)
 ORDER BY SUM(nhostkid) DESC;`,
              code_visible: false,
              screen: require("@/assets/practice/lessons/4E.png"),
              screen_visible: false
            },
            {
              header: `Zjistí počty útoků z tabulky teror2 po letech a kontinentech. Tj. napoj sloupecek region z tabulky teror2 na tabulku region a vytvoř sloupeček kontinent z nazvu regionu a podle něj a podle roku tabulku "zgrupuj" (zagreguj).`,
              code: `SELECT CASE --vyber ze seznamu hodnot bude pri miliardach radek rychlejsi... Proc asi?
        -- pres region misto region_txt by to mozna bylo jeste rychlejsi...
         WHEN reg.name in ('Western Europe', 'Eastern Europe') THEN 'Europe'
         WHEN reg.name in ('Middle East & North Africa', 'Sub-Saharan Africa') THEN 'Africa'
         WHEN reg.name in ('East Asia', 'Southeast Asia', 'South Asia', 'Central Asia') THEN 'Asia'
         WHEN reg.name in ('North America', 'Central America & Caribbean', 'South America') THEN 'America'
         WHEN reg.name  = 'Australasia & Oceania' THEN 'Australia'
         ELSE reg.name
       END AS kontinent, 
       year(eventdate) as rok,
       count(*) utoku_celkem 
 FROM teror2 as t2
 LEFT JOIN region as reg
 ON t2.region=reg.id
 GROUP BY 
 --potrebujeme tabulku zgrupovat po kontinentech a letech
  kontinent,rok;`,
              code_visible: false,
              screen: require("@/assets/practice/lessons/4F.png"),
              screen_visible: false
            }
          ]
        },
        {
          name: "INSERT, DELETE, CREATE, ALTER a IMPORT DAT",
          lectures: [
            {
              header: "USE database; USE schema",
              notes: ["UI", "Příkaz"],
              visible: false,
              code: ["USE DATABASE COURSES;"," USE SCHEMA SCH_CZECHITA;", " USE SCHEMA <SCH_CZECHITA_PRIJIMENIK>;"]
            },
           {
              header: "CREATE table",
              notes: ["replace"],
              visible: false,
              code: [`CREATE TABLE NEW_TEROR (
  ID int,
  gname VARCHAR(250),
  nkill int,
  nwound int
); `,
`
 CREATE OR REPLACE TABLE NEW_TEROR (
  id int AUTOINCREMENT NOT NULL UNIQUE,
  gname VARCHAR(250),
  nkill int,
  nwound int,
  CONSTRAINT id_pk PRIMARY KEY (id)
); `]
            },
            {
              header: "CREATE table as select",
              notes: ["prvotní nalití dat"],
              visible: false,
              code: [`CREATE TABLE udalosti_jen_v_cesku AS 
SELECT
    gname
   ,city
   ,nkill
   ,nwound
 FROM sch_czechita.teror
 WHERE country_txt = 'Czech Republic';`,` 
CREATE TEMPORARY TABLE organizace_po_zemich AS 
--docasna tabulka zanikne, kdyz se odhlasime
  SELECT 
    gname
   ,city
   ,sum (nkill) killed
   ,sum (nwound) wounded
   ,C.name countryname 
 FROM      sch_czechita.teror2 T2 
 LEFT JOIN sch_czechita.country C         
 ON C.id = T2.country
 GROUP BY C.name, T2.gname, T2.city;`]
            },
            {
              header: "ALTER",
              notes: ["Snowflake to zatím moc neumí", "MODIFY", "Co dělat, když nejdou zkonvertovat data ve sloupci?"],
              visible: false,
              code: ["ALTER TABLE NEW_TEROR ALTER COLUMN gname VARCHAR(350);", "ALTER TABLE NEW_TEROR ALTER COLUMN gname not null;", " ALTER TABLE NEW_TEROR ADD Continent varchar(300);", " ALTER TABLE NEW_TEROR DROP COLUMN Continent;"]
            },
            {
              header: "INSERT into from select",
              notes: ["inkrementální updaty"],
              visible: false,
              code: [`INSERT INTO NEW_TEROR (gname, nkill, nwound)
 --v insertu DYCKY vyjmenovat sloupce, nepouzivat hvezdicku
 SELECT gname, nkill, nwound FROM teror
 WHERE iyear=2015;`]
            },
            {
              header: "INSERT values",
              notes: ["bulk aka batch"],
              visible: false,
              code: [`INSERT INTO NEW_TEROR (gname, nkill, nwound)
 VALUES
  ('Žoldáci', 10, 1),
  ('Nosiči smrti', 15, 2),
  ('Nějácí další teroristi', 155, 5);`]
            },
            {
              header: "UPDATE",
              notes: [],
              visible: false,
              code: ["UPDATE NEW_TEROR SET nkill=0 WHERE nkill is NULL;", "UPDATE NEW_TEROR SET nkill=0; -- POZOR, bez podminky nastavi vsude 0", " UPDATE NEW_TEROR SET nkill = 100, nwound= 100 WHERE gname = 'Žoldáci'; -- lze updatovat i vice sloupcu najednou"]
            },
            {
              header: "Nešťastný UPDATE a kouzelný SELECT AT",
              notes: [],
              visible: false,
              code: [`
--s trochou odvahy se da tabulka i prepsat...
 create table xx_prycsemnou as 
 --v insertu DYCKY vyjmenovat sloupce, nepouzivat hvezdicku
 SELECT
    gname
   ,city
   ,sum (nkill) killed
   ,sum (nwound) wounded
 FROM TEROR
 WHERE iyear=2016
 GROUP BY gname, city;
   
update xx_prycsemnou set killed = 0; -- TADY NAM TROCHU CHYBI PODMINKA

select * from xx_prycsemnou at(offset => -35);
-- a je to rozbity


select * from xx_prycsemnou at(offset => -15);
--ale pujde to zachranit
`]
            },
            {
              header: "Import",
              notes: ["Ukázka ve snowflake", "Použijte data.csv"],
              images: [
                require("@/assets/practice/screenshots/import_file_format_01.png"),
                require("@/assets/practice/screenshots/import_file_format_02.png"),
                require("@/assets/practice/screenshots/import_file_format_03.png"),
                require("@/assets/practice/screenshots/import_file_format_04.png"),
                require("@/assets/practice/screenshots/import_file_format_05.png")
              ],
              visible: false,
              code: [`CREATE TABLE gibberish
(  ID number, 
   "FIRST" text(500), 
   "LAST" char(500), 
   Email text, 
   CategoryId int, 
   ShopId int, 
   PeasantId integer, 
   TransactionDate date, 
   VirginityLevel int, 
   PricePerGig text, 
   SegmentText varchar(200), 
   URL varchar(200), 
   BlockChainHash varchar(64)
);`]
            },
            {
              header: "DELETE",
              notes: [],
              visible: false,
              code: [ "DELETE FROM NEW_TEROR WHERE nkill is NULL;", "DELETE FROM NEW_TEROR; -- vymaže pouze data"]
            },
            {
              header: "DROP",
              notes: ["TABLE", "DATABASE"],
              visible: false,
              code: ["DROP TABLE NEW_TEROR;", "DROP DATABASE <jmeno>;"]
            },
          ],
          tasks: [
            {
              header: "Importujte ukol.csv do Snowflake. Vytvořte si tabulku, která  bude obsahovat sloupce jako v csv souboru. Prohlédněte si nejdříve data třeba v Excelu (Podívejte se na datové typy. NÁPOVĚDA: Datum není datum importujte jako string).",
            },
            {
              header: "Importujte data do tabulky. Pozor budete si muset vytvořit vlastní file format!!!",
            },
            {
              header: "Úprava dat:",
              subheaders:["Najděte řádky, kde není vyplněné jméno, nebo datum narození a ty vymažte.", "V poli Birth Date odstraňte přebytečné mezery a vytvořte sloupec s datovým typem Date.( NÁPOVĚDA: REPLACE)", "Vytvořte dva nové sloupce Name and Surname a vložte do nich rozdělená data z pole Full name.","Pole Name a Surname upravte tak, aby první písmeno bylo vždy velké (nápověda funkce UPPER,SUBSTRING)."]
            },
            {
              header: "Vypište počet klientů dle věkových kategorií (1-10,10-20,20-30,více než 30)  žijících v Číně.",
            }]
        },
        {
          name: "JOINy II, Vnořený select a CTE",
          lectures: [
            {
              header: "Vnořený select",
              notes: [],
              visible: false,
              code: [`
 -- Vybere 1 jako subselect
 SELECT vnoreny.a 
 FROM (SELECT 1 AS a) AS vnoreny;`,
`
 -- Vybere jen některé sloupce jako subselect
 SELECT * 
 FROM (SELECT gname, eventdate FROM teror2 WHERE country = 54) AS subselect;`,
`
 -- Vybere unikátní dvojice skupiny a země jako subselect 
 SELECT vnoreny.* 
 FROM (SELECT DISTINCT t.gname AS skupina, c.name AS zeme FROM teror2 AS t INNER JOIN country AS c ON t.country=c.id) AS vnoreny;`,
`
 -- Zobrazení všech teroristických událostí, které spáchala teroristická organizace s nejvetším počtem obětí
 SELECT gname, iyear, nkill 
 from teror
 WHERE gname = (SELECT gname FROM teror ORDER BY nkill DESC LIMIT 1);`,
`
 -- Počet mrtvých v letech 2017 a 2016 které má na svědomí Islámský Stát tak, aby ve výsledku byl název organizace a ve sloupcích počet mrtvých dle let
 SELECT t1.*, 
        t2.pocetmrtv2016 
 FROM
 (
 SELECT gname, SUM(nkill) as pocetmrtv2017
 FROM teror
 WHERE iyear=2017 AND gname ilike '%islamic state%' 
 GROUP BY 1
 ORDER BY pocetmrtv2017 DESC
  ) AS t1
 LEFT JOIN
 (
 SELECT gname, COUNT(nkill) AS pocetmrtv2016
 FROM teror
 WHERE iyear=2016
 GROUP BY 1
 ORDER BY pocetmrtv2016 DESC
  ) AS t2
  ON t1.gname=t2.gname;`,
`
 -- Výběr teoristických úroků v roce 2016, které má na svědomí Islámský Stát a doplnění informace max a min počtu oětí v roce 2016 ke každému útoku
  SELECT t1.eventid, t1.gname, t1.iyear, t1.nkill, 
        t2.maxmrtvych2016, t2.minmrtvych2016
 FROM teror AS t1
 LEFT JOIN
 (
 SELECT gname, max(nkill) AS maxmrtvych2016, min(nkill) AS minmrtvych2016
 FROM teror
 WHERE iyear=2016 AND gname ilike '%islamic state%' 
 GROUP BY 1
  ) AS t2
 ON t1.gname=t2.gname
 WHERE t1.gname ILIKE '%islamic state%' and t1.iyear=2016;`]
            },
            {
              header: "Co je to CTE? (Common Table Expressions)",
              notes: [],
              visible: false,
              code: [`WITH ctepoddotaz as
 (SELECT 1 jednicka, 'milion' dvojka)
 SELECT c.jednicka, c.dvojka FROM ctepoddotaz c;`,
`
 WITH terorcountry as
 (SELECT DISTINCT t.gname skupina, c.name zeme FROM teror2 t INNER JOIN country c ON t.country=c.id)
 SELECT * FROM terorcountry;`,
`
 WITH 
 rukojmi_po_letech_fake AS
 (SELECT iyear, sum(nhostkid) as rukojmi_fake FROM teror WHERE weaptype1_txt='Fake Weapons' and nhostkid <> -99 GROUP BY iyear), 
 rukojmi_po_letech_bez_fake AS
 (SELECT iyear, sum(nhostkid) as rukojmi_bez_fake  FROM teror WHERE weaptype1_txt<>'Fake Weapons' and nhostkid <> -99 GROUP BY iyear)
 --spojeni pres roky
 SELECT  f.iyear, f.rukojmi_fake, bf.rukojmi_bez_fake
 FROM rukojmi_po_letech_fake f 
 LEFT JOIN rukojmi_po_letech_bez_fake bf
 ON f.iyear=bf.iyear;`,
`
 WITH cte AS (SELECT gname, eventdate FROM teror2 WHERE country = 54)
 SELECT * FROM cte;
`]
            }
          ],
          tasks: [
            { 
              header: "Vypiš všechny teroristické události v zemi, kde bylo spácháno nejvíce terosticých útoků. Vyber sloupečky city, country_txt a nkill. Výsledek seraď podle názvu města",
              screen: require("@/assets/practice/lessons/6A.png"),
              code:
`
SELECT city, t.country_txt, t2.country_txt, nkill 
FROM teror AS t
JOIN
(
 SELECT country_txt, COUNT(country_txt) AS pocet 
 FROM teror 
 GROUP BY country_txt 
 ORDER BY pocet DESC 
 LIMIT 1
) AS t2
ON t.country_txt=t2.country_txt
ORDER BY city;
-- varianta s výběrem země přímo
SELECT city, country_txt, nkill 
FROM teror AS t
WHERE country_txt = (SELECT country_txt FROM teror GROUP BY country_txt ORDER BY COUNT(*) DESC LIMIT 1)
ORDER BY city;
`
            },
            {
              header: "Vyber všechny organizace, které nespáchaly útok v evropě. Výsledek seřaď podle názvu organizace vzestupně",
              screen: require("@/assets/practice/lessons/6B.png"),
              code:
`
-- CTE
WITH evropske as
(SELECT DISTINCT(gname) FROM teror WHERE region_txt ILIKE '%europe%')
SELECT DISTINCT(gname) 
FROM teror 
WHERE gname NOT IN (SELECT gname FROM evropske) 
ORDER BY gname;

-- subselect
SELECT DISTINCT(gname) 
FROM teror
WHERE gname NOT IN (SELECT DISTINCT(gname) FROM teror WHERE region_txt ILIKE '%europe%') 
ORDER BY gname;

-- Proč nejde použít tohle i když to dá stejný výsledek?
SELECT DISTINCT(gname) 
FROM teror 
WHERE region_txt NOT ILIKE '%europe%' 
ORDER by gname;
`
            },
            {
              header: "Co dělá následující select? WITH SUCORG AS (SELECT GNAME FROM teror2 WHERE NKILL > 0 GROUP BY GNAME HAVING COUNT(*) > 5), SERAZENO AS" +
                      "(SELECT GNAME, NKILL, IFNULL(NKILL, 0), NWOUND, EVENTDATE, COUNTRY, CITY, ROW_NUMBER() OVER (PARTITION BY GNAME ORDER BY IFNULL(NKILL, 0) DESC) RN" +
                      "FROM teror2 WHERE GNAME IN (SELECT GNAME FROM SUCORG))" +
                      "SELECT S.GNAME, S.NKILL, S.NWOUND, S.EVENTDATE, S.CITY,  C.NAME COUNTRY" +
                      "FROM SERAZENO S LEFT JOIN COUNTRY C ON S.COUNTRY = C.ID" +
                      "WHERE S.RN <= 3" +
                      "ORDER BY S.GNAME, NKILL DESC;"
            }
          ]
        },
        {
          name: "UNION a window funkce",
          lectures: [
            {
              header: "UNION vs UNION ALL",
              notes: [],
              visible: false,
              code: [`SELECT w.name,sum(nkill) AS mrtvi,sum( CASE WHEN nhostkid=-99 THEN NULL ELSE nhostkid END) rukojmi, sum(nwound) raneni 
 FROM public.teror2 t
 JOIN public.weaptype1 w
 ON t.weaptype1=w.id
 GROUP BY 1
 UNION ALL
 SELECT w.name,sum(nkill) AS mrtvi,sum( CASE WHEN nhostkid=-99 THEN NULL ELSE nhostkid END) rukojmi,sum(nwound) raneni 
 FROM public.teror2 t
 JOIN public.weaptype2 w
 ON t.weaptype2=w.id
 GROUP BY 1;`,
`
 SELECT w.name 
 FROM public.teror2 t
 JOIN public.weaptype1 w
 ON t.weaptype1=w.id
 UNION ALL 
 SELECT w.name
 FROM public.teror2 t
 JOIN public.weaptype2 w
 ON t.weaptype2=w.id;`,
`
 SELECT w.name 
 FROM public.teror2 t
 JOIN public.weaptype1 w
 ON t.weaptype1=w.id
 UNION ---- pozor odstrani neduplicity 
 SELECT w.name
 FROM public.teror2 t
 JOIN public.weaptype2 w
 ON t.weaptype2=w.id;
 `]
            },
            
            {
              header: "Window funkce",
              subheaders: ["RANK() - vrátí pořadí každého záznamu po jednotlivých částech (partitions)", 
              "ROW_NUMBER() - vrátí pořadové číslo řádku s možností rozdělení na části (partitions) a seřazení. Začíná od 1 pro každou skupinu", 
              "DENSE_RANK() - vrátí pořadí každého záznamu po jednotlivých částech (partitions) bez mezer mezi pořadími", 
              "NTILE(argument) – Rozdělí řádky do n skupin v závislosti na argumentu"],
              code: [`
 -- Vybere seřazené organizace podle počtu obětí sestupně a přiřadí jim pořadí (rank)
 SELECT gname, sum(nkill), RANK() OVER (ORDER BY sum(nkill) DESC) AS rank
 FROM teror
 WHERE nkill IS NOT NULL
 GROUP BY gname
 ORDER BY sum(nkill) DESC;`,
 `
 -- Vybere seřazené organizace podle počtu obětí sestupně a přiřadí jim pořadí (rank) v rámci roku.
 SELECT gname, iyear, sum(nkill)
 ,ROW_NUMBER() OVER (ORDER BY sum(nkill) DESC) AS rn
 ,RANK() OVER (PARTITION BY iyear ORDER BY sum(nkill) DESC) AS rank
 FROM teror
 WHERE nkill IS NOT NULL
 GROUP BY gname, iyear
 ORDER BY sum(nkill) DESC;`,
`
 -- Vybere seřazené organizace podle počtu obětí sestupně a přiřadí jim pořadí (rank) v rámci roku. Nakonec vybereme jen první tři z každého roku.
 SELECT * FROM
 (SELECT gname, iyear, sum(nkill) as pocet_mrtvych
 ,ROW_NUMBER() OVER (ORDER BY sum(nkill) DESC) AS rn
 ,RANK() OVER (PARTITION BY iyear ORDER BY sum(nkill) DESC) AS rank
 FROM teror
 WHERE nkill IS NOT NULL
 GROUP BY gname, iyear
 ORDER BY rank, iyear DESC) WHERE rank <= 3;
`]
            }
          ],
          tasks: [
            {
              header: "Vypiš tři největší útoky pro organizace s víc než 500 obětmi. Vypiš sloupečky city, gname a nkill a rank. Výsledek seřaď podle gname a rank",
              screen: require("@/assets/practice/lessons/7A.png"),
              code:
`
SELECT city, gname, nkill, rank FROM (
  SELECT *, RANK() OVER (PARTITION BY gname ORDER BY nkill DESC) AS rank FROM teror
  WHERE nkill IS NOT NULL AND gname IN (SELECT gname as sk FROM teror GROUP BY gname HAVING sum(nkill) > 500 ORDER BY sum(nkill))
 ) WHERE rank <= 3
ORDER BY gname, rank;
`
            },
            {
              header: "Vypiš 5 nejaktivnějších organizací podle regionu. Výsledek seraď podle regionu a ranku.",
              screen: require("@/assets/practice/lessons/7B.png"),
              code:
`
 SELECT * FROM
 (SELECT gname, region_txt, COUNT(*) as pocet_akci
 ,RANK() OVER (PARTITION BY region_txt ORDER BY pocet_akci DESC) AS rank
 FROM teror
 WHERE nkill IS NOT NULL
 GROUP BY gname, region_txt
 ) WHERE rank <= 5 ORDER BY region_txt, rank;
`
            }
          ]
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
