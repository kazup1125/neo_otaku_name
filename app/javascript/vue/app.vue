<template>
  <div id="app" class="container">
    <br><br><br><br><br><br><br><br>
    <div class="row justify-content-center">
      <h2>オタク用語を標準語に変換する</h2>
    </div>
    <br>
    <div class="row justify-content-center">
      <div class="col-6">
        <select v-model="inputWord" class="form-control" @change="convertIntoStandardWord">
          <option disabled value="">選択してください</option>
          <option v-for="otakuWord in otakuWords" v-bind:value="otakuWord.word" v-bind:key="otakuWord.id">
            {{ otakuWord.word }}
          </option>
        </select>
      </div>
    </div>
      <br><br>
    <div class="row justify-content-center">
      <h4 class="text-primary">{{ result.standard }}</h4>
    </div>
    <div class="row justify-content-center">
      <p class="text-primary">{{ result.description }}</p>
    </div>
    <br><br>
    <div class="row justify-content-center">
      <button type="button"
              class="btn btn-warning"
              @click="clearText">クリア
      </button>
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
      });
    },
    methods: {
      convertIntoStandardWord(){
        const searchResult = this.otakuWords.find((otakuWord) => {
          return (otakuWord.word === this.inputWord);
        });
        this.result.standard = searchResult.meaning;
        this.result.description = searchResult.description;
      },
      clearText(){
        this.result.standard = ''
        this.result.description = ''
      }
    }
  }
</script>

<style scoped lang="scss">
</style>
