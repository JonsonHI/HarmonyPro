import promptAction from '@ohos.promptAction'
import router from '@ohos.router'
import { showToast } from '../../../utils/ToatUtils'
@Component
export struct GrideListView{
  @Link imageArray:Array<object>

  build(){
    Row(){
      Grid(){
        ForEach(this.imageArray,(item,index)=>{
          GridItem(){
            Column(){
              Image(item.name)
                .width('50vp')
                .height('50vp')
              Text(item.text)
                .margin({top:'5vp'})
            }
            .margin('10vp')

          }
          .onClick(()=>{
            if(index === 0){
              router.pushUrl({
                url:'pages/HotPage/RowPage'
              })
            }else if(index === 1){
              router.pushUrl({
                url:'pages/HotPage/ColumPage'
              })
            }
          })
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .margin({top:'10vp'})
    }
    .backgroundColor('white')
    .width('100%')
    .height('230vp')
    .margin({top:'-10vp'})
    .padding({top:'10vp',bottom:'10vp'})
    .borderRadius({topLeft:30,topRight:30})
  }
}