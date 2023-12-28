import findModel from '../../../ViewModel/FindModel'
import { ListView, RefreshController } from '@app/refresh'
type FocusData = {
  "title": string,
  "picUrl": string,
  "type": string,
  "director": string,
  "actors": string,
  "releaseDateStr": string
  // "title": "年会不能停！",
  // "picUrl": "http://img5.mtime.cn/mt/2023/12/14/143804.97416739_1280X720X2.jpg",
  // "type": "剧情 / 喜剧",
  // "director": "董润年",
  // "actors": "大鹏 / 白客 / 庄达菲 / 王迅",
  // "releaseDateStr": "12月29日  本周五"
}

@Component
export struct FocusPage {
  @State focusList: Array<FocusData> = []
  @State controller : RefreshController = new RefreshController()

  aboutToAppear() {
    let mpSet = new Map<string, Object>()
    mpSet['key'] = 'r8Wr51n8RpNtdi77yYAgc2uWoB'
    findModel.getFocusList(mpSet, (data) => {
      console.log(data)
      this.focusList = data.data
    })
  }

  @Builder itemEnd(index: number) {
    // 侧滑后尾端出现的组件
    Button({ type: ButtonType.Circle }) {
      Image($r('app.media.icon_about'))
        .width(80)
        .height(80)
    }
    .onClick(() => {
      this.focusList.splice(index, 1);
    })
  }

  @Builder
  itemLayout(item,index){
    Column() {
      Stack({ alignContent: Alignment.TopStart }) {
        Image(item.picUrl).width('100%').height('180vp').border({ radius: '10vp' })
        Text(item.type).height('20vp')
          .backgroundColor('red')
          .border({ radius: { topLeft: '10vp', bottomRight: '10vp' } })
          .padding('5vp')
        Column(){
          Text(item.title)
          Row(){
            Text(item.actors).fontWeight(FontWeight.Bold).textCase(TextCase.UpperCase)
            Text(item.releaseDateStr)
          }
          .justifyContent(FlexAlign.SpaceBetween)
        }
        .height('180vp')
        .justifyContent(FlexAlign.End)
      }

    }
    .margin({top:'10vp'})
  }

  build() {
    Column() {
      ListView({
        items: this.focusList, //数据源 数组
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉
        onRefresh: () => {
          //下拉刷新
          this.controller.finishRefresh()
        },
        onLoadMore: () => {
          //上拉加载
          this.controller.finishLoadMore()
        }
      })

      // List() {
      //   ForEach(this.focusList, (item,index) => {
      //     ListItem() {
      //
      //     }.swipeAction({ end: this.itemEnd.bind(this, index) })
      //   })
      //
      //
      // }
    }
    .width('100%')
  }
}