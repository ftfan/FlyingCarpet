import Vue from 'vue';
import VueRouter, { RouteConfig } from 'vue-router';

Vue.use(VueRouter);

function AsyncLoader(resolve: any, reject: any, component: Promise<any>) {
  component.then(resolve).catch(() => {
    alert('很抱歉，网络不给力,请稍后再试');
    reject('net error');
  });
}

const routes: RouteConfig[] = [
  {
    path: '/', name: 'Home',
    component: (s, j) => AsyncLoader(s, j, import('@/views/Home.vue')),
  },
  {
    path: '/login', name: 'Login',
    component: (s, j) => AsyncLoader(s, j, import('@/views/Login.vue')),
  },
  {
    path: '/list', name: 'List',
    component: (s, j) => AsyncLoader(s, j, import('@/views/List.vue')),
  },
  {
    path: '/user', name: 'User',
    component: (s, j) => AsyncLoader(s, j, import('@/views/User.vue')),
  },
];

// function toUpperCase(all: string, chat: string) {
//   return chat.toUpperCase();
// }
// const requireComponent = (require as any).context('@/views', true, /[\w]+\.vue$/);
// const files = requireComponent.keys();
// files.forEach((fileName: any) => {
//   const componentConfig = requireComponent(fileName);
//   const path = fileName.replace(/\.\//, '').replace(/\.vue/, '');

//   routes.push({
//     path,
//     name: path.replace(/([a-z])/i, toUpperCase)
//       .replace(/\/([a-z])/ig, toUpperCase)
//       .replace(/-([a-z])/ig, toUpperCase),
//     component: componentConfig.default || componentConfig,
//   });
// });


const router = new VueRouter({
  routes,
});

export default router;
