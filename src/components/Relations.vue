<template>
  <v-container fluid fill-height>
    <v-layout>
        <v-flex>
          <v-stepper v-model="current_index" non-linear>
            <v-stepper-header>
              <v-stepper-step editable :color=color(1) complete-icon="check" edit-icon="check" @click=move(1) :complete=visited(1) step="1">Tabulky</v-stepper-step>

              <v-divider></v-divider>

              <v-stepper-step editable :color=color(2) complete-icon="check" edit-icon="check" @click=move(2) :complete=visited(2) step="2">Metadata</v-stepper-step>

              <v-divider></v-divider>

              <v-stepper-step editable :color=color(3) complete-icon="check" edit-icon="check" @click=move(3) :complete=visited(3) step="3">Procedury</v-stepper-step>
            </v-stepper-header>

            <v-stepper-items>
              <v-stepper-content step="1">
                <v-card class="mb-12" flat>
                  <v-card-text>
                    <img src="../assets/relations.png">
                    <!-- <viewer :images="['../assets/relations.png']"></viewer> -->
                    <br />
                    <br />
                    <p>
                      Vztahy mezi tabulkami jsou několika druhů. Auto může mít jen jednoho výrobce, ale ten vyrobí spoustu aut (1:N). VIN má každé auto jen jedno a naopak (1:1).
                      Majitelů může auto vystřídat i deset a stejně tak jeden chlápek může mít třeba dvacet aut (M:N). Normalizovaná databáze je šikovná pro většinu aplikací,
                      snadno se z ní dostane menší množství dat a stejně snadno se data v ní změní/přidají. Čitelnost lidským okem je sice mizerná, ale pro aplikace je normalizace naopak supervýhodná.
                      Jediné, kde může normalizovaná databáze pokulhávat je analytika. Tam se hodí její sestra ze zrcadla - denormalizovaná tabulka.
                      Ta má na na každém řádku ve sloupečku barva uloženou barvu v majitele, jméno, příjmení, číslo technického průkazu, obec kraj a zemi jeh vydání,
                      prostě všechno na jedné hromadě, v lidsky čitelné podobě.
                    </p>
                  </v-card-text>
                </v-card>

                <v-btn color="primary" @click=move(2)>
                  Dále
                </v-btn>
              </v-stepper-content>

              <v-stepper-content step="2">
                <v-card class="mb-12" flat>
                  <v-card-text>
                    <p>
                      Magické slovo, jednoduše data o datech, jednoduchým příkladem je tabulka obsahující názvy a parametry všech tabulek v databázi.
                      Někde se jim říká information schema, jinde system catalog, názvů je hodně, princip je stejný, data o datech.
                    </p>
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
                    <p>
                      Většina databází disponuje možností vytvářet uložené procedury. To je kus kódu, který po spuštění udělá nějakou komplexnější operaci,
                      může dostat i parametry. Tyto procedury mohou být psány buď v SQL, nebo procedurálním jazyce databáze třeba PL/SQL, nebo i v javě, pythonu, R atd.
                    </p>
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
//import Viewer from 'v-viewer'

export default {
  //components: {
  //    Viewer
  //},
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