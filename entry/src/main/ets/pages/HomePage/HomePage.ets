
import { CenterLine } from './commponent/CenterLine'
import { TitleBar } from './commponent/TitleBar'
import { TitleLine } from './commponent/TitleLine'
@Entry
@Component
export struct HomePage {
  build() {
    Column() {
      TitleBar()

      Scroll() {


        Column(){
          TitleLine()
          CenterLine()
          Column() {
            Text('福利专区')
              .fontWeight(FontWeight.Bold)
              .width('100%')
              .height('40vp')
              .margin({left:20})
              .fontSize(20)
            Divider().width('100%').height(1).backgroundColor('#f5f5f5f5')
            Column(){
              Row(){
                Column(){
                  Text('你得专属福利').fontSize(18)
                  Text('限时领取').fontColor('#151F2B')
                }
                .alignItems(HorizontalAlign.Start)
                Divider().width(1).height(30).backgroundColor('#f5f5f5f5')
                Column(){
                  Text('你得专属福利').fontSize(18)
                  Text('限时领取').fontColor('#151F2B')
                }
                .alignItems(HorizontalAlign.End)
              }
              .padding(10)
              .height(60)
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)

            }
            Column(){
              Row(){
                Column(){
                  Text('你得专属福利').fontSize(18)
                  Text('限时领取').fontColor('#151F2B')
                }
                .alignItems(HorizontalAlign.Start)
                Divider().width(1).height(30).backgroundColor('#f5f5f5f5')
                Column(){
                  Text('你得专属福利').fontSize(18)
                  Text('限时领取').fontColor('#151F2B')
                }
                .alignItems(HorizontalAlign.End)
              }
              .padding(10)
              .height(60)
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)

            }
          }
          .width('90%')
          .height(300)
          .backgroundColor('white')
          .borderRadius(20)
          .margin({ top: 10 })
        }


      }
      .width('100%')

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f5f5f5')

  }
}