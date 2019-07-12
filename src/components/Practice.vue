<template>
  <v-container fluid fill-height>
    <v-layout>
        <v-flex>
          <ul>
            <li>B - Praxe První pokus, zatím bez tabulek
                <ul>
                  <li>
                      Příkaz SELECT, kterým z databáze něco vydoluješ
                      Necháš si nejdřív vrátit jedničku, to je to nejjednodušší, co SQL umí:
                      <b>SELECT 1;</b>
                  </li>
                  <li>
                      Pak si necháš vrátit řetězec (text, string)
                      <b>SELECT ‘cokoliv te napadne @&$*/684321’;</b>
                  </li>
                  <li>
                      Vrácený sloupeček si můžeš nějak pojmenovat a taky jich můžeš mít víc za sebou
                      <b>SELECT ‘cokoliv te napadne @&$*/684321’ AS jednorozec, 333 AS stribrna_strikacka;</b>
                  </li>
                  <li>
                      Můžeš počítat s čísly a spojovat stringy
                      <b>SELECT ‘cokoliv ‘ || ‘te napadne @&$*/684321’ AS jednorozec, 3*111 AS stribrna_strikacka;</b>
                  </li>
                  <li>
                    Taky můžeš použít nějakou funkci, to je teprv legrace
                    <b>SELECT CURRENT_DATE() AS dnes, trim(‘ cokoliv ‘) AS bezmezer;</b>
                  </li>
                </ul>
            </li>
          </ul>
          <p>
          A ted pár poznámek: ...
          První pokus s tabulkou
          <ul>
            <li>ss</li>
            <li>ss</li>
          </ul>
          Jednou budeš muset i rozlišovat malá a velká písmena, nebo pracovat v databázi, kde se kreativni vývojáři nebáli mezer a speciálních znaků
          </p>

          <ul>
            <li>jednoduchej select
                <ul>
                  <li>první pokus</li>
                  <li>vsechno</li>
                  <li>omezeni sloupecku</li>
                  <li>filtrovani radek</li>
                </ul>
            </li>
            <li>jednoduchej select
                <ul>
                  <li>prejmenovani sloupecku</li>
                  <li>spojeni sloupecku</li>
                  <li>nasobeni, deleni</li>
                </ul>
            </li>
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
            <li>jednoduchej select
                <ul>
                  <li>prejmenovane spojene sloupecky</li>
                  <li>where x in ()</li>
                  <li>where year(x) in ()</li>
                </ul>
            </li>
            <li>vytvoreni tabulky ze selectu
                <ul>
                  <li>create table as select</li>
                  <li>create table as select s pretypovanim</li>
                  <li>create table as select s prejmenovanim</li>
                  <li>create table as select s vyhazenim sloupecku a radek</li>
                </ul>
            </li>
          </ul>
        </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  name: "Practice"
}
</script>