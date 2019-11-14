<template>
  <div>
    <router-view></router-view>

    <van-tabbar :value="routeActive" @input="RouteChange" safe-area-inset-bottom>
      <van-tabbar-item name="Home" icon="wap-home">飞毯</van-tabbar-item>
      <van-tabbar-item name="List" icon="smile-comment">议论</van-tabbar-item>
      <!-- <van-tabbar-item icon="setting-o">收益</van-tabbar-item> -->
      <van-tabbar-item name="User" icon="manager">我</van-tabbar-item>
    </van-tabbar>
  </div>
</template>

<script lang="ts">
import { Component, Vue, Provide } from 'vue-property-decorator';
import { FractalStore } from './data/Fractal';

@Component<App>({
  components: {
  },
})
export default class App extends Vue {
  get routeActive() {
    return this.$route.name;
  }

  public RouteChange(name: string) {
    this.$router.push({ name });
  }
}
</script>
