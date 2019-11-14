<template>
  <div>
    <van-nav-bar
      title="标题"
      left-text="返回"
      right-text="按钮"
      left-arrow
    />
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
export default class List extends Vue {}
</script>

<style lang="scss" scoped>

</style>
