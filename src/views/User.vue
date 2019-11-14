<template>
  <div>
    <img class="user-poster" src="@/assets/bj.png">
    <van-row class="user-links">
      <van-col span="6">
        <van-icon name="records" />
        草稿
      </van-col>
      <van-col span="6">
        <van-icon name="comment-o" />
        公示中
      </van-col>
      <van-col span="6">
        <van-icon name="tosend" />
        投票中
      </van-col>
      <van-col span="6">
        <van-icon name="notes-o" />
        已结束
      </van-col>
    </van-row>

    <van-cell-group class="user-group">
      <van-cell icon="records" title="我的提案" is-link />
      <van-cell icon="points" title="参与的提案" is-link />
      <van-cell icon="gold-coin-o" title="关注的提案" is-link />
    </van-cell-group>

    <van-cell-group>
      <van-cell icon="gift-o" title="委托的人" is-link />
      <van-cell icon="gift-o" title="委托我的人" is-link />
    </van-cell-group>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';

@Component({
  components: {
  },
})
export default class User extends Vue {}
</script>

<style lang="scss" scoped>
.user {
  &-poster {
    width: 100%;
    height: 53vw;
    display: block;
  }
  &-group {
    margin-bottom: 15px;
  }
  &-links {
    padding: 15px 0;
    font-size: 12px;
    text-align: center;
    background-color: #fff;
    .van-icon {
      display: block;
      font-size: 24px;
    }
  }
}
</style>
