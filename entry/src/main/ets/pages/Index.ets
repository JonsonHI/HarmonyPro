import router from '@ohos.router'
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'


  aboutToAppear(){
    setTimeout(()=>{
      router.replaceUrl({url:'pages/MainPage'})
    },2000)
  }

  build() {
    Column() {
     Image($r('app.media.landing_image'))
       .height('100%')
       .width('100%')
       .objectFit(ImageFit.ScaleDown)
    }
    .width('100%')
    .height('100%')
  }
}