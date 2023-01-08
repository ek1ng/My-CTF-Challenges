<script>
import axios from 'axios'
import qs from 'qs'
import { NButton, NGradientText,NInput } from 'naive-ui'

export default {
  data() {
    return {
      question: "",
      score: "",
      answer: "",
    }
  },
  computed: {
  },
  methods: {
    getQuestion() {
      const res = axios.get('/api/getQuestion').then(res => {
        console.log(res)
        this.question = res.data.message
      })

    },
    getScore() {
      const res = axios.get('/api/getScore').then(res => {
        console.log(res.message)
        this.score = res.data.message
      })
    },
    verifyAnswer(answer) {
      axios.post('/api/verifyAnswer',
        qs.stringify({"id":answer}), {
        headers: {
          "Content-Type": "application/x-www-form-urlencoded"
        }
      }).then(res => {
        if (res.data.message == "Wrong answer!") {
          alert("Wrong,Try again")
        }else if(res.data.message =="Please get a question first!"){
          alert("Press F5 to fresh the page")
        } 
        else {
          this.getQuestion()
          this.getScore()  
          alert("Correct!")
        }
        console.log(res.data.message)
      })
    },
  },
  created() {
    this.getQuestion()
    this.getScore()
  },
  components: {
    NButton,
    NGradientText,
    NInput
  }
}

</script>


<template>
  <n-gradient-text type="info">
    Guess who I am
  </n-gradient-text>

  <div class="card">
    <!-- #009FE9 是Vidar蓝！ -->
    <h2 class="question" :value="question"><a href="https://vidar.club/member">Vidar-Team </a>Member Intro: {{ question }}</h2>
    <h2 class="score" :value="score">Score: {{ score }}</h2>
    <div class="answer">
    <n-input type="text" placeholder="Input Your Answer" v-model:value="answer" />
    <n-button tertiary @click="verifyAnswer(answer)">确认</n-button>
    </div>
  </div>

</template>

<style scoped>
.read-the-docs {
  color: #888;
}

.n-gradient-text {
  font-size: 108px;
}

.n-input {
  width: 300px;
  margin: 10px;
}

</style>
