<template>
  <v-container fluid fill-height>
    <v-layout>
        <v-flex>
          <v-stepper v-model="current_index" non-linear>
            <v-stepper-header>
              <v-stepper-step editable :color=color(1) complete-icon="mdi-check" edit-icon="mdi-check" @click=move(1) :complete=visited(1) step="1">Bylo nebylo</v-stepper-step>

              <v-divider></v-divider>

              <v-stepper-step editable :color=color(2) complete-icon="mdi-check" edit-icon="mdi-check" @click=move(2) :complete=visited(2) step="2">Da</v-stepper-step>

              <v-divider></v-divider>

              <v-stepper-step editable :color=color(3) complete-icon="mdi-check" edit-icon="mdi-check" @click=move(3) :complete=visited(3) step="3">Foto</v-stepper-step>
            </v-stepper-header>

            <v-stepper-items>
              <v-stepper-content step="1">
                <v-card class="mb-12" flat>
                  <v-card-text>
                    Jak to začalo? Ve zkratce jsme kdysi s druhým týpkem přezdívaným <a href="https://padak.keboola.com/"> Padák </a> viděli prezentaci závěrečných projektů Digitální akademie a bylo nám líto, 
                    že SQL spíš připomínalo Marušku z Dvanácti měsíčků než nepostradatelný IT nástroj, přešlapovalo ušmudlané v koutě a na práci s daty holky používaly radši python a excel. 
                    To jsme tak nechtěli nechat a protože nejsme žádní hateři, chopili jsme se příštího kurzu sami. Chtěli jsme to do holek nalít jednoduše, vtipně, efektivně. 
                    I proto jsme naskočili na Snowflake, databázi v cloudu, která se nemusí instalovat, takže se tím ušetří čas, který by zabrala minimálně jedna lekce. 
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
                    <img src="../assets/home/pavel_and_padak.png">
                  </v-card-text>
                </v-card>
                
                <v-btn color="secondary" @click=move(2)>
                  Zpět
                </v-btn>
              </v-stepper-content>
            </v-stepper-items>
          </v-stepper>
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
