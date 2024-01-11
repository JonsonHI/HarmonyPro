import { ColumModel, Taks } from '../../ViewModel/ColumModel'
import { BottomView } from './component/BottomView'
import { CenterView } from './component/CenterView'
import { TitleView } from './component/TitleView'

@Entry
@Component
struct ColumPage {
  @State message: string = 'Hello World'
  @Provide('com.colum_statInfo') statInfo: ColumModel = new ColumModel(0, 0)
  @Provide('com.colum_task') task: Taks[] = []
  @State scale1: number = 1
  @State opacity1: number = 1


  pageTransition() {
    PageTransitionEnter({ duration: 1200, curve: Curve.Linear })
      .slide(SlideEffect.Bottom)

    // PageTransitionExit({ duration: 1500, curve: Curve.Ease })
    //   .slide(SlideEffect.Top)
  }

  addColum() {
    // this.statInfo.finishTask = this.task.filter(item=>item.finished).length
    // this.statInfo.totalTask = this.task.length
    console.log('length:~~~~~~', this.task.length);
  }

  build() {
      Column({ space: 10 }) {
        TitleView({ addColum: this.addColum })
        CenterView({ addColum: this.addColum })
        BottomView({ addColum: this.addColum })
      }.scale({ x: this.scale1 }).opacity(this.opacity1)
    .width('100%')
    .height('100%')

    .padding({ left: 10, right: 10 })
  }
}