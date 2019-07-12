<template>
  <v-container fluid fill-height>
    <v-layout>
        <v-flex>
        <img src="../assets/relations.png" width="800">
        <p>
          Vztahy mezi tabulkami jsou několika druhů. Auto může mít jen jednoho výrobce, ale ten vyrobí spoustu aut (1:N). VIN má každé auto jen jedno a naopak (1:1).
          Majitelů může auto vystřídat i deset a stejně tak jeden chlápek může mít třeba dvacet aut (M:N). Normalizovaná databáze je šikovná pro většinu aplikací,
          snadno se z ní dostane menší množství dat a stejně snadno se data v ní změní/přidají. Čitelnost lidským okem je sice mizerná, ale pro aplikace je normalizace naopak supervýhodná.
          Jediné, kde může normalizovaná databáze pokulhávat je analytika. Tam se hodí její sestra ze zrcadla - denormalizovaná tabulka.
          Ta má na na každém řádku ve sloupečku barva uloženou barvu v majitele, jméno, příjmení, číslo technického průkazu, obec kraj a zemi jeh vydání,
          prostě všechno na jedné hromadě, v lidsky čitelné podobě.
        </p>
        <h3>Metadata</h3>
        <p>
          Magické slovo, jednoduše data o datech, jednoduchým příkladem je tabulka obsahující názvy a parametry všech tabulek v databázi.
          Někde se jim říká information schema, jinde system catalog, názvů je hodně, princip je stejný, data o datech.
        </p>
        <h3>Procedury</h3>
        <p>
          Většina databází disponuje možností vytvářet uložené procedury. To je kus kódu, který po spuštění udělá nějakou komplexnější operaci,
          může dostat i parametry. Tyto procedury mohou být psány buď v SQL, nebo procedurálním jazyce databáze třeba PL/SQL, nebo i v javě, pythonu, R atd.
        </p>
        </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  name: "Relations"
}
</script>