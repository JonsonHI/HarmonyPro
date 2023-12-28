import router from '@ohos.router'
import { IWaterDataSource } from '../../../Model/ListModel'
import findModel from '../../../ViewModel/FindModel'
import { WaterFlowDataSource } from './WaterFlowDataSource'

@Component
export struct TopicPage {
  @State minSize: number = 150
  @State maxSize: number = 300
  @State fontSize: number = 24
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  scroller: Scroller = new Scroller()
  datasource: WaterFlowDataSource = new WaterFlowDataSource()
  private itemWidthArray: number[] = []
  private itemHeightArray: number[] = []


  // 计算flow item宽/高
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return (ret > this.minSize ? ret : this.minSize)
  }

  // 保存flow item宽/高
  getItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemWidthArray.push(this.getSize())
      this.itemHeightArray.push(this.getSize())
    }
  }

  aboutToAppear() {

    let mpSet = new Map<string, Object>()
    mpSet['key'] = 'r8Wr51n8RpNtdi77yYAgc2uWoB'
    findModel.getFocusList(mpSet, (data) => {
      console.log(data)
      this.datasource.setData(data.data)
      this.getItemSizeArray()
    })
  }

  @Builder itemFoot() {
    Column() {
      Text(`Footer`)
        .fontSize(10)
        .backgroundColor(Color.Red)
        .width(50)
        .height(50)
        .align(Alignment.Center)
        .margin({ top: 2 })
    }
  }

  build() {
    Column({ space: 2 }) {
      WaterFlow({ footer: this.itemFoot.bind(this), scroller: this.scroller }) {
        LazyForEach(this.datasource, (item,index) => {
          FlowItem() {
            Column() {
              Text("N" + item.title).fontSize(12).height('16')
              Image(item.picUrl)
                .objectFit(ImageFit.Cover)
            }
          }
          .width(this.itemWidthArray[index])
          .height(this.itemHeightArray[index])
          .backgroundColor(this.colors[index % 5])
          .onClick(()=>{
            router.pushUrl({
              url:'pages/FindPage/topic/CommitPage/CommitPage',
              params:{item:item}
            }).catch((err)=>{
              console.log(err)
            })
          })
        }, item => item)
      }
      .columnsTemplate("1fr 1fr")
      .itemConstraintSize({
        minWidth: 0,
        maxWidth: '100%',
        minHeight: 0,
        maxHeight: '100%'
      })
      .columnsGap(10)
      .rowsGap(5)
      .onReachStart(() => {
        console.info("onReachStart")
      })
      .onReachEnd(() => {
        console.info("onReachEnd")
      })
      .backgroundColor(0xFAEEE0)
      .width('100%')
      .height('100%')
      .layoutDirection(FlexDirection.Column)
    }
    .height('100%')
    .width('100%')
  }
}