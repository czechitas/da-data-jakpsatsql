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

import lesson0_explain from "../assets/notebooks/azure/lesson00_explain.ipynb"
import lesson0_train from "../assets/notebooks/azure/test.ipynb";
import lesson1_explain from "../assets/notebooks/azure/lesson01_explain.ipynb"
import lesson1_train from "../assets/notebooks/azure/test.ipynb";
import lesson2_explain from "../assets/notebooks/azure/lesson02_explain.ipynb"
import lesson2_train from "../assets/notebooks/azure/test.ipynb";
import lesson3_explain from "../assets/notebooks/azure/lesson03_explain.ipynb"
import lesson3_train from "../assets/notebooks/azure/test.ipynb";
import lesson4_explain from "../assets/notebooks/azure/lesson04_explain.ipynb"
import lesson4_train from "../assets/notebooks/azure/test.ipynb";
import lesson5_explain from "../assets/notebooks/azure/lesson05_explain.ipynb"
import lesson5_train from "../assets/notebooks/azure/test.ipynb";
import lesson6_explain from "../assets/notebooks/azure/lesson06_explain.ipynb"
import lesson6_train from "../assets/notebooks/azure/test.ipynb";



export default {
  name: "Notebook",
  components: {
    VueMarkdown
  },
  data() {
    return {
        lessons: [
          {id: 0,
           name: "Základy",
           description: "Lekce 1 popisek",
           notebooks: [
             {nb_id:     1, 
              nb_type:   "explain",
              nb_data:   lesson0_explain},
             {nb_id:     2,
              nb_type:   "train",
              nb_data:   lesson0_train}
           ]},
          {id: 1,
           name: "WHERE",
           description: "Lekce 2 popisek",
           notebooks: [
             {nb_id:     1, 
              nb_type:   "explain",
              nb_data:   lesson1_explain},
             {nb_id:     2,
              nb_type:   "train",
              nb_data:   lesson1_train}
           ]},
          {id: 2,
           name: "GROUP BY + HAVING",
           description: "Lekce 3 popisek",
           notebooks: [
             {nb_id:     1, 
              nb_type:   "explain",
              nb_data:   lesson2_explain},
             {nb_id:     2,
              nb_type:   "train",
              nb_data:   lesson2_train}
           ]},
          {id: 3,
           name: "JOINy",
           description: "Lekce 4 popisek",
           notebooks: [
             {nb_id:     1, 
              nb_type:   "explain",
              nb_data:   lesson3_explain},
             {nb_id:     2,
              nb_type:   "train",
              nb_data:   lesson3_train}
           ]},
          {id: 4,
           name: "INSERT, DELETE, CREATE, ALTER a import dat",
           description: "Lekce 5 popisek",
           notebooks: [
             {nb_id:     1, 
              nb_type:   "explain",
              nb_data:   lesson4_explain},
             {nb_id:     2,
              nb_type:   "train",
              nb_data:   lesson4_train}
           ]},
          {id: 5,
           name: "JOINy II, vnořený SELECT a CTE",
           description: "Lekce 6 popisek",
           notebooks: [
             {nb_id:     1, 
              nb_type:   "explain",
              nb_data:   lesson5_explain},
             {nb_id:     2,
              nb_type:   "train",
              nb_data:   lesson5_train}
           ]},
          {id: 6,
           name: "UNION a window funkce",
           description: "Lekce 7 popisek",
           notebooks: [
             {nb_id:     1, 
              nb_type:   "explain",
              nb_data:   lesson6_explain},
             {nb_id:     2,
              nb_type:   "train",
              nb_data:   lesson6_train}
           ]}           
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