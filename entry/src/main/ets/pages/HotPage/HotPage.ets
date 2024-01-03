import Network from '@system.network'
import { CommonStateView } from '../../Component/CommonStateView'
import ViewStateConstant from '../../Constant/ViewStateConstant'
import findModel from '../../ViewModel/FindModel'
import { GrideListView } from './component/GrideListView'
import { RecommendDate } from './component/RecommendDate'

@Entry
@Component
export struct HotPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State imageArray: Array<object> = [
    { "name": $r('app.media.phone'), "text": "手机" },
    { "name": $r('app.media.commper'), "text": "电脑" },
    { "name": $r('app.media.watch'), "text": "手表" },
    { "name": $r('app.media.plan'), "text": "计划" },
    { "name": $r('app.media.reacter'), "text": "任务" },
  ]
  private scroll: Scroller = new Scroller()

  aboutToAppear() {
    // findModel.getCategoryList((data)=>{
    //   this.viewState = ViewStateConstant.VIEW_STATE_SUCCESS
    // })
    this.viewState = ViewStateConstant.VIEW_STATE_SUCCESS
  }

  build() {
    Column() {
      CommonStateView({ viewState: this.viewState }) {
        // Scroll(this.scroll) {
        Row() {
          Image($r('app.media.location')).width('30vp').height('30vp').margin(10)
          TextInput({ placeholder: '请输入' })
            .layoutWeight(1)
            .backgroundColor('white')
          Image($r('app.media.shop')).width('30vp').height('30vp').margin(10)
        }
        .height('60vp')
        .width('100%')
        .backgroundColor('#7BB7FD')
        .justifyContent(FlexAlign.SpaceBetween)

        Scroll(this.scroll) {
          Column() {
            Image('https://img2.baidu.com/it/u=2583042679,1637540478&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500')
              .width('100%')
              .height('160vp')
              .objectFit(ImageFit.Cover)
            //网格布局
            GrideListView({ imageArray: $imageArray })
            //今日推荐
            RecommendDate()
            Column() {
              Text('福利专区')
                .fontWeight(FontWeight.Bold)
                .width('100%')
                .height('40vp')
                .margin({left:20})
                .fontSize(20)
              Divider().width('100%').height(1).backgroundColor('#f5f5f5f5')
              Column(){
                Row(){
                  Column(){
                    Text('你得专属福利').fontSize(18)
                    Text('限时领取').fontColor('#151F2B')
                  }
                  .alignItems(HorizontalAlign.Start)
                  Divider().width(1).height(30).backgroundColor('#f5f5f5f5')
                  Column(){
                    Text('你得专属福利').fontSize(18)
                    Text('限时领取').fontColor('#151F2B')
                  }
                  .alignItems(HorizontalAlign.End)
                }
                .padding(10)
                .height(60)
                .width('100%')
                .justifyContent(FlexAlign.SpaceBetween)

              }
              Column(){
                Row(){
                  Column(){
                    Text('你得专属福利').fontSize(18)
                    Text('限时领取').fontColor('#151F2B')
                  }
                  .alignItems(HorizontalAlign.Start)
                  Divider().width(1).height(30).backgroundColor('#f5f5f5f5')
                  Column(){
                    Text('你得专属福利').fontSize(18)
                    Text('限时领取').fontColor('#151F2B')
                  }
                  .alignItems(HorizontalAlign.End)
                }
                .padding(10)
                .height(60)
                .width('100%')
                .justifyContent(FlexAlign.SpaceBetween)

              }
            }
            .width('90%')
            .height(300)
            .backgroundColor('white')
            .borderRadius(20)
            .margin({ top: 10 })
          }
          .width('100%')
          // .height('100%')
        }
        .backgroundColor('#f5f5f5f5')
      }
    }
    .width('100%')
  }
}