<template>
  <v-container fluid fill-height>
    <v-layout>
        <v-flex>
          <v-stepper v-model="current_index" non-linear>
            <v-stepper-header>
              <v-stepper-step editable :color=color(1) complete-icon="check" edit-icon="check" @click=move(1) :complete=visited(1) step="1">Bylo nebylo</v-stepper-step>

              <v-divider></v-divider>

              <v-stepper-step editable :color=color(2) complete-icon="check" edit-icon="check" @click=move(2) :complete=visited(2) step="2">Da</v-stepper-step>

              <v-divider></v-divider>

              <v-stepper-step editable :color=color(3) complete-icon="check" edit-icon="check" @click=move(3) :complete=visited(3) step="3">Foto</v-stepper-step>
            </v-stepper-header>

            <v-stepper-items>
              <v-stepper-content step="1">
                <v-card class="mb-12" flat>
                  <v-card-text>
                    Jak to začalo? Ve zkratce jsme kdysi s druhým týpkem přezdívaným Padák (blog) viděli prezentaci závěrečných projektů digitální akademie a bylo nám líto, 
                    že SQL spíš připomínalo Marušku z Dvanácti měsíčků než nepostradatelný nástroj, přešlapovalo ušmudlané v koutě, a na práci s daty holky používaly radši python a excel. 
                    To jsme tak nechtěli nechat a protože nejsme žádní hateři, chopili jsme se příštího kurzu sami. Chtěli jsme to do holek nalít jednoduše, vtipně, efektivně. 
                    I proto jsme naskočili na  Snowflake, databázi v cloudu, která se nemusí instalovat a tím se ušetří minimálně jedna lekce. 
                    Vyházeli, nebo spíš vynechali jsme všechna témata, která nejsou pro začínajícího analytika důležitá, oholili teorii na dřeň a posunuli ji na konec. 
                    Prostě jsme chtěli, aby holky měly první select za sebou v první čtvrt hodině a další následovaly tak rychle, aby než se rozkoukají, 
                    byl konec kurzu a z party zelenáčů datařky.
                  </v-card-text>
                </v-card>

                <v-btn color="primary" @click=move(2)>
                  Dále
                </v-btn>
              </v-stepper-content>

              <v-stepper-content step="2">
                <v-card class="mb-12" flat>
                  <v-card-text>
                    Po dvou nebo třech bězích Digitální akademie se už nedalo ubránit volání holek po “strukturovaných materiálech, jako má Martin”. 
                    To je ten vysokej chlap, co učí Python (kodim.cz). Tady jsou, držím palce a doufám, že to bude i přes můj uspávací kostrbatý spisovný jazyk místy vtipné a jinde užitečné.
                  </v-card-text>
                </v-card>

                <v-btn color="primary" @click=move(3)>
                  Dále
                </v-btn>

                <v-btn color="secondary" @click=move(1)>
                  Zpět
                </v-btn>
              </v-stepper-content>

              <v-stepper-content step="3">
                <v-card class="mb-12" flat>
                  <v-card-text>
                    <img src="../assets/pavel_and_padak.png">
                  </v-card-text>
                </v-card>
                
                <v-btn color="secondary" @click=move(2)>
                  Zpět
                </v-btn>
              </v-stepper-content>
            </v-stepper-items>
          </v-stepper>

          <p>
          ptalo se me nekolik z vas individualne, kde si hrat se SQL, az vypnu snowflake. Cest je nekolik:
          </p>
          <p>
          ruzne *SQL fiddlery* (misto, kde si muzete zkouset psat dotazy nad nejakymi daty a ta vec vam ukaze, co to vraci):
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
            dost podobny, ale s trochou zabavy navic jsou vselijaky *SQL challenges*, kde krom toho prostredi na dotazy dostanete i nejake ukoly k vyreseni:
          </p>
          <ul>
            <li><a href="https://www.hackerrank.com/domains/sql">https://www.hackerrank.com/domains/sql</a></li>
            <li><a href="https://sqlzoo.net/%7C">https://sqlzoo.net/%7C</a></li>
            <li>
              <a href="https://www.google.com/search?q=sql+challenges+online&rlz=1C1GGRV_enCZ767CZ767&oq=sql+challenges+&aqs=chrome.1.69i57j0l5.6779j0j7&sourceid=chrome&ie=UTF-8">
              https://www.google.com/search?q=sql+challenges+online&rlz=1C1GGRV_enCZ767CZ767&oq=sql+challenges+&aqs=chrome.1.69i57j0l5.6779j0j7&sourceid=chrome&ie=UTF-8</a>
            </li>
          </ul>
          <p>
            a pak nejaka vase *zadarmo cloudova databaze*, do ktere si muzete nalit data a hrat si s nima z SQL klienta, nebo nejake appky, skriptu, proste odkudkoliv
          </p>
          <p>_uplne zadarmo_</p>
          <ul>
            <li><a href="https://www.heroku.com/postgres">https://www.heroku.com/postgres (max 10000 radek)</a></li>
            <li><a href="https://free.caspio.com/">https://free.caspio.com/ (ruzny omezeni v zadarmo verzi, ale celkem dost toho je zadarmicko)</a></li>
          </ul>
          <p>_na rok zadarmo_</p>
          <ul>
            <li><a href="https://azure.microsoft.com/en-us/pricing/details/sql-database/managed">https://azure.microsoft.com/en-us/pricing/details/sql-database/managed</a></li>
            <li>
              <a href="https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Categories=productcategories%23database">
                https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Categories=productcategories%23database
              </a>
            </li>
          </ul>
          <p>Peknej den</p>
        </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  name: "Home",
  data () {
      return {
        visited_indexes: [1],
        current_index: 1
      }
    },
  methods: {
    visited(step) {
      return this.visited_indexes.indexOf(step) != -1
    },
    color(step) {
      return this.current_index == step ? "tertiary" : "primary"
    },
    move(step) {
      this.current_index = step

      if (this.visited_indexes.indexOf(step) === -1) this.visited_indexes.push(step);
    }
  }
}
</script>