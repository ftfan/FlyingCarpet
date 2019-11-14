<template>
  <div>
    <van-swipe :autoplay="3000" indicator-color="white" style="height:150px;line-height:150px;text-align:center;background-color:rgb(25, 137, 250);">
      <van-swipe-item>1</van-swipe-item>
      <van-swipe-item>2</van-swipe-item>
      <van-swipe-item>3</van-swipe-item>
      <van-swipe-item>4</van-swipe-item>
    </van-swipe>
    <van-notice-bar text="通知内容很长很长的时候。出现滚动。。。通知内容很长很长的时候。出现滚动。。。" left-icon="volume-o"/>
    <van-grid :column-num="2">
      <van-grid-item icon="home-o" text="文字" dot />
      <van-grid-item icon="search" text="文字" info="99+" />
    </van-grid>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';

@Component({
  components: {
  },
})
export default class Home extends Vue {}
</script>

<style lang="scss" scoped>

</style>
