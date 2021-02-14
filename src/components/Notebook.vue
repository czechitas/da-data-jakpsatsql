<template>
  <v-container fluid fill-height>   
    <v-layout>
        <v-flex>
          <v-item-group mandatory>
            <v-container>
              <v-row>
                <v-col>
                    <h6>Vyber lekci:</h6>
                </v-col>
                <v-col
                  v-for="n in ['da', 'dg','lecture']"
                  :key="n"
                  cols="1"
                  md="1"
                >
                  <v-item>
                    <v-card
                      :color="CurrentLecture == n ? 'primary' : ''"
                      dark
                      @click="setLecture(n)"
                    >
                        <div class="subtitle-1 text-center">
                          <!-- <img :src='require("@/assets/practice/" + n + "-logo.png")' height="30"> -->
                          {{n}}
                        </div>
                    </v-card>
                  </v-item>
                </v-col>
              </v-row>
            </v-container>
          </v-item-group>
          <v-item-group mandatory>
            <v-container>
              <v-row>
                <v-col>
                    <h6>Vyber databázi:</h6>
                </v-col>
                <v-col
                  v-for="n in ['azure','snowflake']"
                  :key="n"
                  cols="1"
                  md="1"
                >
                  <v-item>
                    <v-card
                      :color="CurrentPlatform == n ? 'primary' : ''"
                      dark
                      @click="setPlatform(n)"
                    >
                        <div class="display-3 flex-grow-1 text-center">
                          <img :src='require("@/assets/practice/" + n + "-logo.png")' height="30">
                        </div>
                    </v-card>
                  </v-item>
                </v-col>
              </v-row>
            </v-container>
          </v-item-group>

        <v-row>
          <v-col>
          <v-tabs>
            <!-- <v-tab @click="rotatePlatform()" color="basil"> Leave {{ this.CurrentPlatform }}</v-tab> -->
            <v-tab v-for="(lesson, i) in lessons[CurrentPlatform]" :key="i">{{ "Lekce " + (i + 1) + " - " + lesson.name }}</v-tab>
            <v-tab-item v-for="(lesson, lesson_index) in lessons[CurrentPlatform]" :key="lesson_index">
              <v-card flat color="basil">
                <!-- lekcovyjimky -->
                  <div v-if="lesson_index == 0" style="padding-bottom: 2em; padding-top: 1em;">
                    <center>
                      <v-btn href="https://docs.google.com/presentation/d/1i6WRNuwMw4MuwBl2guX7sIBP3aspdHDzcAq4LbmTAnk/edit?usp=sharing" target="_blank" color="primary">
                        Prezentace
                        <v-icon right dark>mdi-play</v-icon>
                      </v-btn>
                    </center>
                  </div>

                  <div v-if="lesson_index == 3" style="padding-bottom: 2em; padding-top: 1em;">
                    <center>
                      <v-btn href="https://drive.google.com/file/d/1Etyhq-gBka5-K1do905Q5SXLF-CdEPoh/view?usp=sharing" target="_blank" color="primary">
                        Join Bingo
                        <v-icon right dark>mdi-play</v-icon>
                      </v-btn>
                      <viewer style="cursor: zoom-in;"  :images="['../assets/practice/join.svg']" :options="viewerOptions">
                        <img src="../assets/practice/join.svg" alt="join" title="join" />
                      </viewer>
                      <v-alert color="info" outlined style="margin-bottom: 2em;">
                      <div class="headline">
                      SELECT
                        <span style="color: #ff0000;">eventid, eventdate, country, gname,</span>
                        <span style="color: #6aa84f;"> c.*</span>
                        FROM <span style="color: #ff0000;">teror2</span> AS <span style="color: #ff0000;">t2</span>
                        LEFT JOIN <span style="color: #6aa84f;">country</span> AS <span style="color: #6aa84f;">c</span>
                        &nbsp;<span style="color: #0000ff;">ON t2.country = c.id</span>
                      </div>
                      </v-alert>
                    </center>
                  </div>

                   <div v-if="lesson_index == 4" style="padding-bottom: 2em; padding-top: 1em;">
                    <center>

                      <v-btn :href='require("@/assets/practice/data/data.csv")' target="_blank" color="primary" download>
                        Stáhnout data.csv
                        <v-icon right dark>mdi-download</v-icon>
                      </v-btn>

                      <v-btn :href='require("@/assets/practice/data/ukol.csv")' target="_blank" color="primary" download>
                        Stáhnout ukol.csv
                        <v-icon right dark>mdi-download</v-icon>
                      </v-btn>
                    </center>
                  </div>
                  <!-- konec lekcovyjimek -->


                <v-card-text class="text-left" v-for="(nb,nb_index) in lesson.notebooks" v-bind:key="nb_index">
                  <div v-if="nb.nb_type === 'explain'"> <!-- vyklad -->
                    <div v-for="(cell, cell_index) in nb.nb_data['cells']" v-bind:key="cell_index">
                      <v-layout row wrap v-if="cell.cell_type === 'markdown'" >
                            <v-flex xs10 >
                                <br />
                                    <vue-markdown :source="cleanCRLF(cell.source)" />
                            </v-flex>
                    <v-flex xs2 class="text-right" xs8>
                      <v-btn color="warning" title="Zobrazit řešení" @click="showClicked(lesson_index, nb_index, cell_index+1)" fab small dark outlined>
                        <v-icon>{{ lessons[CurrentPlatform][lesson_index].notebooks[nb_index].nb_data['cells'][cell_index+1]['visible'] ? "mdi-eye-off" : "mdi-presentation" }}</v-icon>
                      </v-btn>
                    </v-flex>
                    <v-flex xs10>
                          <pre v-if="lessons[CurrentPlatform][lesson_index].notebooks[nb_index].nb_data['cells'][cell_index+1]['visible']" v-highlightjs>
                            <code class="sql" v-highlightjs>{{  lessons[CurrentPlatform][lesson_index].notebooks[nb_index].nb_data['cells'][cell_index+1].source
//asi z toho udelat nejakou formatovaci funkci dole v kodu
                              .filter(
                                function(value, index, arr){ 
                                return value != '%%sql\n'
                              }).join('')}}</code>
                          </pre>
                        </v-flex>
                    </v-layout>
                    </div>
                  </div>
                  <div v-if="nb.nb_type === 'train'"> <!-- ukoly -->
                  <v-alert type="info" color="info" label="info" outlined style="margin-bottom: 2em;">
                    ÚKOLY
                  </v-alert>
                  <ol type="A">
                    <div v-for="(task, task_index) in nb.nb_data['cells']" v-bind:key="task_index"> 
                     <li v-if="task.cell_type === 'markdown'">
                      <v-layout row wrap >
                            <v-flex xs10 >
                                <br />
                                    <vue-markdown :source="cleanCRLF(task.source)" />
                            </v-flex>
                        <v-flex class="text-right" xs2>
                          <v-btn v-if="lessons[CurrentPlatform][lesson_index].notebooks[nb_index].nb_data['cells'][task_index+1].cell_type === 'code'" color="error" title="Zobrazit kód" @click="hintClicked(lesson_index, nb_index, 'code', task_index)" fab small dark outlined>
                            <v-icon>{{ lessons[CurrentPlatform][lesson_index].notebooks[nb_index].nb_data['cells'][task_index+1]['visible'] ? "mdi-eye-off" : "mdi-code-braces" }}</v-icon>
                          </v-btn>
                          <v-btn v-if="getTaskImage(lesson_index, task_index) != ''" color="success" title="Zobrazit výsledek" @click="hintClicked(lesson_index, nb_index, 'img', task_index)" fab small dark outlined>
                            <v-icon>{{ task['img_visible'] ? "mdi-eye-off" : "mdi-help" }}</v-icon>
                          </v-btn>
                        </v-flex>
                        <v-flex>
                              <img v-if="getTaskImage(lesson_index, task_index) != '' && task['img_visible']" :src="getTaskImage(lesson_index, task_index)" alt="xindl" />
                              <pre v-if="task['visible']" v-highlightjs>
                               <code class="sql" v-highlightjs>{{ 
                                   lessons[CurrentPlatform][lesson_index].notebooks[nb_index].nb_data['cells'][task_index+1].source
                                   .filter(
                                      function(value, index, arr){ 
                                      return value != '%%sql\n'
                                    })
                                   .join('')
                                 }}</code>
                              </pre>
                        </v-flex>
                        <br /><br /><br />
                      </v-layout>
                     </li>
                    </div>
                    </ol>



                  </div>                    
                </v-card-text>
               
              </v-card>
            </v-tab-item>
          </v-tabs>
        </v-col>
        </v-row>
        </v-flex>
    </v-layout>
  </v-container>
</template>
        

<script>
import Vue from 'vue'
import VueMarkdown from 'vue-markdown-render'

import lesson0_explain from "../assets/notebooks/azure/lesson00_explain.ipynb"
import lesson0_train from "../assets/notebooks/azure/lesson00_train.ipynb";
import lesson1_explain from "../assets/notebooks/azure/lesson01_explain.ipynb"
import lesson1_train from "../assets/notebooks/azure/lesson01_train.ipynb";
import lesson2_explain from "../assets/notebooks/azure/lesson02_explain.ipynb"
import lesson2_train from "../assets/notebooks/azure/lesson02_train.ipynb";
import lesson3_explain from "../assets/notebooks/azure/lesson03_explain.ipynb"
import lesson3_train from "../assets/notebooks/azure/lesson03_train.ipynb";
import lesson4_explain from "../assets/notebooks/azure/lesson04_explain.ipynb"
import lesson4_train from "../assets/notebooks/azure/lesson04_train.ipynb";
import lesson5_explain from "../assets/notebooks/azure/lesson05_explain.ipynb"
import lesson5_train from "../assets/notebooks/azure/lesson05_train.ipynb";
import lesson6_explain from "../assets/notebooks/azure/lesson06_explain.ipynb"
import lesson6_train from "../assets/notebooks/azure/lesson06_train.ipynb";

import lesson0_snflk_explain from "../assets/notebooks/snowflake/lesson00_explain.ipynb"
import lesson0_snflk_train from "../assets/notebooks/snowflake/lesson00_train.ipynb";


export default {
  name: "Notebook",
  components: {
    VueMarkdown
  },
  data() {
    return {
        imageDir: "../assets/practice/lessons/",
        viewerOptions: { "toolbar": false, "navbar": false, "title": false },
        CurrentPlatform: "snowflake",
        CurrentLecture: "da",
        CellFilter: [
          {filter: '%%sql'}, 
          {filter: '#ignore'}
          ],
        lessons: 
          {azure: [
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
        ],
        snowflake: [
          {id: 0,
           name: "Základy",
           description: "Lekce 1 popisek",
           notebooks: [
             {nb_id:     1, 
              nb_type:   "explain",
              nb_data:   lesson0_snflk_explain},
             {nb_id:     2,
              nb_type:   "train",
              nb_data:   lesson0_snflk_train}
           ]},
           {id: 1,
           name: "Střechy",
           description: "Lekce 2 popisek",
           notebooks: [
             {nb_id:     1, 
              nb_type:   "explain",
              nb_data:   lesson0_snflk_explain},
             {nb_id:     2,
              nb_type:   "train",
              nb_data:   lesson0_snflk_train}
           ]}
        ]
        }
    }
  },
  mounted() {
    console.log('Component has been mounted!');

    this.lessons[this.CurrentPlatform].forEach(f_lesson => {
      console.log ('Lesson:' + f_lesson.name)
      f_lesson.notebooks.forEach(nb => {
        console.log ('Notebook: ' + nb.nb_id)
        if (nb.nb_type == 'explain') {
          nb.nb_data['cells'].forEach(cell => {
            console.log ('setting cell visible: ' + cell.metadata.azdata_cell_guid)
            Vue.set(cell, 'visible', true);
            cell['visible'] = false;
          });
        }
        else{
            nb.nb_data['cells'].forEach(cell => {
            console.log ('setting cell visible: ' + cell.metadata.azdata_cell_guid)
            Vue.set(cell, 'visible', true);
            Vue.set(cell, 'img_visible', true);
            cell['visible'] = false;
            cell['img_visible'] = false;
          });
        }
      });
    });
    this.lessons[this.CurrentPlatform].forEach(f_lesson => {
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
      console.log (this.lessons[this.CurrentPlatform][lesson_index].notebooks[nb_index].nb_id)
      console.log (this.lessons[this.CurrentPlatform][lesson_index].notebooks[nb_index].nb_data['cells'][cell_index]['visible'])

      console.log (this.lessons[this.CurrentPlatform][lesson_index].notebooks[nb_index].nb_data['cells'][cell_index]['visible'])
      this.lessons[this.CurrentPlatform][lesson_index].notebooks[nb_index].nb_data['cells'][cell_index]['visible'] = !this.lessons[this.CurrentPlatform][lesson_index].notebooks[nb_index].nb_data['cells'][cell_index]['visible']
      console.log (this.lessons[this.CurrentPlatform][lesson_index].notebooks[nb_index].nb_data['cells'][cell_index]['visible'])
    },hintClicked(lesson_index, nb_index, hint_type, hint_index) {
      console.log (`${lesson_index} ${nb_index} ${hint_type} ${hint_index} `)
      console.log (this.lessons[this.CurrentPlatform][lesson_index].notebooks[nb_index].nb_data['cells'][hint_index]['visible'])
      console.log (this.lessons[this.CurrentPlatform][lesson_index].notebooks[nb_index].nb_data['cells'][hint_index]['img_visible'])
      switch (hint_type) {
        case 'code': {
          this.lessons[this.CurrentPlatform][lesson_index].notebooks[nb_index].nb_data['cells'][hint_index]['visible'] = !(this.lessons[this.CurrentPlatform][lesson_index].notebooks[nb_index].nb_data['cells'][hint_index]['visible']);
        }
        break;
        case 'img': {
          this.lessons[this.CurrentPlatform][lesson_index].notebooks[nb_index].nb_data['cells'][hint_index]['img_visible'] = !this.lessons[this.CurrentPlatform][lesson_index].notebooks[nb_index].nb_data['cells'][hint_index]['img_visible'];
        }
        break;
      
        default:
          break;
      }   
    },
    setPlatform(platform) {
      console.log('Setting platform to ' + platform)
      this.CurrentPlatform = platform
    },
    setLecture(lecture) {
      this.CurrentLecture = lecture
    },
    cleanCRLF(inArray) {
     var markup  = inArray.map(function(item){
      return item.replace('\n', '');
     });
     return markup.join('\n')
    },
    getTaskImage(lesson_id, task_id) {
          var images = require.context('@/assets/practice/lessons/', false, /\.png$/)
          let taskImage = ''
          if (this.CurrentPlatform=='snowflake') {task_id = task_id*1 - 4}
          try {
            taskImage = images(`./lesson_${lesson_id}_${task_id}.png`)
            console.log(`img found for ./lesson_${lesson_id}_${task_id}.png`)
          } catch (error) {
            taskImage = ''
            console.log(`img not found for ./lesson_${lesson_id}_${task_id}.png`)
          }
          console.log (`lesson_${lesson_id}_${task_id}` + taskImage)
          return taskImage
    }
  }
}
</script>