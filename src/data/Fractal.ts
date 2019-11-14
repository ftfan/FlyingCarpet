import Data from '@/lib/data';
import * as fractal from 'fractal-web3';

class Store extends Data {
  public readonly state = {
  };

  public readonly localState: {
    Data: { [index: string]: any; };
  } = {
    Data: {

    },
  };

  protected name = `Fractal`;

  constructor() {
    super();
    this.initilization();
  }

  // 获取当前数据
  public GetDataFromLocal(fileName: string, chainId: null | number = null) {
    if (chainId === null) {
      chainId = fractal.ft.getChainId();
    }
    if (chainId === null) {
      return;
    }
    const data = this.localState.Data[fileName];
    if (data) {
      return data[chainId];
    }
    return null;
  }
}

export const FractalStore = new Store();
