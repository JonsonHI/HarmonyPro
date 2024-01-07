import hilog from '@ohos.hilog'
import { getScreenHeight } from '../../utils/ScreenUtils'
import { FloorConfig } from './FloorConfig'
import { FloorView } from './FloorView'

@Component
export struct SecondFloor {
  mFloorConfig: FloorConfig

  /**
   * 首页视图
   */
  @BuilderParam mHomeView: () => void

  /**
   * 二楼视图
   */
  @BuilderParam mFloorView: () => void


  /**
   * floor高度(可外部传入，例：沉浸式场景、非沉浸式场景)
   */
  private mFloorHeight: number = getScreenHeight()

  /**
   * 展开二楼拉拽触发距离
   */
  private mExpandFloorTriggerDistance: number = 150;

  /**
   * 展开二楼的时间
   */
  private mExpandFloorIntervalTime: number = 20;

  /**
   * 收起二楼拉拽触发距离
   */
  private mPackUpFloorTriggerDistance: number = 150;

  /**
   * 收起二楼动效时间
   */
  private mPackUpIntervalTime: number = 20;


  /**
   * 阻尼系数
   */
  private mFlingFactor: number = 0.75;


  /**
   * 可滑动的最小距离
   */
  private touchSlop: number = 2;

  /**
   * 用于计算下拉距离不够自动收起的常量，，随便定义值
   */
  private offsetStep: number = 10;

  /**
   * 是否在拉拽
   */
  private dragging: boolean = false;


  /*------------------------------------------------计算偏移量相关------------------------------------------------*/
  /**
   * Y轴偏移量，下拉的距离
   */
  @State offsetY: number = -getScreenHeight();
  private lastX: number = 0;
  private lastY: number = 0;
  private downY: number = 0;
  /*------------------------------------------------计算偏移量相关------------------------------------------------*/


  private initConfig() {
    if (this.mFloorConfig == null || this.mFloorConfig == undefined) {
      this.mFloorConfig = new FloorConfig()
    }

    this.offsetY = -this.mFloorConfig.getFloorHeight();


    this.mFloorHeight = this.mFloorConfig.getFloorHeight()


    this.mExpandFloorTriggerDistance = this.mFloorConfig.getExpandFloorTriggerDistance()


    this.mExpandFloorIntervalTime = this.mFloorConfig.getExpandIntervalTime();


    this.mPackUpFloorTriggerDistance = this.mFloorConfig.getPackUpFloorTriggerDistance()


    this.mPackUpIntervalTime = this.mFloorConfig.getPackUpIntervalTime();


    this.mFlingFactor = this.mFloorConfig.getFlingFactor()
  }

  aboutToAppear() {
    this.initConfig()
  }

  build() {
    Column() {
      FloorView({
        mFloorHeight: this.mFloorHeight,
        mFloorView: this.mFloorView,
        mainPageOffsetY: $offsetY,
        mPackUpFloorTriggerDistance: this.mPackUpFloorTriggerDistance,
        mPackUpIntervalTime: this.mPackUpIntervalTime,
      })

      Column() {
        this.mHomeView()
      }.width("100%")
      .layoutWeight(1)
      .position({
        x: 0,
        y: this.offsetY + this.mFloorConfig.getFloorHeight()
      })

    }
    .width("100%")
    .height('100%')
    .clip(true)
    .onTouch((event) => {
      if (event.touches.length != 1) {
        event.stopPropagation();
        return
      }
      switch (event.type) {
        case TouchType.Down:
          this.onTouchDown(event);
          break;
        case TouchType.Move:
          this.onTouchMove(event);
          break;
        case TouchType.Up:
        case TouchType.Cancel:
          this.onTouchUp();
          break;
      }
      event.stopPropagation();
    })

  }

  /**
   * 按下事件
   * @param event
   */
  private onTouchDown(event: TouchEvent) {
    this.lastX = event.touches[0].screenX;
    this.lastY = event.touches[0].screenY;
    this.downY = this.lastY;
    this.dragging = false;
  }

  /**
   * 抬起事件
   */
  private onTouchUp() {
    if (this.dragging) {
      if ((this.mFloorConfig.getFloorHeight() - Math.abs(this.offsetY)) > this.mExpandFloorTriggerDistance) {
        this.expandSecondFloor()
      } else {
        this.scrollByTop();
      }
    }
  }

  /**
   * 滑动事件
   * @param event
   */
  private onTouchMove(event: TouchEvent) {
    let currentX = event.touches[0].screenX;
    let currentY = event.touches[0].screenY;
    let deltaX = currentX - this.lastX;
    let deltaY = currentY - this.lastY;
    if (this.dragging) {
      if (deltaY < 0) {
        if (this.offsetY > -this.mFloorConfig.getFloorHeight()) {
          this.offsetY = this.offsetY + px2vp(deltaY) * this.mFlingFactor;
        } else {
          this.offsetY = -this.mFloorConfig.getFloorHeight();
          this.downY = this.lastY;
        }
      } else {
        this.offsetY = this.offsetY + px2vp(deltaY) * this.mFlingFactor;
      }
      this.lastX = currentX;
      this.lastY = currentY;
    } else {
      if (Math.abs(deltaX) < Math.abs(deltaY) && Math.abs(deltaY) > this.touchSlop) {
        if (deltaY > 140) {
          this.dragging = true;
          this.lastX = currentX;
          this.lastY = currentY;
        }
      }
    }
  }


  /**
   * 展开二楼时添加一个动效
   */
  private expandSecondFloor() {
    let intervalId = setInterval(() => {
      if (this.offsetY >= 0) {
        this.offsetY = 0
        clearInterval(intervalId);
      } else {
        this.offsetY = (this.offsetY + 300) < 0 ? (this.offsetY + 300) : 0
      }
    }, this.mExpandFloorIntervalTime);
  }


  /**
   * 回弹方法
   */
  private scrollByTop() {
    if (this.offsetY != -this.mFloorConfig.getFloorHeight()) {
      let intervalId = setInterval(() => {
        if (this.offsetY <= -this.mFloorConfig.getFloorHeight()) {
          this.offsetY = -this.mFloorConfig.getFloorHeight();
          clearInterval(intervalId);
        } else {
          this.offsetY = ((this.offsetY - this.offsetStep) < -this.mFloorConfig.getFloorHeight()) ? (-this.mFloorConfig.getFloorHeight()) : (this.offsetY - this.offsetStep);
        }
      }, this.mExpandFloorIntervalTime);
    } else {
      hilog.debug(0x0000, "tag", "scrollByTop(): already scrolled to top edge")
    }
  }
}