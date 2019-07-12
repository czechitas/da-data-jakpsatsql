<template>
<v-container fluid fill-height>
    <v-layout>
        <v-flex>
        <i class="headline">
            Teorii doporučuju přeskočit a jít rovnou na věc (odkaz na první cvičení)! A pravidlo, které platí všude, když něčemu nerozumíš, 
            zkus to vygooglit, určitě to už někdo vysvětlil líp než já. Anebo použij komentáře a zeptej se.
        </i>
        <v-divider style="margin-top: 25px;padding-bottom: 25px"></v-divider>

        <h1>Teorie</h1>
        
        <h3>Proč se učíme SQL?</h3>
        <p> 
            Datový analytik bez SQL je nesmysl. Datová analytička jakbysmet. Kdo viděl nějaký inzerát na analytika bez požadavku na SQL je buď z Marsu nebo trpí halucinacemi anebo dyslexií. 
            SQL je dotazovací jazyk, díky němuž můžeme pracovat s daty v databázích apod.
        </p>
        <a href="https://cs5.pikabu.ru/post_img/big/2015/02/16/7/1424082068_179818413.jpg" target="_blank"><img src="../assets/google.jpg" width="800"></a>
        <h3>Americká tetka, IBM a SQL</h3>
        <p>
            Když se v elektronickém pravěku objevily první databáze, bylo to v USA. Ještě předtím - v elektronických třetihorách měla každá aplikace data uložená jaksi po svém. 
            Což byl nesmysl a tak logicky vznikly databáze. A s nimi i dotazovací jazyk SQL. Prvními uživateli byli kromě vědců i úředníci a vojáci, respektive vojenští úředníci. 
            Takže většinou paní v nejlepších letech před důchodem. I to je možná jeden z důvodů, proč je SQL (standardizovaný strukturovaný dotazovací jazyk) vytvořen tak,
            aby byl čitelný i lidským okem a člověk pracující 40 let v kartotéce, si za ním uměl něco představit. 
            Minimálně jednoduché dotazy dávají jakýs takýs smysl i po doslovném překladu do češtiny. Zní to sice asi jako středoškolský profesor informatiky na tripu,
            ale porozumět se tomu dá.
        </p>
        <a href="http://www.wang3300.org/images/timesharing.jpg" target="_blank"><img src="../assets/wang.jpg" width="800"></a>
        <h3>Co to jsou data?</h3>
        <p>
            Představ si tabulku, libovolnou. Má řádky a sloupečky? Paráda. Jsou v prvním řádku názvy těch sloupečků? Super. Právě si představuješ asi nejjednodušší formu dat. 
            Data jsou teď všude - od instagramu, přes chytrá města až po místy o trochu méně chytrou státní správu. A i úplně pitomé fotky v mobilu jsou vlastně uložené v databázi,
            nebo hned několika databázích zároveň. Skoro celý internet je taky uložený v databázi, protože jednou z výhod databází je, že se v nich s daty pracuje mnohem snáz,
            než kdekoliv jinde, jako například na disku, v excelu, google sheetu, xml a tak vůbec..
        </p>
        <h3>Ok, data chápu, ale co je to ta databáze?</h3>
        <p>
            Komunisti tomu říkali SŘBD a doteď se tahle zkratka vyskytuje v různých sylabech, viz obrázek ze skript Masarykovy Univerzity. 
            Jak sis představovala tu tabulku, tak ta někde musí být uložená. K tomu se líp než excel nebo textový soubor hodí databáze.  
            <a href="http://www.ped.muni.cz/wtech/03_studium/cvt4/databaze.pdf" target="_blank"><img src="../assets/srbd.png" width="350"></a>
            Databáze je systém, který nám uživatelům umožňuje s daty pracovat. Aby toho nebylo málo, vyskytuje se databáze na nějakém serveru, ale o tom později. 
            Teď si představ, že tu tabulku nemáš jen jednu, ale je jich asi 3271.
            Každou si pojmenuješ a to by mohlo stačit, jasně. Ale až začnou tabulky zase přibývat, dřív nebo později je budeš chtít naházet/roztřídit do nějakých adresářů, složek, folderů.
            Těm se v databázích říká schémata a plní stejnou funkci jako adresáře na disku,
            umožňují nám objekty (nemusíme v databázi mít jen tabulky) uspořádat a hromadně omezit kdo má právo co vidět, měnit apod.
            I tabulky, které nenaházíme do schémat ve schématu skončí, říká se mu defaultní nebo výchozí a v různých databázích se různě jmenují.
        </p>
        
        <a href="https://images.readwrite.com/wp-content/uploads/2018/06/architecture-business-cabinet-325229.jpg" target="_blank"><img src="../assets/database.png" width="800"></a>
        </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  name: "Theory"
}
</script>