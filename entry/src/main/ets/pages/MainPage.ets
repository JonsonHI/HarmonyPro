import { FindPage } from './FindPage/FindPage'
import { HomePage } from './HomePage/HomePage'
import { HotPage } from './HotPage/HotPage'
import { MinePage } from './MinePage/MinePage'
import { TabItem } from '../Model/TabItem'
import MainPageModel from '../ViewModel/MainPageModel'

@Entry
@Component
struct MainPage {
  @State message: string = 'Hello World'
  @State selectIndex: number = 0

  onPageShow() {
    console.log('进入页面', '~~~~~~~~~')
  }

  onPageHide() {
    console.log('离开页面', '~~~~~~~~~')
  }

  build() {
    Column() {
      Tabs({
        index: this.selectIndex,
        barPosition: BarPosition.End
      }) {
        TabContent() {
          HomePage()
        }
        .tabBar(this.TabBottom(MainPageModel.tabTitle[0], 0))

        TabContent() {
          FindPage()
        }
        .tabBar(this.TabBottom(MainPageModel.tabTitle[1], 1))

        TabContent() {
          HotPage()
        }
        .tabBar(this.TabBottom(MainPageModel.tabTitle[2], 2))

        TabContent() {
          MinePage()
        }
        .tabBar(this.TabBottom(MainPageModel.tabTitle[3], 3))
      }
      .onChange((index) => {
        this.selectIndex = index
      })
      .barHeight('80vp')
    }
  }

  @Builder TabBottom(item: TabItem, index: number) {
    Column() {
      Image(this.selectIndex === index ? item.imageActivated : item.imageOriginal)
    }
    .height('30vp')
    .width('30vp')

    Text(item.title).fontSize('15vp').margin({top:'10vp'})
  }
}