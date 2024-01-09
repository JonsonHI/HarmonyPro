import router from '@ohos.router'
import { CommonTopBar } from '../../../../Component/CommonTopBar'
import {CommonDialog} from '../../../../Component/CommonDialog'
import { showToast } from '../../../../utils/ToatUtils'
import { testArray } from '../../../../ViewModel/ColumModel'
import { HomeStore } from '../../../../stores/HomeStore'
@Entry
@Component
struct CommitPage {
  @State message: string = 'Hello World'
  @State isLunar: boolean = false
  @StorageLink('count') count:number=0
  @StorageLink('testArray') testArray:Array<testArray> = [{'type':1,'name':2}]
  @StorageLink('store') store:HomeStore = new HomeStore()
  private  selectedDate: Date = new Date('2023-12-11')
  private buttonArray: Array<object> = [{name:'datapick'},{name:'弹窗'},{name:'toast'},{name:'alert1'},{name:'alert2'},{name:'alert3'},{name:'alert4'}]
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
                if (index === 2) {
                  showToast('toast',null,200)
                }else{
                  this.dialogController.open()
                }

              })
          })
        }
      }
      Text('获取全局状态').fontSize(18).margin({top:20})
      Button(`${this.count}`).width(200).height(50)
        .onClick(()=>{
          this.count++
          PersistentStorage.PersistProp('count',this.count)
        })
      Text('获取全局状态数组').fontSize(18).margin({top:20})
      Button(`${JSON.stringify(this.store.list)}`).width('100%').height(50)
        .onClick(()=>{
          // this.testArray[0].name = 33
          // console.log('testarray:~~~~~~~',JSON.stringify(this.testArray));
          // AppStorage.Set('testArray',AppStorage.Get('testArray'))
          // this.store.name = "测试名字1"
          let obj = JSON.parse(this.store.list)
          obj[0].age = 100
          this.store.list = obj
          AppStorage.Set('store',AppStorage.Get('store'))
        })
    }
    .width('100%')
    .height('100%')
  }
}
