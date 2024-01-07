@Entry
@Component
struct RowPage {
  @State message: string = 'Hello World'
  @State flexAlign : FlexAlign = FlexAlign.Start

  build() {
   Column(){

     Column(){
       Row(){

       }
       .width(100)
       .height(10)
       .backgroundColor('red')

     }
     .height('50%')
     .width('100%')
     .backgroundColor('blue')
     .justifyContent(this.flexAlign)

     Text('主轴对其方式').fontSize(18).fontWeight(FontWeight.Bold)
       .margin({left:'20vp',top:'20vp'})

     Row(){
       Row(){
         Radio({ value: 'Radio1', group: 'radioGroup' }).checked(true)
           .height(20)
           .width(20)
           .onChange((isChecked: boolean) => {
             this.flexAlign = FlexAlign.Start
           })
         Text('start')
       }
       Row(){
         Radio({ value: 'Radio2', group: 'radioGroup' }).checked(false)
           .height(20)
           .width(20)
           .onChange((isChecked: boolean) => {
             this.flexAlign = FlexAlign.End
           })
         Text('end')
       }
       Row(){
         Radio({ value: 'Radio3', group: 'radioGroup' }).checked(false)
           .height(20)
           .width(20)
           .onChange((isChecked: boolean) => {
             this.flexAlign = FlexAlign.Center
           })
         Text('center')
       }
     }
     .width('100%')
     .justifyContent(FlexAlign.SpaceAround)
     .margin({top:'10vp'})


   }
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }
}