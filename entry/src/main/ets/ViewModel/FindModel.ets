import { Api } from '../api/Api'
import HTNet from '../api/HttpUtils'
export class FindModel{

  async  getCategoryList(callBack:Function){
    await HTNet.get(Api.urlOne+Api.FIND_LIST,null).then((data)=>{
      callBack(data)
    })
  }

  async getFocusList(parmas:Map<string,Object>,callBack:Function){
    await HTNet.get(Api.urlTwo+Api.FIND_FOUCSLIST,parmas).then((data)=>{
      callBack(data)
    })
  }


}

let findModel = new FindModel()
export default findModel as FindModel