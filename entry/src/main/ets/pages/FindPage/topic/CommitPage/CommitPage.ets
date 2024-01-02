import router from '@ohos.router'
import { CommonTopBar } from '../../../../Component/CommonTopBar'
import {CommonDialog} from '../../../../Component/CommonDialog'
@Entry
@Component
struct CommitPage {
  @State message: string = 'Hello World'
  @State isLunar: boolean = false
  private  selectedDate: Date = new Date('2023-12-11')
  private buttonArray: Array<object> = [{name:'datapick'},{name:'弹窗(22222222222222)'},{name:'alert(11111111)'},{name:'alert1'},{name:'alert2'},{name:'alert3'},{name:'alert4'}]
  dialogController: CustomDialogController = new CustomDialogController({builder:CommonDialog({
    cancel:()=>this.onCancel(),
    confirm:()=>this.onConfirm(),
    dialogOpen:()=>this.dialogOpen()
  }),alignment:DialogAlignment.Bottom
  })
  twoDialogController: CustomDialogController = new CustomDialogController({
    builder:CommonDialog({

    }),alignment:DialogAlignment.Center

  })

  aboutToAppear(){
    let param = router.getParams()['item']
    console.log('~~~~~~~commitPage 接受参数',param)
    this.message = param.title

  }

  onCancel(){
    console.log('~~~~~~~~','取消')
  }
  onConfirm(){
    console.log('~~~~~~~~','取消')
  }

  dialogOpen(){
    this.twoDialogController.open()
  }

  build() {
    Column() {
      CommonTopBar({ title: '事例页', backButton: true, alpha: 1,rightButton:null })
      Text('点击Item多级弹窗')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Row(){
        Flex({direction:FlexDirection.Row,wrap:FlexWrap.Wrap}){
          ForEach(this.buttonArray,(item,index)=>{
            Button(item.name)
              .height('40vp')
              .margin('10vp')
              .padding('5vp')
              .onClick((item)=>{
                  this.dialogController.open()
              })
          })
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}
