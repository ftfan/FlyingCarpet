import Data from '@/lib/data';

class Store extends Data {
  public readonly state = {
  };

  public readonly localState = {
    initilization: false, // 是否初始化钱包
  };

  protected name = `User`;

  constructor() {
    super();
    this.initilization();
  }
}

export const UsertStore = new Store();
