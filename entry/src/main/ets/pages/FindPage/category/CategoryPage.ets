
import findModel from '../../../ViewModel/FindModel'
type FindModel = {
  title:string,
  imgurl:string,
  yanyuan:string,
  pingfen:string,
  pingjia:string
}

@Component
export  struct CategoryPage {
  @State findLise:Array<FindModel> = []

  aboutToAppear(){
    //网络请求
    findModel.getCategoryList((data)=>{
      this.findLise = data.data
      this.findLise = [...this.findLise,...data.data]
    })
  }

  build() {
    Column(){
      Text('grid布局').width('100%').height('50vp').fontWeight(FontWeight.Bold).textAlign(TextAlign.Center)
      Grid(){
          ForEach(this.findLise,(item)=>{
            GridItem(){
              Column(){
                Image(item.info.imgurl).width('100%').height('180vp')
                Row(){
                  Text(item.title).textOverflow({overflow:TextOverflow.Ellipsis}).width('50%').maxLines(1)
                  Text(item.info.pingfen)
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                Text(item.info.pingjia)
              }
              .alignItems(HorizontalAlign.Start)
            }
          })
        }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}