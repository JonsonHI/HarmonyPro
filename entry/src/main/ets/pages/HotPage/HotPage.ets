import Network from '@system.network'
import { CommonStateView } from '../../Component/CommonStateView'
import ViewStateConstant from '../../Constant/ViewStateConstant'
import findModel from '../../ViewModel/FindModel'
@Entry
@Component
export  struct HotPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING

  aboutToAppear(){
    findModel.getCategoryList((data)=>{
      this.viewState = ViewStateConstant.VIEW_STATE_SUCCESS
    })
  }

  build() {
    Row() {
      Column() {
        CommonStateView({viewState:this.viewState}){
          Text('zhuyemian')
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}