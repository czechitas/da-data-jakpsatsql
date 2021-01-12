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

`import lesson5_explain from "../assets/notebooks/azure/lesson05_explain.ipynb"
import lesson5_train from "../assets/notebooks/azure/lesson05_train.ipynb";
import lesson6_explain from "../assets/notebooks/azure/lesson06_explain.ipynb"
import lesson6_train from "../assets/notebooks/azure/lesson06_train.ipynb";



export default {
  name: "Notebook",
  components: {
    VueMarkdown
  },
  data() {
    return {
        imageDir: "../assets/practice/lessons/",
        viewerOptions: { "toolbar": false, "navbar": false, "title": false },
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
           ]}


## Notebook structure
Each notebook consists of markup & code cells, the order of the cells determines the order on the web. First cell has to be markup and the following cell has to be its code. This is called instruction - result pair. Training notebooks has a special header in the app - "Úkoly" and if there's a picture in src/assets/lessons/lesson_x_y.png with x for lesson number and y for instuction - result pair number.



### Azure notebooks / topics

`
