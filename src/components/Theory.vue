,<template>
<v-container fluid fill-height>
  <v-layout>
    <v-flex>
        <i class="headline">
            Teorii doporučuju přeskočit a jít rovnou na věc. <!-- (odkaz na první cvičení)! --> A pravidlo, které platí všude, když něčemu nerozumíš, 
            zkus to vygooglit, určitě to už někdo vysvětlil líp než já. <!-- Anebo použij komentáře a zeptej se. -->
        </i>
        <br />
        <br />
        <br />
        <v-stepper v-model="current_index" non-linear>
            <v-stepper-header>
              <v-stepper-step editable :color=color(1) complete-icon="mdi-check" edit-icon="mdi-check" @click=move(1) :complete=visited(1) step="1">Proč se učíme SQL?</v-stepper-step>

              <v-divider></v-divider>

              <v-stepper-step editable :color=color(2) complete-icon="mdi-check" edit-icon="mdi-check" @click=move(2) :complete=visited(2) step="2">Americká tetka, IBM a SQL</v-stepper-step>

              <v-divider></v-divider>

              <v-stepper-step editable :color=color(3) complete-icon="mdi-check" edit-icon="mdi-check" @click=move(3) :complete=visited(3) step="3">Co to jsou data?</v-stepper-step>

              <v-divider></v-divider>

              <v-stepper-step editable :color=color(4) complete-icon="mdi-check" edit-icon="mdi-check" @click=move(4) :complete=visited(4) step="4">Ok, data chápu, ale co je to ta databáze?</v-stepper-step>
            </v-stepper-header>

            <v-stepper-items>
              <v-stepper-content step="1">
                <v-card class="mb-12" flat>
                  <v-card-text>
                    <p>
                        Datový analytik bez SQL je nesmysl. Datová analytička jakbysmet. Kdo viděl nějaký inzerát na analytika bez požadavku na SQL, je buď z Marsu, nebo trpí halucinacemi anebo dyslexií. 
                        SQL je dotazovací jazyk, díky němuž můžeme pracovat s daty v databázích. Howgh.
                    </p>
                    <a href="https://cs5.pikabu.ru/post_img/big/2015/02/16/7/1424082068_179818413.jpg" target="_blank"><img src="../assets/theory/google.jpg" width="800"></a>
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
                        Když se v elektronickém pravěku (~1970) objevily první databáze, bylo to v USA. Ještě předtím - v elektronických třetihorách - měla
                        každá aplikace data uložená jaksi po svém. Což byl nesmysl a tak logicky vznikly databáze a jazyk SQL. Proč nesmysl? 
                        Programátoři vlastně jakéhosi prapředka databází vyvíjeli pro každou aplikaci zvlášť a to zní jako opakovaná práce a to oni dost neradi.
                        Sdílet data mezi aplikacemi byla noční můra. Pracovat s daty bez aplikace vlastně nebylo možné bez zbastlených utilitek 
                        s pochybnou pověstí, to pro změnu děsilo a trápilo uživatele.
                    </p>
                    <p>
                        Prvními uživateli byli kromě vědců i úředníci a vojáci, respektive vojenští úředníci. Takže většinou paní v nejlepších
                        letech před důchodem. I to je možná jeden z důvodů, proč je SQL (standardizovaný strukturovaný dotazovací jazyk) vytvořen tak,
                        aby byl čitelný i lidským okem a člověk pracující 40 let v kartotéce, si za ním uměl něco představit. 
                        Minimálně jednoduché dotazy dávají jakýs takýs smysl i po doslovném překladu do češtiny. Zní to sice asi jako středoškolský
                        profesor informatiky na tripu, ale porozumět se tomu dá.
                    </p>
                    <a href="http://www.wang3300.org/images/timesharing.jpg" target="_blank"><img src="../assets/theory/wang.jpg" width="800"></a>
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
                        Představ si tabulku, libovolnou. Má řádky a sloupečky? Paráda. Jsou v prvním řádku názvy těch sloupečků?
                        Super. Právě si představuješ asi nejjednodušší formu dat.
                        Data jsou teď všude - od instagramu, přes chytrá města až po místy o trochu méně chytrou státní správu. 
                        A i úplně pitomé fotky v mobilu jsou vlastně uložené v databázi,
                        nebo hned v několika databázích zároveň. Skoro celý internet je taky uložený v databázi, protože jednou 
                        z výhod databází je, že se v nich s daty pracuje mnohem snáz,
                        než kdekoliv jinde, jako například na disku, v excelu, google sheetu, xml a tak vůbec..
                    </p>
                  </v-card-text>
                </v-card>
                
                <v-btn color="primary" @click=move(4)>
                  Dále
                </v-btn>

                <v-btn color="secondary" @click=move(2)>
                  Zpět
                </v-btn>
              </v-stepper-content>

              <v-stepper-content step="4">
                <v-card class="mb-12" flat>
                  <v-card-text>
                    <p>
                        Komunisti tomu říkali SŘBD a doteď se tahle zkratka vyskytuje v různých sylabech, viz obrázek ze skript Masarykovy Univerzity. 
                        Jak sis před chvílí představovala tu tabulku, tak ta někde musí být uložená. K tomu se líp než excel nebo textový soubor hodí databáze.
                    </p>    
                        <a href="http://www.ped.muni.cz/wtech/03_studium/cvt4/databaze.pdf" target="_blank"><img src="../assets/theory/srbd.png" width="350"></a>
                    <p>    
                        Databáze je systém, který nám uživatelům umožňuje s daty pracovat. Aby toho nebylo málo, vyskytuje se databáze na nějakém serveru, ale o tom později. 
                        Teď si představ, že tu tabulku nemáš jen jednu, ale je jich asi 3271.
                        Každou si pojmenuješ a to by mohlo stačit, jasně. Ale až začnou tabulky zase přibývat, dřív nebo později je budeš chtít naházet/roztřídit 
                        do nějakých adresářů, složek, folderů. Těm se v databázích říká schémata a plní stejnou funkci jako adresáře na disku,
                        umožňují nám objekty (nemusíme v databázi mít jen tabulky) uspořádat a hromadně omezit kdo má právo co vidět, měnit apod.
                        I tabulky, které nenaházíme do schémat ve schématu nakonec skončí, říká se mu defaultní nebo výchozí a v různých databázích
                        se různě jmenují.
                    </p>
                    
                    <a href="https://images.readwrite.com/wp-content/uploads/2018/06/architecture-business-cabinet-325229.jpg" target="_blank"><img src="../assets/theory/database.png" width="800"></a>
                  </v-card-text>
                </v-card>

                <v-btn color="secondary" @click=move(3)>
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
  name: "Theory",
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
