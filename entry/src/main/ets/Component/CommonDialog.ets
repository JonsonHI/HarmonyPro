@CustomDialog
export struct CommonDialog {
  dialogOpen: () => void
  cancel: () => void
  confirm: () => void
  controller: CustomDialogController
  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.Center }) {
        Text('再次点击我').onClick(() => {
          this.dialogOpen()
        })
      }.margin({ top: '10vp' })

      Divider().color('#f5f5f5').height(2).margin({ top: 5 })
      Flex({justifyContent:FlexAlign.Center}){
        Text('OpenHarmony 在传统的单设备系统能力的基础上，创造性地提出了基于同一套系统能力、适配多种终端形态的理念，支持多种终端设备上运行，第一个版本支持 128K~128M 设备上运行，欢迎参加开源社区一起持续演进。针对设备开发者，OpenHarmony 采用了组件化的设计方案')
          .padding('20vp')
          .fontSize(18)
          .textAlign(TextAlign.Center)
      }

      Divider().color('#f5f5f5').height(2).margin({ top: 5 }) // .height('50vp')
      Flex({justifyContent:FlexAlign.SpaceAround}){
        Button('确定')
          .width('120vp')
          .height('40vp')
        Button('取消')
          .width('120vp')
          .height('40vp')
          .onClick(()=>{
            this.controller.close()
          })
      }.margin({top:'10vp',bottom:'10vp'})
    }
    // .height('200vp')
    // .width(globalThis.SCREEN_WIDTH - 20)
    .alignItems(HorizontalAlign.Center)
  }
}