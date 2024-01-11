import hilog from '@ohos.hilog'
import { CommonTopBar } from '../../Component/CommonTopBar'
import ClassifyModel from '../../ViewModel/ClassifyModel'
import CourseModel from '../../ViewModel/CourseModel'
import mineViewModel from '../../ViewModel/MineViewModel'
@Entry
@Component
export struct MinePage {
  @State classifyList: Array<ClassifyModel> = []
  private scroll:Scroller = new Scroller()
  private classifyScroll = new Scroller()
  @State  currentClassify:number = 0

  aboutToAppear(){
   this.classifyList =  mineViewModel.getData()
    console.log('linkedata:~~~~~~~~',JSON.stringify(this.classifyList))
  }

  @Builder
  classifyHeader(classifyName:string){
    Row(){
      Text(classifyName).textAlign(TextAlign.Center).width('100%').height('60vp')
        .backgroundColor('white')

    }
  }

  @Builder
  CourseItem(item:CourseModel,index:number){
    Row(){
      Image(item.imageUrl)
        .height('100%')
        .aspectRatio(1)
      Text(item.price.toString())

    }
    .backgroundColor('gray')
    .width('90%')
    .height('100vp')
    .border({radius:'10vp'})
  }

  classifyChangeAction(start,filg:Boolean){
    if (this.currentClassify !== start) {
      this.currentClassify = start;
      if (!filg) {
        // scroll the course scroll.
        this.scroll.scrollToIndex(start);
      } else {
        // scroll the classify scroll.
        this.classifyScroll.scrollToIndex(start);
      }
    }
  }

  build() {
    Column() {
      CommonTopBar({ title: '我的', backButton: false, alpha: 1, rightButton: null })
      Row() {
        List({scroller:this.scroll}) {
          ForEach(this.classifyList, (item: ClassifyModel, index: number) => {
            ListItem() {
              Text(item.classifyName).width('100vp').height('60vp').textAlign(TextAlign.Center)
                .backgroundColor(this.currentClassify === index ? 'white':'gray')
                .onClick(()=>{
                  this.classifyChangeAction(index,true)
                })
            }
          })
        }
        .height('100%')
        .width('30%')

        List({scroller: this.classifyScroll}){
          ForEach(this.classifyList,(item:ClassifyModel,index:number)=>{
              ListItemGroup({
                header:this.classifyHeader(item.classifyName),
                space:12
              }){
                ForEach(item.courseList,(classifyItem:CourseModel)=>{
                  this.CourseItem(classifyItem,index)
                })
              }

          })
        }
        .sticky(StickyStyle.Header)
        .width('70%')
        .height('100%')
        .onScrollIndex((start)=>{this.classifyChangeAction(start,false)})

      }.height('100%')
    }
  }
}