declare module '*.vue' {
  import Vue from 'vue';
  export default Vue;
}

declare module 'fractal-web3' {
  export var account: any;
  export var dpos: any;
  export var ft: any;
  export var p2p: any;
  export var txpool: any;
  export var utils: any;
  export var fee: any;
}
