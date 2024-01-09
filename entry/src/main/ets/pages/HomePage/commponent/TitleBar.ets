
@Extend(Text) function textStyle() {
  .fontSize(18)
  .fontColor('#ffffff')
}

@Component
export struct TitleBar{

  build(){
    Row() {
      Row() {
        Text('上海').textStyle().margin({ left: 10 })
      }
      .width('20%')

      Row() {
        TextInput({placeholder:'支付宝中心'}).width('88%').backgroundColor('#ffffff')
        Image($r('app.media.machome')).width('25vp').height('25vp')
      }
      .width('60%')
      .backgroundColor('#ffffff')
      .border({radius:'60vp'})

      Row() {
        Image($r('app.media.person')).width('40vp').height('40vp').margin({right:'10vp'})
      }
      .width('20%')
      .justifyContent(FlexAlign.End)
    }
    .width('100%')
    .height('64vp')
    .backgroundColor('#3781F7')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}