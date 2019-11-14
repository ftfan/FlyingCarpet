<template>
  <div>
    <van-steps :active="stepActive">
      <van-step>登录/注册</van-step>
      <van-step>商家接单</van-step>
      <van-step>买家提货</van-step>
      <van-step>交易完成</van-step>
    </van-steps>
  </div>
</template>

<script lang="ts">
import { Component, Vue, Provide } from 'vue-property-decorator';
import { ethers } from 'ethers';

@Component({
  components: {
  },
})
export default class Login extends Vue {
  @Provide() public stepActive = 0;
  @Provide() public mnemonicTemp = '';
  public created() {
    let entropy = ethers.utils.randomBytes(16);
    let mnemonicTemp = ethers.utils.HDNode.entropyToMnemonic(entropy);
    while (this.CheckHasDupWord(mnemonicTemp)) {
      entropy = ethers.utils.randomBytes(16);
      mnemonicTemp = ethers.utils.HDNode.entropyToMnemonic(entropy);
    }
    this.mnemonicTemp = mnemonicTemp;
  }

  public CheckHasDupWord(mnemonicWords: string) {
    const mnemonicWordList = mnemonicWords.split(' ');
    const obj: { [index: string]: boolean; } = {};
    for (const word of mnemonicWordList) {
      if (Object.prototype.hasOwnProperty.call(obj, word)) {
        return true;
      }
      obj[word] = true;
    }
    return false;
  }
}
</script>

<style lang="scss" scoped>

</style>
