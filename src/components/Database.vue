<template>
  <v-container fluid fill-height>
    <v-layout>
        <v-flex>
           <v-stepper v-model="current_index" non-linear>
            <v-stepper-header>
              <v-stepper-step editable :color=color(1) complete-icon="check" edit-icon="check" @click=move(1) :complete=visited(1) step="1">Databáze</v-stepper-step>

              <v-divider></v-divider>

              <v-stepper-step editable :color=color(2) complete-icon="check" edit-icon="check" @click=move(2) :complete=visited(2) step="2">Příkazy (statementy)</v-stepper-step>

              <v-divider></v-divider>

              <v-stepper-step editable :color=color(3) complete-icon="check" edit-icon="check" @click=move(3) :complete=visited(3) step="3">Dotazy</v-stepper-step>

              <v-divider></v-divider>

              <v-stepper-step editable :color=color(4) complete-icon="check" edit-icon="check" @click=move(4) :complete=visited(4) step="4">Objekty</v-stepper-step>

              <v-divider></v-divider>

              <v-stepper-step editable :color=color(5) complete-icon="check" edit-icon="check" @click=move(5) :complete=visited(5) step="5">Enginy</v-stepper-step>

              <v-divider></v-divider>

              <v-stepper-step editable :color=color(6) complete-icon="check" edit-icon="check" @click=move(6) :complete=visited(6) step="6">Funkce, rozdíly</v-stepper-step>

              <v-divider></v-divider>

              <v-stepper-step editable :color=color(7) complete-icon="check" edit-icon="check" @click=move(7) :complete=visited(7) step="7">Rezervovaná slova a další odlišnosti</v-stepper-step>

              <v-divider></v-divider>

              <v-stepper-step editable :color=color(8) complete-icon="check" edit-icon="check" @click=move(8) :complete=visited(8) step="8">Tabulky a normalizace</v-stepper-step>
            </v-stepper-header>

            <v-stepper-items>
              <v-stepper-content step="1">
                <v-card class="mb-12" flat>
                  <v-card-text>
                    <p>
                      O každého by se měl někdo postarat, když má rýmu, nepouštět k němu neohlášené návštěvy, uvařit čaj a tak. O databáze se stará server. 
                      I když rýmu zrovna nemají. Mezi tebou a databázemi stojí server jako garde dáma a tlumočník v jedné osobě. Když ho požádáš o data z tabulky, zjistí nejdřív,
                      jak se databáze cítí a když v ní taková data jsou a máš k nim ta správná oprávnění, pošle do ní dotaz a vrátí ti odpověď.
                      Detail, v jakém se dají v databázích oprávnění nastavovat, je neuvěřitelný, samozřejmě na všechny objekty, čtení/zápis, ale i na sloupečky nebo řádky v tabulkách.
                      Serverů existuje mnoho, ale o tom později.
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
                      Příkaz je SQL kód, kterým server nutíš k nějaké činnosti. Jsou jich dva druhy a ty se ještě dál dělí. 
                      Mají krásná jména - DML a DDL. Je to snadné, Data Definition Language vytváří, mění a maže tabulky a ostatní objekty v databázi, zatímco Data Manipulation Language Vybírá,
                      upravuje a maže data v tabulkách.
                    </p>
                    <h3>Příkazy DDL:</h3>
                    <ul>
                      <li>CREATE</li>
                      <li>ALTER</li>
                      <li>DROP</li>
                    </ul>
                    <h3>Příkazy DML:</h3>
                    <ul>
                      <li>SELECT</li>
                      <li>INSERT</li>
                      <li>UPDATE</li>
                      <li>DELETE</li>
                    </ul>
                    <p>A teď hádanka, který příkaz co dělá (tohle nebude v testu)? Tady je SQL ještě opravdu srozumitelné na první pohled.</p>
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
                    <b>SELECT</b> je dotaz, dotaz je query. Tohle bude tvůj nejvíc nejlepší kamarád v praktické části, “selektovat” budeš až se ti bude kouřit od klávesnice. 
                    Důvod? Analytici se daty většinou přehrabují tam a zpátky jako design influencerky v antiq shopech. 
                    Vytváření tabulek a jejich plnění daty mají na svědomí většinou aplikace (vývojáři) anebo tajemný data warehouse (BI vývojáři). 
                    Tvorba tabulek a plnění daty si zažiješ v hodinách jen okrajově, v projektech už o kousek víc.

                    <h3>Data lifecycle in BI</h3>
                    user, appka, dwh, analyza, report, dashboard
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
                      Analytici, programátoři, možná všichni lidi jsou líní. A tak, když už horko těžko vypotí nějaký dotaz, nechtějí ho psát podruhé.
                      Uloží si ho do databáze pod nějakým jménem a voila, view (aka uložený pohled) je na světě.
                      A podobně jako views můžou být v databázi uložené indexy, funkce, procedury, sekvence, synonyma, materializované pohledy a spousta dalšího pekla.
                      Spíš? Jsi tu ještě? Haló! Teď možná nastala ta chvíle, kdy se mnou budeš souhlasit, že přeskočení teorie a hození do divoké řeky SELECTů, nebyl úplně nejhorší nápad.
                      Klid, už jsme za půlkou ;)
                    </p>
                    <a href="http://nippon-motors.com/wp-content/uploads/2012/04/Warehouse.jpg" target="_blank"><img src="../assets/engines.png" width="800"></a>
                  </v-card-text>
                </v-card>

                <v-btn color="primary" @click=move(5)>
                  Dále
                </v-btn>

                <v-btn color="secondary" @click=move(3)>
                  Zpět
                </v-btn>
              </v-stepper-content>

              <v-stepper-content step="5">
                <v-card class="mb-12" flat>
                  <v-card-text>
                    <p>
                      Engine aka databázový server je vlastně jenom šikovná aplikace, která databáze zpřístupňuje. A existuje hodně variant těchto serverů. 
                      Některé jsou zadarmo (PostgreSQL, SQLite, MariaDB...), jiné za peníze (Oracle, MS SQL, MySQL, Enterprise DB...). Aby to nebylo tak snadné,
                      nabízí Oracle free verzi Oracle DB XE, Microsoft SQL Express, MariaDB je klon MySQL a EnterpriseDB je placená verze PostgreSQL.
                      Kromě rozdělení na placené a free jde ještě databázové servery dělit podle mnoha dalších kritérií. Každá se může hodit na něco lépe a na něco už ne tak dobře.
                      Všechny zmíněné databázové servery je potřeba někam instalovat, respektive mít pro ně server, kde poběží. Snowflake je reprezentantem tzv. cloudových databází,
                      které se nikam neinstalují, jen někomu dáš číslo své kreditky a platíš za místo, výkon a podobně. Microsoft a Oracle také nabízí svoje enginy v cloudu,
                      Heroku je zase postgres v cloudu, AWS má svůj Redshit, Aurora, DynamoDB atd. 
                    </p>
                    <img src="../assets/database_functions.png" width="800">
                  </v-card-text>
                </v-card>

                <v-btn color="primary" @click=move(6)>
                  Dále
                </v-btn>

                <v-btn color="secondary" @click=move(4)>
                  Zpět
                </v-btn>
              </v-stepper-content>

              <v-stepper-content step="6">
                <v-card class="mb-12" flat>
                  <v-card-text>
                    <p>
                      SQL je standardizovaný strukturovaný dotazovací jazyk, standardizaci si ale samozřejmě každý výrobce/vývojářská komunita vysvětluje jinak.
                      Také každý ke standardu přilepuje svoje super featury. V SQL jako v každém jazyce existují různé funkce, například takové, které pracují s datumem,
                      funkce ale nejsou součástí standardu, takže získat z datumu rok, měsíc a den pravděpodobně dopadne trochu jiným dotazem v každém enginu.
                      Doporučuju se s tím smířit. Přechod mezi dvěma enginy je pro člověka jednoduchý - je to jako přechod z americké angličtiny na australskou (SQL nářečím se anglicky říká flavor),
                      těžší to mají aplikace, které využívají nějaký konkrétní engine u nich to je spíš jako dostat do Oktávky motor z Chevroletu. Ještě jednou pro uklidnění,
                      když se naučíš SQL ve Snowflake, přejít na MSSQL, Oracle, Postges nebo MySQL bude brnkačka.
                    </p>
                    <img src="../assets/database_functions.png" width="800">
                  </v-card-text>
                </v-card>

                <v-btn color="primary" @click=move(7)>
                  Dále
                </v-btn>

                <v-btn color="secondary" @click=move(5)>
                  Zpět
                </v-btn>
              </v-stepper-content>

              <v-stepper-content step="7">
                <v-card class="mb-12" flat>
                  <v-card-text>
                    <a href="https://my.visme.co/projects/01043rz6-sql-reserved#s1" target="_blank"><img src="../assets/forbidden_words.png" width="800"></a>
                    <p>
                      Aby ti engine rozuměl, má některá slova tzv. rezervovaná, tj. nejde je použít pro názvy sloupečků, tabulek apod. Příkladem takových rezervovaných slov je třeba table,
                      column, view, date, int apod. V nich se různé flavory (implementace) taky liší. Ale klid, nic zásadního. Některé enginy rozlišují v názvech objektů velká a malá písmena,
                      některé jsou velmi omezené v délce těchto názvů (nejmenší, co pamatuju je 32 znaků na název, Postgres má tuším 64.
                    </p>
                  </v-card-text>
                </v-card>

                <v-btn color="primary" @click=move(8)>
                  Dále
                </v-btn>

                <v-btn color="secondary" @click=move(6)>
                  Zpět
                </v-btn>
              </v-stepper-content>

              <v-stepper-content step="8">
                <v-card class="mb-12" flat>
                  <v-card-text>
                    <p>
                      Nápad propojování  tabulek pochází z relační algebry (viz úplně první obrázek), podle ní jsou i databáze pojmenované, celým jménem se jim říká relační databáze.
                      Normalizace je proces vnášení vztahů mezi tabulky, tzv relací. Jde o to nemít v databázi žádná data víckrát. 
                    </p>
                    <i>Příklad: V tabulce aut je sloupeček barva, v něm ale není barva, ale číslo řádku z tabulky barev.</i>
                  </v-card-text>
                </v-card>

                <v-btn color="secondary" @click=move(7)>
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
  name: "Database",
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