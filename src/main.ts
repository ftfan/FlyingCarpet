import Vue from 'vue';
import App from './App.vue';
import router from './router';
import '@/assets/global.scss';
import Component from 'vue-class-component';

Component.registerHooks([
  'beforeRouteEnter',
  'beforeRouteLeave',
  'beforeRouteUpdate', // for vue-router 2.2+
]);
import Vant from 'vant';
import 'vant/lib/index.css';
import { FractalStore } from './data/Fractal';

Vue.use(Vant);

Vue.config.productionTip = false;

// router.beforeEach((to, from, next) => {
//   if (to.name === 'Login') {
//     return next();
//   }
//   const keystoreInfo = FractalStore.GetDataFromLocal('keystoreInfo');
//   if (keystoreInfo) {
//     return next();
//   }
//   next({ name: 'Login', replace: true });
// });


new Vue({
  router,
  render: (h) => h(App),
}).$mount('#app');
