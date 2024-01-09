export class MainPageModel {
  tabTitle = [
    {
      index: 0,
      title: '首页',
      imageActivated: $r('app.media.icon_sel_home'),
      imageOriginal: $r('app.media.icon_unsel_home')
    },
    {
      index: 0,
      title: '发现',
      imageActivated: $r('app.media.icon_sel_home'),
      imageOriginal: $r('app.media.icon_unsel_home')
    }, {
    index: 0,
    title: '热门',
    imageActivated: $r('app.media.icon_sel_home'),
    imageOriginal: $r('app.media.icon_unsel_home')
  }, {
    index: 0,
    title: '我的',
    imageActivated: $r('app.media.icon_sel_home'),
    imageOriginal: $r('app.media.icon_unsel_home')
  },
  ]
  titleImg = [
    {
      title: '扫一扫',
      img: $r('app.media.scanle')
    },
    {
      title: '收钱',
      img: $r('app.media.getpay')
    },
    {
      title: '付钱',
      img: $r('app.media.payhome')
    },
    {
      title: '卡包',
      img: $r('app.media.cardhome')
    },
  ]
  lineImg = [
    {
      title: '客服',
      img: $r('app.media.kefu')
    },
    {
      title: '购物车',
      img: $r('app.media.gouwuche')
    },
    {
      title: '缴费查询',
      img: $r('app.media.jiaofeichaxun')
    },
    {
      title: '社保',
      img: $r('app.media.shebao')
    },
    {
      title: '咨询解答',
      img: $r('app.media.zixunjieda')
    },
    {
      title: '医保卡',
      img: $r('app.media.yiaoka')
    },
    {
      title: '数据统计',
      img: $r('app.media.shujutongji')
    },
    {
      title: '商城',
      img: $r('app.media.shop')
    },
    {
      title: '日历',
      img: $r('app.media.rli')
    },
    {
      title: '民宿',
      img: $r('app.media.minsu')
    },
    {
      title: '就业',
      img: $r('app.media.jiuye')
    },
    {
      title: '全部',
      img: $r('app.media.quanbu')
    },

  ]
}

let mainViewModel = new MainPageModel();

export default mainViewModel as MainPageModel
