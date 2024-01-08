import { ColumModel } from '../../../ViewModel/ColumModel'
@Component
export struct TitleView {
  @Consume('com.colum_statInfo') stateInfo:ColumModel
  addColum:()=>void
  build(){
    Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween}) {
      Column() {
        Text('待完成目标').fontWeight(FontWeight.Bold).fontSize('18vp')
      }
      .width('50%')
      .height('50vp')
      .justifyContent(FlexAlign.Center)

      Column() {
        Progress({
          value:this.stateInfo.finishTask,
          total:this.stateInfo.totalTask,
          type:ProgressType.Ring
        })
      }
      .width('40%')
      .height('40vp')
      .alignSelf(ItemAlign.Center)

      Row() {
        Text(this.stateInfo.finishTask.toString())
        Text('/' + this.stateInfo.totalTask.toString())
      }
      .width('40%')
      .height('50vp')
      .justifyContent(FlexAlign.Center)

    }
    .margin({top:'20vp'})
    .backgroundColor('gray')
    .border({radius:20})
  }
}