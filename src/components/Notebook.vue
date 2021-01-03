<template>
  <v-container fluid fill-height>
    <v-layout>
        <v-flex>
          <v-tabs>
            
            <v-tab v-for="(lesson, i) in lessons" :key="i">{{ "Lekce " + (i + 1) + " - " + lesson.name }}</v-tab>
            <v-tab-item v-for="(lesson, lesson_index) in lessons" :key="lesson_index">
              <v-card flat color="basil">
                <v-card-text class="text-left" v-for="(nb,nb_index) in lesson.notebooks" v-bind:key="nb_index">

                    <div v-for="(cell, cell_index) in nb.nb_data['cells']" v-bind:key="cell_index">
                      <v-layout row wrap v-if="cell.cell_type === 'markdown'" >
                            <v-flex xs10 >
                                <br />
                                    <vue-markdown :source="cleanCRLF(cell.source)" />
                            </v-flex>
                    <v-flex xs2 class="text-right" xs8>
                      <v-btn color="warning" title="Zobrazit řešení" @click="showClicked(lesson_index, nb_index, cell_index+1)" fab small dark outlined>
                        <v-icon>{{ lessons[lesson_index].notebooks[nb_index].nb_data['cells'][cell_index+1]['visible'] ? "mdi-eye-off" : "mdi-presentation" }}</v-icon>
                      </v-btn>
                    </v-flex>
                    <v-flex xs10>
                          <pre v-if="lessons[lesson_index].notebooks[nb_index].nb_data['cells'][cell_index+1]['visible']" v-highlightjs>
                            <code class="sql" v-highlightjs>{{  lessons[lesson_index].notebooks[nb_index].nb_data['cells'][cell_index+1].source.join('')}}</code>
                          </pre>
                        </v-flex>
                    </v-layout>
                    </div>
                    
                </v-card-text>
              </v-card>
            </v-tab-item>
          </v-tabs>
        </v-flex>
    </v-layout>
  </v-container>
</template>
        

<script>
import Vue from 'vue'

import VueMarkdown from 'vue-markdown-render'

import nb_file from "../assets/notebooks/test.ipynb";

export default {
  name: "Notebook",
  components: {
    VueMarkdown
  },
  data() {
    return {
        nb_data: nb_file,
        lessons: [
          {id: 0,
           name: "lekce 1",
           description: "Lekce 1 popisek",
           notebooks: [
             {nb_id:     1, 
              nb_type:   "explain",
              nb_data:   nb_file},
             {nb_id:     2,
              nb_type:   "train",
              nb_data:   nb_file}
           ]
           
           },
          {id: 1,
           name: "lekce 2",
           description: "Lekce 2 popisek",
           notebooks: []}
           
        ]
    }
  },
  mounted() {
    console.log('Component has been mounted!');
    this.lessons.forEach(f_lesson => {
      console.log ('Lesson:' + f_lesson.name)
      f_lesson.notebooks.forEach(nb => {
        console.log ('Notebook: ' + nb.nb_id)
        nb.nb_data['cells'].forEach(cell => {
          console.log ('setting cell visible: ' + cell.metadata.azdata_cell_guid)
          Vue.set(cell, 'visible', true);
          cell['visible'] = false;
        });
      });
    });
    this.lessons.forEach(f_lesson => {
      f_lesson.notebooks.forEach(nb => {
        nb.nb_data['cells'].forEach(cell => {
          console.log (cell['visible'])
        });
      });
    });
  },
  methods: {
    showClicked(lesson_index, nb_index, cell_index) {
      console.log (lesson_index + ' ' + nb_index + ' ' + cell_index)
      console.log (this.lessons[lesson_index].notebooks[nb_index].nb_id)
      console.log (this.lessons[lesson_index].notebooks[nb_index].nb_data['cells'][cell_index]['visible'])

      console.log (this.lessons[lesson_index].notebooks[nb_index].nb_data['cells'][cell_index]['visible'])
      this.lessons[lesson_index].notebooks[nb_index].nb_data['cells'][cell_index]['visible'] = !this.lessons[lesson_index].notebooks[nb_index].nb_data['cells'][cell_index]['visible']
      console.log (this.lessons[lesson_index].notebooks[nb_index].nb_data['cells'][cell_index]['visible'])
    },
    cleanCRLF(inArray) {
     var markup  = inArray.map(function(item){
      return item.replace('\n', '');
     });
     return markup.join('\n')
    }
  }
}
</script>