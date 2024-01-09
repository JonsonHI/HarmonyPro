@Component
export struct CenterLine{
  build() {
    Column() {
      Row() {
        Image("https://img3.downza.cn/xueyuan/201810/161123-5bcd862bc0d58.png").width(40).height(40)
        Text('你有5条消息未读')
        Text('9天前')
        Image($r('app.media.jinr')).width(20).height(20)
      }
      .width('95%')
      .padding({ top: 10, bottom: 10, left: 10 })
      .justifyContent(FlexAlign.SpaceBetween)
      .backgroundColor('white')
      .border({ radius: 10 })

      Image('https://hbimg.huaban.com/57d0c3faca7631c48b7360c0af95ca5b7d8f482414950-AAOIqn_fw658').width('95%').height(140)
        .backgroundColor('red')
        .borderRadius(BorderStyle.Solid)
        .margin({top:10})

    }
  }
}