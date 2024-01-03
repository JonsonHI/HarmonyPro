@Component
export struct RecommendDate {
  @State recomArray: Array<object> = [
    { "img": 'https://bige.cdn.bcebos.com/designs/covers/2011/jbLHFvwWN3422.png?_=fay' },
    { "img": 'https://pic.616pic.com/ys_bnew_img/00/34/43/9IxPGZ4d4l.jpg' },
    {
      "img": 'https://preview.qiantucdn.com/58pic/33/81/56/36N58PIC258PIC2iN309658PICfUp_PIC2018.png%21qt324_nowater_jpg'
    },
    { "img": 'https://img.tukuppt.com/png_preview/00/46/29/HwahSdK5hi.jpg%21/fw/780' },
  ]

  build() {
    Column() {
      Text('今日推荐')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .height('50vp')
      List({ space: 10 }) {
        ForEach(this.recomArray, (item, index) => {
          ListItem() {
            Image(item.img).height('150vp').width('150vp')
          }
        })
      }
      .listDirection(Axis.Horizontal)
    }
    .width('100%')
    // .height(300)

  }
}