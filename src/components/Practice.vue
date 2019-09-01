<template>
  <v-container grid-list-md>
    <v-layout row wrap>
      <v-flex xs6 text-xs-center>
        <a href="https://hu05637.eu-west-1.snowflakecomputing.com/console/login#/"><img src="../assets/snowflake-logo-blue.png" alt="snowflake" title="snowflake"/></a>
      </v-flex>
      <v-flex xs6 text-xs-center>
        <v-chip color="blue" label x-large>
          <v-icon left>whatshot</v-icon>
          <a style="color:white;" href="https://www.start.umd.edu/gtd/">Teroristi - homepage</a>
        </v-chip>
        <v-chip class="ma-2" color="green" label x-large>
          <v-icon left>whatshot</v-icon>
          <a style="color:white;" href="https://www.start.umd.edu/gtd/downloads/Codebook.pdf">Teroristi - codebook</a>
        </v-chip>
      </v-flex>
      <v-flex xs12></v-flex>
      <v-flex xs12>
        <v-card>
          <v-tabs>
            <v-tab>Lekce 1</v-tab>
            <v-tab>Lekce 2</v-tab>
            <v-tab>Lekce 3</v-tab>
            <v-tab>Lekce 4</v-tab>
            <v-tab>Lekce 5</v-tab>
            <v-tab>Lekce 6</v-tab>
            <v-tab>Lekce 7</v-tab>
            <v-tab>Lekce 8</v-tab>
            <v-tab>Opacko</v-tab>
          

            <v-tab-item>
              <v-card flat color="basil">
                <v-card-text class="text-left">

                  <v-btn href="https://docs.google.com/presentation/d/17MPoQTt44GuqhpU4P5e0Fx8HBKzF1_tSKd9WW7UQLdw/edit?usp=sharing" target="_blank" color="primary">
                    Prezentace
                    <v-icon right dark>play_arrow</v-icon>
                  </v-btn>

                  <div style="padding: 2em;"></div>

                  <ul>
                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="headline">První select</span>
                        </v-flex>
                        <v-flex class="text-xs-right" xs8>
                          <v-btn color="warning" title="Zobrazit řešení" @click="iconClicked(0)" fab small dark outline>
                            <v-icon>{{ lesson1_icons[0] }}</v-icon>
                          </v-btn>
                        </v-flex>
                        <v-flex xs12>
                          <pre v-if="lesson1[0]" v-highlightjs>
                            <code class="sql">
                              SELECT 1; -- vybere 1
                            </code>
                          </pre>
                        </v-flex>
                      </v-layout>
                    </li>
                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="headline">Všechno</span>
                        </v-flex>
                        <v-flex class="text-xs-right" xs8>
                          <v-btn color="warning" title="Zobrazit řešení" @click="iconClicked(1)" fab small dark outline>
                            <v-icon>{{ lesson1_icons[1] }}</v-icon>
                          </v-btn>
                        </v-flex>
                        <v-flex xs12>
                          <pre v-if="lesson1[1]" v-highlightjs>
                            <code class="sql">
                              SELECT * FROM teror; -- vybere vsechny sloupce a radky z tabulky teror
                            </code>
                          </pre>
                        </v-flex>
                      </v-layout>
                    </li>

                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="headline">Omezení sloupečku</span>
                        </v-flex>
                        <v-flex class="text-xs-right" xs8>
                          <v-btn color="warning" title="Zobrazit řešení" @click="iconClicked(2)" fab small dark outline>
                            <v-icon>{{ lesson1_icons[2] }}</v-icon>
                          </v-btn>
                        </v-flex>
                        <v-flex xs12>
                          <pre v-if="lesson1[2]" v-highlightjs>
                            <code class="sql">
                              SELECT nkillter FROM teror; -- vybere pouze sloupec nkillter z tabulky teror
                            </code>
                          </pre>
                        </v-flex>
                      </v-layout>
                    </li>

                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="headline">Filtrovaní řádek</span>
                        </v-flex>
                        <v-flex class="text-xs-right" xs8>
                          <v-btn color="warning" title="Zobrazit řešení" @click="iconClicked(3)" fab small dark outline>
                            <v-icon>{{ lesson1_icons[3] }}</v-icon>
                          </v-btn>
                        </v-flex>
                        <v-flex xs12>
                          <pre v-if="lesson1[3]" v-highlightjs>
                            <code class="sql">
                              SELECT nkillter FROM teror WHERE nkillter > 100; -- vybere vsechny radky, kde je nkillter vetsi jak 100
                            </code>
                          </pre>
                        </v-flex>
                      </v-layout>
                    </li>

                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="headline">Přejmenovaní sloupečku</span>
                        </v-flex>
                        <v-flex class="text-xs-right" xs8>
                          <v-btn color="warning" title="Zobrazit řešení" @click="iconClicked(4)" fab small dark outline>
                            <v-icon>{{ lesson1_icons[4] }}</v-icon>
                          </v-btn>
                        </v-flex>
                        <v-flex xs12>
                          <pre v-if="lesson1[4]" v-highlightjs>
                            <code class="sql">
                              SELECT nkillter AS zabito_teroristu FROM teror;
                            </code>
                          </pre>
                        </v-flex>
                      </v-layout>
                    </li>

                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="headline">Spojeni sloupečků</span>
                        </v-flex>
                        <v-flex class="text-xs-right" xs8>
                          <v-btn color="warning" title="Zobrazit řešení" @click="iconClicked(5)" fab small dark outline>
                            <v-icon>{{ lesson1_icons[5] }}</v-icon>
                          </v-btn>
                        </v-flex>
                        <v-flex xs12>
                          <pre v-if="lesson1[5]" v-highlightjs>
                            <code class="sql">
                              SELECT mesto || stat FROM teror;
                            </code>
                          </pre>
                        </v-flex>
                      </v-layout>
                    </li>

                    <li>
                      <v-layout row wrap>
                        <v-flex xs4>
                          <span class="headline">Násobení, dělení</span>
                        </v-flex>
                        <v-flex class="text-xs-right" xs8>
                          <v-btn color="warning" title="Zobrazit řešení" @click="iconClicked(6)" fab small dark outline>
                            <v-icon>{{ lesson1_icons[6] }}</v-icon>
                          </v-btn>
                        </v-flex>
                        <v-flex xs12>
                          <pre v-if="lesson1[6]" v-highlightjs>
                            <code class="sql">
                              SELECT 25 * 30;
                            </code>
                          </pre>
                        </v-flex>
                      </v-layout>
                    </li>
                  </ul>
                  
                  <div style="padding: 2em;"></div>

                  <v-alert value="info" type="info" color="info" label="info" outline>
                    ÚKOLY
                  </v-alert>


                </v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat color="basil">
                <v-card-text>Lekce 2</v-card-text>
                <v-card-text>
                    Vyber z tabulky útoky v Německu, kde zemřel alespoň jeden terorista. 
                  </v-card-text>
                  <v-card-text>
                    <pre v-highlightjs><code class="sql">
                      Select * from terror where nkillter > 0 and countrytxt = 'Germany';
                    </code></pre>

                  <ul>
                  <li>jednoduchej select
                      <ul>
                        <li>where se string funkci</li>
                        <li>where s math funkci</li>
                        <li>where s date funkci</li>
                        <li>where and or and or ((())</li>
                        <li>like, ilike</li>
                        <li>between</li>
                      </ul>
                  </li>
                </ul>
                </v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat color="basil">
                <v-card-text>Lekce 3</v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat color="basil">
                <v-card-text>Lekce 4</v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat color="basil">
                <v-card-text>Lekce 5</v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat color="basil">
                <v-card-text>Lekce 6</v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat color="basil">
                <v-card-text>Lekce 7</v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat color="basil">
                <v-card-text>Lekce 8</v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat color="basil">
                <v-card-text>Opacko</v-card-text>
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
      lesson1: [false, false, false, false, false, false, false],
      lesson1_icons: ["visibility", "visibility",  "visibility",  "visibility",  "visibility",  "visibility",  "visibility"]
    }
  },
  methods: {
    iconClicked(index) {
      Vue.set(this.lesson1, index, !this.lesson1[index]);
      //this.lesson1[index] = !this.lesson1[index]
      this.lesson1_icons[index] = this.lesson1[index] ? "visibility_off" : "visibility"
      console.log(index)
    }
  }
}
</script>