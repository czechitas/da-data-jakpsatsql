<template>
  <v-container fluid fill-height>
    <v-layout>
        <v-flex>
              <div>
                    <div v-for="(item) in nb_data['cells']" v-bind:id="item.cell_type" v-bind:key="item.id">
                      <div v-if="item.cell_type === 'markdown'" class=" ">
                          {{ item.source[0] }}
                      </div>
                      <b>{{ item.metadata.ondruv_element }}</b>
                      <pre v-if="item.cell_type === 'code'" v-highlightjs>
                        <code class="sql">
                              {{ item.source[0] }}
                        </code>
                      </pre>
                      <hr>
                      </div>
                      <hr>
              </div>
        </v-flex>
    </v-layout>
  </v-container>
</template>
        

<script>
import nb_file from "../assets/notebooks/test.json";
export default {
  name: "Notebook",
  data() {
    return {
        nb_data: nb_file
    }
  }
}
</script>