<template>
  <v-container fluid fill-height>
    <v-layout row wrap>
        <v-flex xs12 md4 lg4>
          <v-chip label color="pink" text-color="white">
            <v-icon left>label</v-icon>Pavel Chocholouš
          </v-chip>
          <v-chip label color="pink" text-color="white">
            <v-icon left>label</v-icon>Ondřej Hošák
          </v-chip>
          <v-chip label color="green" text-color="white">
            <v-icon left>label</v-icon>Kouč a lektor
          </v-chip>
          <v-img :src="ondra_a_pavel" @click="show" title="Ondřej Hošák a Pavel Chocholouš" alt="Ondřej Hošák a Pavel Chocholouš"></v-img>
          <v-chip label color="blue" text-color="white">
            <v-icon left>label</v-icon>Pavel napsal texty
          </v-chip>
          <v-chip label color="blue" text-color="white">
            <v-icon left>label</v-icon>Ondra udělal stránky
          </v-chip>
          <!-- <viewer style="cursor: zoom-in;" :images="['../assets/ondraapavel.jpg']" :options="viewerOptions">
            <v-img :src="ondra_a_pavel" title="Ondřej Hošák a Pavel Chocholouš" alt="Ondřej Hošák a Pavel Chocholouš"></v-img>
          </viewer> -->
        </v-flex>
        <v-flex xs12 md4 lg4>
          <v-chip label color="pink" text-color="white">
            <v-icon left>label</v-icon>Monika Vlčková
          </v-chip>
          <v-chip label color="green" text-color="white">
            <v-icon left>label</v-icon>Koučka
          </v-chip>
          <v-img :src="monca" @click="show" title="Monika Vlčková" alt="Monika Vlčková"></v-img>
          <v-chip label color="blue" text-color="white">
            <v-icon left>label</v-icon>Připravuje sekci užitečné
          </v-chip>
          <!-- <viewer style="cursor: zoom-in;" :images="['../assets/monca.jpg']" :options="viewerOptions">
            <v-img :src="monca" title="Monika Vlčková" alt="Monika Vlčková"></v-img>
          </viewer> -->
        </v-flex>
         <v-flex xs12 md4 lg4>
          <v-chip label color="pink" text-color="white">
            <v-icon left>label</v-icon>Markéta Boháčková
          </v-chip>
          <v-chip label color="green" text-color="white">
            <v-icon left>label</v-icon>Lektorka
          </v-chip>
          <v-img :src="market" @click="show" title="Markéta Boháčková" alt="Markéta Boháčková" aspect-ratio="0.75"></v-img>
          <v-chip label color="blue" text-color="white">
            <v-icon left>label</v-icon>Podílí se na tvorbě lekcí
          </v-chip>
          <!-- <viewer style="cursor: zoom-in;" :images="['../assets/market.jpg']" :options="viewerOptions">
            <v-img :src="market" title="Markéta Boháčková" alt="Markéta Boháčková"></v-img>
          </viewer> -->
        </v-flex>
        <v-flex xs12 md4 lg4>
          <v-chip label color="pink" text-color="white">
            <v-icon left>label</v-icon>Pavla Jirková
          </v-chip>
          <v-chip label color="green" text-color="white">
            <v-icon left>label</v-icon>Koučka
          </v-chip>
          <v-img :src="pavla" @click="show" title="Pavla Jirková" alt="Pavla Jirková" aspect-ratio="0.75"></v-img>
          <v-chip label color="blue" text-color="white">
            <v-icon left>label</v-icon>Dělá jazykovou korekturu a pomáhá s úkoly
          </v-chip>
          <!-- <viewer style="cursor: zoom-in;" :images="['../assets/pavla.jpg']" :options="viewerOptions">
            <v-img :src="pavla" title="Pavla Jirková" alt="Pavla Jirková"></v-img>
          </viewer> -->
        </v-flex>
        <v-flex xs12 md4 lg4>
          <v-chip label color="pink" text-color="white">
            <v-icon left>label</v-icon>Veronika Pešková
          </v-chip>
          <v-chip label color="green" text-color="white">
            <v-icon left>label</v-icon>Lektorka
          </v-chip>
          <v-img :src="veronika" @click="show" title="Veronika Pešková" alt="Veronika Pešková" aspect-ratio="0.75"></v-img>
          <v-chip label color="blue" text-color="white">
            <v-icon left>label</v-icon>Podílí se na tvorbě lekcí
          </v-chip>
          <!-- <viewer style="cursor: zoom-in;" :images="['../assets/veronika.png']" :options="viewerOptions">
            <v-img :src="veronika" title="Veronika Pešková" alt="Veronika Pešková"></v-img>
          </viewer> -->
        </v-flex>
        <v-flex xs12 md12 lg12>
            <viewer :images="images" class="viewer" ref="viewer" @inited="inited" :options="viewerOptions">
             <!--  <img v-for="src in images" :src="src" :key="src" class="image"> -->
            </viewer>
            <span class="overline">
              &copy; 2019 by Ondřej Hošák, source code is available on <a target="_blank" href="https://github.com/ondrej-hosak/JakPsatSQL">github</a>
            </span>
        </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  name: "About",
  data() {
    return {
      viewerOptions: { "toolbar": false, "navbar": false, "title": false },
      ondra_a_pavel: require("@/assets/ondraapavel.jpg"),
      market: require("@/assets/market.jpg"),
      monca: require("@/assets/monca.jpg"),
      pavla: require("@/assets/pavla.jpg"),
      veronika: require("@/assets/veronika.png"),
      // images: [require("@/assets/ondraapavel.jpg"), require("@/assets/market.jpg"), require("@/assets/monca.jpg"), require("@/assets/pavla.jpg"), require("@/assets/veronika.png")]
    }
  },
  methods: {
    inited (viewer) {
      this.$viewer = viewer;
    },
    show () {
      //this.$viewer.show();
    }
  },
}
</script>