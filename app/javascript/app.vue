<template>
  <div id="app">
    <table>
      <tbody>
        <tr>
          <th>NO.</th>
          <th>オタク語</th>
          <th>標準語</th>
        </tr>
        <tr v-for="w in otaku_words" :key="w.id">
          <td>{{ w.id }}</td>
          <td>{{ w.word }}</td>
          <td>{{ w.meaning }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
  import axios from 'axios';
  export default {
    data: function () {
      return {
        otaku_words: []
      }
    },
    mounted() {
      axios
      .get('/api/v1/otaku_words.json')
      .then(response => (this.otaku_words = response.data))
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
