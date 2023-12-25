import HTNet from '../api/HttpUtils'
import {Api} from '../api/Api'
export class HomeModel{

  async getHomeList(callBack:Function){
   await HTNet.get('api/v2/feed',null,).then((data)=>{
      callBack(data)
    })
  }

  async getHomeUpList(callBack:Function){
    await HTNet.get(Api.urlOne + Api.HOME_LIST,null).then((data)=>{
        callBack(data)
    })
  }

}

let homeModel = new HomeModel()
export  default homeModel as HomeModel