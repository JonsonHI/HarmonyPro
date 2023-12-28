
@CustomDialog
export struct CommonDialog{

  dialogOpen:()=>void
  cancel: ()=>void
  confirm: ()=>void
  controller: CustomDialogController

  build(){
    Column(){
        Text('1111').onClick(()=>{this.dialogOpen()})
    }
    .height('200vp')
    .width(globalThis.SCREEN_WIDTH)
  }

}