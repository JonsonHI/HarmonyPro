
import ViewStateConstant from '../Constant/ViewStateConstant'
@Component
export struct  CommonStateView{

  @Prop viewState: string
  @BuilderParam netView:()=>void

  build(){
    if(this.viewState === ViewStateConstant.VIEW_STATE_SUCCESS){
        this.netView()
    }else{
      this.holdView()
    }
  }

  @Builder
  holdView(){
    if(this.viewState !== ViewStateConstant.VIEW_STATE_SUCCESS){
      Column(){
        Image($r('app.media.loading'))
          .width('50vp')
          .height('50vp')
        Text(this.changText())
          .width('50vp')
          .height('50vp')
      }
    }else{
      this.netView()
    }
  }

  changText(){
    switch (this.viewState) {
      case ViewStateConstant.VIEW_STATE_LOADING:
        return '加载中'
        break;
      case ViewStateConstant.VIEW_STATE_ERROR:
        return '加载异常'
        break;
      case ViewStateConstant.VIEW_STATE_NETWORK_ERROR:
        return '网络错误'
        break;
      default:
        break;
    }
  }

}