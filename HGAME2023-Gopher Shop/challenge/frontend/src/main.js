import { createApp  } from 'vue'
import App from './App.vue'
import router from './router'
import elementPlus from 'element-plus'
import 'element-plus/dist/index.css'

const app = createApp(App)

app.use(elementPlus)
app.use(router)
app.mount('#app')
