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
      <h3>変換結果</h3>
      <br><br>
    </div>
    <div class="row justify-content-center">
      <h4 class="text-primary">{{standard}}</h4>
    </div>
    <div class="row justify-content-center">
      <p class="text-primary">{{description}}</p>
    </div>
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
        standard: '',
        description: '',
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
        // TODO 検索機能
        this.standard = this.otakuWords[0].meaning
        this.description = this.otakuWords[0].description
      },
      clearDisplay(){
        this.standard = ''
        this.description = ''
      }
    }
  }
</script>

<style scoped lang="scss">
</style>
