import { preferences } from '../../entryability/EntryAbility'
@Entry
@Component
export struct MinePage {
  @State message: string = 'Hello World'

  click(){
    preferences.get('token', 'string', (value) => {
      console.info("token" + value)
      if (value) {
        this.message = value.toString()

      }
    })
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('获取本地数据').onClick(()=>{this.click()})
      }
      .width('100%')
    }
    .height('100%')
  }
}