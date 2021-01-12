# jak_psat_sql

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).

## Edit lesson/topic content
### Lesson source & structure
Lessons are processed by Notebook.vue component, which has a configuration in src/assets/content_config .json (now it's inline in Notebook.vue). Here each lesson/topic has its associated notebooks in ipynb files. Each file has set its type - Explain/Train. Those two are formatted a bit differently and Trainig section adds a possibility to add a screenshot to the task.

```json
import lesson_1_explain from "../assets/notebooks/azure/lesson01_explain.ipynb"
import lesson_1_train from "../assets/notebooks/azure/lesson01_train.ipynb";
import lesson_2_explain from "../assets/notebooks/azure/lesson02_explain.ipynb"
import lesson_2_train from "../assets/notebooks/azure/lesson02_train.ipynb";



export default {
  name: "Notebook",
  components: {
    VueMarkdown
  },
  data() {
    return {
        lessons: [ //this has to be more structured for mor platforms eg. platform/lessons
          {id: 0,
           name: "1 - Basics",
           description: "Lesson 1Longer description",
           notebooks: [
             {nb_id:     1, 
              nb_type:   "explain",
              nb_data:   lesson_0_explain}, // !! -1 numbering
             {nb_id:     2,
              nb_type:   "train",
              nb_data:   lesson_0_train}
           ]},
          {id: 1,
           name: "WHERE",
           description: "Topic WHERE longer description",
           notebooks: [
             {nb_id:     1, 
              nb_type:   "explain",
              nb_data:   lesson1_explain},
             {nb_id:     2,
              nb_type:   "train",
              nb_data:   lesson1_train}
           ]}
        ]
```

## Notebook structure
Each notebook (/src/assets/notebooks) consists of markup & code cells, the order of the cells determines the order on the web. First cell has to be markup and the following cell has to be its code. This is called explain/code pair. Training notebooks has a special header in the app - "Úkoly" and if there's a picture in src/assets/lessons/lesson_x_y.png with x for lesson number and y for explain/code pair number.

> note: notebook always must contain explain/code pairs, when there`s a markup cell as the jast down in the notebook it just fails to render (this is to be fixed).

