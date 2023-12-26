
import  findModel  from '../../ViewModel/FindModel'
import {CategoryPage} from './category/CategoryPage'
import {FocusPage} from './focus/FocusPage'
import {TopicPage} from './topic/TopicPage'


@Entry
@Component
export struct FindPage {
  @Provide findCurrentIndex: number = 0
  @State message: string = 'Hello World'

  private  controller:TabsController = new TabsController()

  build() {
    Row() {
      Column() {
        Tabs({barPosition:BarPosition.Start,controller:this.controller}){
          TabContent(){
            CategoryPage()
          }.tabBar(this.TabBuilder(0,'分类'))
          TabContent(){
            FocusPage()
          }.tabBar(this.TabBuilder(1,'关注'))
          TabContent(){
            TopicPage()
          }.tabBar(this.TabBuilder(2,'最热'))
        }
        .barHeight('50vp')
        .barMode(BarMode.Fixed)
        .onChange((index) => {
          this.findCurrentIndex = index
        })
      }
      .width('100%')
    }
    .height('100%')
  }

  @Builder TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.findCurrentIndex === index ? 'white' : '#f5f5f5')
        .fontSize('15vp')
        .fontWeight(this.findCurrentIndex === index ? 500 : 400)
        .height('45vp')
        .flexGrow(1)
        .textAlign(TextAlign.Center)
      Divider()
        .strokeWidth(5)
        .color('white')
        .opacity(this.findCurrentIndex === index ? 1 : 0)
        .width('80vp')
        .lineCap(LineCapStyle.Round)
    }
    .width('101%') //解决Tab连接处白色线条间隙
    .height('50vp')
    .backgroundColor('red')
    .justifyContent(FlexAlign.Center)
  }
}

