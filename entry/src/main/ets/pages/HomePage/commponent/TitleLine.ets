import  MainPageModel  from '../../../ViewModel/MainPageModel'
@Component
export struct TitleLine{

  build() {
    Column() {
      Row() {
        ForEach(MainPageModel.titleImg, (item, index) => {
          Column() {
            Image(item.img).width('50vp').height('50vp')
            Text(item.title).margin({ top: '10vp' })
          }
        })
      }
      .width('100%')
      .padding({ top: '5vp', bottom: '10vp' })
      .backgroundColor('#3781F7')
      .justifyContent(FlexAlign.SpaceAround)


      Flex({wrap:FlexWrap.Wrap,direction:FlexDirection.Row}){
        ForEach(MainPageModel.lineImg,(item,index)=>{
          Column() {
            Image(item.img).width('40vp').height('40vp')
            Text(item.title).margin({ top: '10vp' })
          }
          .width('20%')
          .padding({top:'10vp',bottom:'10vp'})
        })
      }
      .width('100%')


    }
  }
}
