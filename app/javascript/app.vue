<template>
  <div id="app" class="container">
    <div class="row justify-content-center">
      <h3>オタク用語→標準語に変換する</h3>
    </div>
    <div class="row justify-content-center">
      <div class="col-6">
        <input id="word" type="text" v-model="inputWord" class="form-control" placeholder="オタク用語を入力してください">
      </div>
      <button type="button" class="btn btn-primary" @click="convertIntoStandardWord">変換</button>
    </div>
      <br><br>
    <div class="row justify-content-center">
      <h4 class="text-primary">{{result.standard}}</h4>
    </div>
    <div class="row justify-content-center">
      <p class="text-primary">{{result.description}}</p>
    </div>
    <br><br>
    <div class="row justify-content-center">
      <button type="button" class="btn btn-warning" @click="clearDisplay">クリア</button>
    </div>
  </div>
</template>

<script>
  import axios from 'axios';
  export default {
    data: function () {
      return {
        inputWord: '',
        result: {
          standard: '',
          description: '',
        },
        otakuWords: []
      }
    },
    mounted() {
      axios
      .get('/api/v1/otaku_words.json')
      .then(response => {
        this.otakuWords = response.data
        console.log(response.data)
      });
    },
    methods: {
      convertIntoStandardWord(){
        const searchResult = this.otakuWords.find((otakuWord) => {
          return (otakuWord.word === this.inputWord);
        });
        this.result.standard = searchResult.meaning
        this.result.description = searchResult.description
      },
      clearDisplay(){
        this.result.standard = ''
        this.result.description = ''
      }
    }
  }
</script>

<style scoped lang="scss">
</style>
