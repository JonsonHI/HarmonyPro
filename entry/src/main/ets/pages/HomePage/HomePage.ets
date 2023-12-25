import ArrayList from '@ohos.util.ArrayList'
import { CommonTopBar } from '../../Component/CommonTopBar'
import  homeModel  from '../../ViewModel/HomeModel'
import web_view from '@ohos.web.webview'
type ImageArray = {
  image:string
}
type dataList = {
  title:string,
  url:string,
}
@Entry
@Component
export  struct HomePage {
  @State message: string = 'Hello World'
  private swiper : SwiperController = new SwiperController()
  private webView = new web_view.WebviewController()
  @State upList:Array<dataList> = []
  @State list:Array<ImageArray> = [
    {"image":'https://img.zcool.cn/community/0123f455adbf9732f875495e9ce786.jpg?x-oss-process=image/auto-orient,1/resize,m_lfit,w_1280,limit_1/sharpen,100'},
    {"image":'https://img-blog.csdnimg.cn/20200224163128151.gif'},
    {"image":'https://image.baidu.com/search/detail?ct=503316480&z=&tn=baiduimagedetail&ipn=d&word=%E8%BD%AE%E6%92%AD%E5%9B%BE&step_word=&lid=8032804642148586063&ie=utf-8&in=&cl=2&lm=-1&st=-1&hd=&latest=&copyright=&cs=1137844197,2700683979&os=3359745569,4204304043&simid=4287888277,929148478&pn=89&rn=1&di=7264239678495129601&ln=1708&fr=&fmq=1703484597111_R&ic=&s=undefined&se=&sme=&tab=0&width=&height=&face=undefined&is=0,0&istype=2&ist=&jit=&bdtype=0&spn=0&pi=0&gsm=3c&objurl=https%3A%2F%2Fphoto.16pic.com%2F00%2F47%2F70%2F16pic_4770992_b.jpg&rpstart=0&rpnum=0&adpicid=0&nojc=undefined&dyTabStr=MCwzLDEsMiw2LDQsNSw4LDcsOQ%3D%3D'},
  ]
  aboutToAppear(){
    homeModel.getHomeList((data)=>{
      // console.info('!!!!!!!',JSON.stringify(data.issueList[0].itemList[0].image,null,2))
      let res = data.issueList[0].itemList
      // this.list = res
    })
    homeModel.getHomeUpList((data)=>{
      console.log('data:',JSON.stringify(data))
      this.upList = data.data
    })
  }

  build() {
    Column() {
      CommonTopBar({title:'首页',backButton:false,alpha:1}).align(Alignment.TopStart)
      Swiper(this.swiper){
        ForEach(this.list,(item,index)=>{
          Image(item.image).width('100%').height('180vp').objectFit(ImageFit.Fill)
        },(item)=>JSON.stringify(item))
      }
      List(){
        ForEach(this.upList,(item)=>{
         ListItem(){
           Column(){
             Text(item.title)
             Web({src:item.url,controller:this.webView}).height('200vp')
           }
         }
        })
      }
    }
    .height('100%')
  }
}