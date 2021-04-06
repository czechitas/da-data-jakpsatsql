# Spotify Dataset 1921-2020

Datová sada *data.csv* obsahuje více než 175 000 hudebních stop (skladeb) shromážděných ze Spotify Web API.

Odkaz na kompletní dokumentaci [zde](https://www.kaggle.com/yamaerenay/spotify-dataset-19212020-160k-tracks?select=data.csv)

Datová sada má 19 sloupců:

| Sloupec | Popis | Detail |
| ------------- | ------------- | ------------- |
| acousticness | jak je skladba akustická | hodnota pohybující se od 0 do 1 |
| artists | seznam umělců podílejících se na produkci | |
| danceability | jak je skladba vhodná pro tanec | hodnota pohybující se od 0 do 1 |
| duration_ms | délka skladby v milisekundách |
| energy | energie skladby | hodnota pohybující se od 0 do 1 |
| explicit | binární hodnota, zda skladba obsahuje explicitní obsah | 0 = bez explicitního obsahu, 1 = explicitní obsah |
| id | jedinečný identifikátor (ID) skladby generovaný Spotify |
| instrumentalness | instrumentálnost skladby | hodnota pohybující se od 0 do 1 |
| key | primární klíč skladby zakódovaný jako celé číslo mezi 0 a 11 | zakódované tóny v oktávě (C=0,C#=1 atd.) |
| liveness | relativní doba, po kterou skladba zní jako živé vystoupení | hodnota pohybující se od 0 do 1 |
| loudness | hlasitost skladby v decibelech (dB) | desetinné číslo pohybující se od -60 do 0 |
| mode | binární hodnota vyjadřující, zda skladba začíná v durové stupnici | 0 = Moll, 1 = Dur |
| name | název skladby | |
| popularity | popularita skladby v poslední době, výchozí zemí je USA | hodnota pohybující se od 0 do 100 |
| release_date | datum vydání skladby | ve formátu rrrr-mm-dd / rrr-mm nebo jen rrrr |
| speechiness | jak moc skladba obsahuje jakýkoliv druh lidského hlasu | hodnota pohybující se od 0 do 1 |
| tempo | tempo skladby v rytmu za minutu (BPM) | desetinné číslo pohybující se od 50 do 150 |
| valence | míra hudební pozitivity, kterou skladba vyjadřuje | hodnota pohybující se od 0 do 1 |
| year | rok vydání skladby | rozmezí od 1921 do 2020 |