export class MainPageModel{
  tabTitle = [
    {
      index:0,
      title:'首页',
      imageActivated: $r('app.media.icon_sel_home'),
      imageOriginal: $r('app.media.icon_unsel_home')
    },
    {
      index:0,
      title:'发现',
      imageActivated: $r('app.media.icon_sel_home'),
      imageOriginal: $r('app.media.icon_unsel_home')
    }, {
      index:0,
      title:'热门',
      imageActivated: $r('app.media.icon_sel_home'),
      imageOriginal: $r('app.media.icon_unsel_home')
    }, {
      index:0,
      title:'我的',
      imageActivated: $r('app.media.icon_sel_home'),
      imageOriginal: $r('app.media.icon_unsel_home')
    },
  ]
}

let mainViewModel = new MainPageModel();
export default mainViewModel as MainPageModel