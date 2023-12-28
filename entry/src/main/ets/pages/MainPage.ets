import { FindPage } from './FindPage/FindPage'
import { HomePage } from './HomePage/HomePage'
import { HotPage } from './HotPage/HotPage'
import { MinePage } from './MinePage/MinePage'
import { TabItem } from '../Model/TabItem'
import MainPageModel from '../ViewModel/MainPageModel'
import display from '@ohos.display'

@Entry
@Component
struct MainPage {
  @State message: string = 'Hello World'
  @State selectIndex: number = 0

  onPageShow() {
    console.log('进入页面', '~~~~~~~~~')
    let displayClass = null;
    //获取屏幕宽高
    display.getAllDisplays((err, data) => {
      displayClass = data;
      if (err.code) {
        console.error('Failed to obtain all the display objects. Code: ' + JSON.stringify(err));
        return;
      }
      globalThis.SCREEN_WIDTH = displayClass[0].width
      globalThis.SCREEN_HEIGHT = displayClass[0].height
      console.log('Succeeded in obtaining all the display objects. Data: ' + JSON.stringify(data));
    });
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