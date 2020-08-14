<template>
  <div id="app" class="container">
    <br><br><br><br><br><br><br><br>
    <div class="row justify-content-center">
      <h2>オタク用語を標準語に変換する</h2>
    </div>
    <br>
    <div class="row justify-content-center">
      <div class="col-6">
        <select v-model="inputWord" class="form-control">
          <option disabled value="">選択してください</option>
          <option v-for="otakuWord in otakuWords" v-bind:value="otakuWord.word" v-bind:key="otakuWord.id">
            {{ otakuWord.word }}
          </option>
        </select>
      </div>
      <button type="button"
              class="btn btn-primary"
              v-bind:disabled="inputWord === ''"
              @click="convertIntoStandardWord">変換
      </button>
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
        // 入力した単語がオタク用語一覧に含まれているか判別
        const isExists = this.otakuWords.some((otakuWord) => otakuWord.word === this.inputWord);
        if (isExists){
          // trueの時は、入力した単語とマッチする単語の意味(meaning)をresultに渡す
          const searchResult = this.otakuWords.find((otakuWord) => {
            return (otakuWord.word === this.inputWord);
          });
          this.result.standard = searchResult.meaning;
          this.result.description = searchResult.description;
        }else {
          // 存在しなかった場合は、resultに文字列を直打ちで入れる
          this.result.standard = '見つかりませんでした';
          this.result.description = '';
        }
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
