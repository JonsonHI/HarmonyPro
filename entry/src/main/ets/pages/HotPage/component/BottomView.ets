import { ColumModel, Taks } from '../../../ViewModel/ColumModel'
@Component

export struct BottomView{
  @Consume('com.colum_task') task: Taks[]
  @Consume('com.colum_statInfo') stateInfo:ColumModel
  addColum:()=>void
  build(){
    List({space:'20vp'}){
      ForEach(this.task,(item,index)=>{
        ListItem(){
          Row(){
            TextInput({placeholder:item.name})
              .width(200)
            Checkbox()
              .select(item.finished)
              .onChange((value)=>{
                console.log('value:~~~~',JSON.stringify(value))
                this.task[index].finished = value
                // this.addColum()
                this.stateInfo.finishTask = this.task.filter(item=>item.finished).length

              })
          }
          .width('100%')
          .height('60vp')
          .backgroundColor('#f5f5f5f5')
          .border({radius:'20vp'})
          .justifyContent(FlexAlign.SpaceAround)
        }
      })
    }
  }
}