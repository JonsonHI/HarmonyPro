import { ColumModel, Taks } from '../../../ViewModel/ColumModel'
@Component

export  struct CenterView{
  @Consume('com.colum_task') task: Taks[]
  @Consume('com.colum_statInfo') stateInfo:ColumModel
  addColum:() => void
  build(){
    Button('定下您的目标')
      .width('100%')
      .height('40vp')
      .backgroundColor('blue')
      .margin({top:'20vp'})
      .onClick(()=>{
        this.task.push(new Taks())
        // this.addColum()
        this.stateInfo.totalTask = this.task.length

      })
  }
}