/**
 * 自定义App顶部Topbar
 */
import router from '@ohos.router'
import window from '@ohos.window';

@Component
export struct CommonTopBar {
  @Prop title: string
  @Prop alpha: number
  @State statusBarHeight: number = 0
  @BuilderParam rightButton: ()=>void
  private titleAlignment: TextAlign = TextAlign.Center
  private backButton: boolean = true
  private rtButton: boolean = false
  private onBackClick?: () => void

  aboutToAppear() {
    this.setSystemStatusBar()
  }

  setSystemStatusBar() {
    let context = getContext(this)
    window.getLastWindow(context, (error, data) => {
      //1、设置系统状态栏
      let avoidArea = data.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
      //这里为什么要自己设置一个高度？因为系统返回的高度太高了，并不能正确的返回系统状态栏的高度，自己二次设置一个接近的值
      avoidArea.topRect.height = 60
      this.statusBarHeight = avoidArea.topRect.height
      console.log("顶部状态栏的高度", `${this.statusBarHeight}`)
      let bottomHeight = avoidArea.bottomRect.height
      console.log("底部系统导航栏的高度", `${bottomHeight}`)
      //2、设置系统状态栏颜色---该API废弃了，统一返回801，目前没找到好的方法设置状态栏文字的颜色，放弃了。。。。。。
      const systemBarProperties: window.SystemBarProperties = {
        //顶部状态栏颜色
        statusBarColor: "red",
        statusBarContentColor: "#ffffff",
        isStatusBarLightIcon: true
      }
      data.setWindowSystemBarProperties(systemBarProperties, (err, result) => {
        console.log("设置状态栏结果码", `${err.code}`)
        if (err.code == 0) {
          console.log("状态栏设置成功")
        } else {
          console.log("状态栏设置失败", `${err.message}`)
        }
      })
    })
  }

  build() {
    // Column() {
    //   Blank()
    //     .backgroundColor('red')
    //     .opacity(this.alpha)
    //   Stack({ alignContent: Alignment.Start }) {
    //     Stack()
    //       .height('50vp')
    //       .width("100%")
    //       .opacity(this.alpha)
    //       .backgroundColor('red')
    //     Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
    //       Text(this.title)
    //         .flexGrow(1)
    //         .textAlign(this.titleAlignment)
    //         .fontColor('#fff')
    //         .fontSize('16vp')
    //         .align(Alignment.Center)
    //         .maxLines(1)
    //         .textOverflow({ overflow: TextOverflow.Ellipsis })
    //     }
    //     .height('50vp')
    //     .margin({ left: '50vp', right: '50vp' })
    //     .alignSelf(ItemAlign.End)
    //     .backgroundColor("blue")
    //
    //     if (this.backButton) {
    //       Stack() {
    //         Image($r('app.media.ic_action_back'))
    //           .height('16vp')
    //           .width('16vp')
    //           .align(Alignment.Center)
    //           .onClick(() => {
    //             this.onBackClick?.()
    //             router.back();
    //           })
    //       }
    //       .height('50vp')
    //       .width('50vp')
    //     } else {
    //       Text('返回')
    //     }
    //     Stack(){
    //       Image($r('app.media.ic_action_back'))
    //         .height('16vp')
    //         .width('16vp')
    //         .backgroundColor('blue')
    //         .align(Alignment.Center)
    //         .onClick(() => {
    //           this.onBackClick?.()
    //           router.back();
    //         })
    //     }
    //     .alignContent(Alignment.End)
    //
    //
    //   }
    //   .height('50vp')
    //   .width("100%")
    // }.height(this.statusBarHeight)
    Row() {
      Row() {
        if (this.backButton) {
          Stack() {
            Image($r('app.media.ic_action_back'))
              .height('16vp')
              .width('16vp')
              .align(Alignment.Center)
              .onClick(() => {
                this.onBackClick?.()
                router.back();
              })
          }
          .height('50vp')
          .width('50vp')
        }
      }
      .height('50vp')
      .width('20%')
      Row() {
        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
          Text(this.title)
            .flexGrow(1)
            .textAlign(this.titleAlignment)
            .fontColor('#fff')
            .fontSize('16vp')
            .align(Alignment.Center)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .height('50vp')
        .alignSelf(ItemAlign.End)
      }
      .height('50vp')
      .width('60%')
     if(this.rtButton){
       Row() {
         this.rightButton()
       }
       .height('50vp')
       .width('20%')
     }
    }
    .backgroundColor('red')
    .width('100%')
    .height('50vp')
  }
}