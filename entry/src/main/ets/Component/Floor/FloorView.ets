import { getScreenHeight } from '../../utils/ScreenUtils';

@Component
export struct FloorView {

  /**
   * 二楼视图
   */
  @BuilderParam mFloorView: () => void
  @Link mainPageOffsetY: number;
  @State mFloorHeight: number = getScreenHeight()

  /**
   * 展开收起动画效果 时长，定时器常量，随便定义
   */
  @State mPackUpIntervalTime: number = 20;

  /**
   * 二楼滑动距离
   */
  @State mPackUpFloorTriggerDistance: number = 150;

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
  private lastX: number = 0;
  private lastY: number = 0;
  private downY: number = 0;
  /**
   * 是否在拉拽
   */
  private dragging: boolean = false;

  /**
   * 调用开始收起方法
   */
  @Consume @Watch("startPackUp") startPackUpFloor: boolean;

  /**
   * 收起方法，与startPackUp绑定
   */
  private startPackUp() {
    if (this.startPackUpFloor) {
      this.packUpFloor()
      this.startPackUpFloor = false
    }
  }

  build() {
    Column() {
      this.mFloorView()
    }
    .width("100%")
    .height(this.mFloorHeight)
    .position({
      x: 0,
      y: this.mainPageOffsetY
    })
    .onTouch((event) => {
      if (event.touches.length != 1) {
        event.stopPropagation();
        return
      }
      switch (event.type) {
        case TouchType.Down:
          this.secondFloorTouchDown(event);
          break;
        case TouchType.Move:
          this.secondFloorTouchMove(event);
          break;
        case TouchType.Up:
        case TouchType.Cancel:
          this.secondFloorTouchUp(event);
          break;
      }
      event.stopPropagation();
    })
  }

  private secondFloorTouchDown(event: TouchEvent) {
    this.lastX = event.touches[0].screenX;
    this.lastY = event.touches[0].screenY;
    this.downY = this.lastY;
    this.dragging = false;
  }

  private secondFloorTouchMove(event: TouchEvent) {
    let currentX = event.touches[0].screenX;
    let currentY = event.touches[0].screenY;
    let deltaX = currentX - this.lastX;
    let deltaY = currentY - this.lastY;
    if (this.dragging) {
      if (deltaY < 0) {
        if (this.mainPageOffsetY > -this.mFloorHeight) {
          this.mainPageOffsetY = this.mainPageOffsetY + px2vp(deltaY) * this.mFlingFactor;
        } else {
          this.mainPageOffsetY = -this.mFloorHeight;
          this.downY = this.lastY;
        }
      } else {
        this.mainPageOffsetY = this.mainPageOffsetY + px2vp(deltaY) * this.mFlingFactor;
      }
      this.lastX = currentX;
      this.lastY = currentY;
    } else {
      if (Math.abs(deltaX) < Math.abs(deltaY) && Math.abs(deltaY) > this.touchSlop) {
        if (deltaY < 0) {
          this.dragging = true;
          this.lastX = currentX;
          this.lastY = currentY;
        }
      }
    }
  }

  private packUpFloor() {
    let intervalId = setInterval(() => {
      if (this.mainPageOffsetY <= -this.mFloorHeight) {
        if (this.mainPageOffsetY < -this.mFloorHeight) {
          this.mainPageOffsetY = -this.mFloorHeight
        }
        clearInterval(intervalId);
      } else {
        this.mainPageOffsetY = (this.mainPageOffsetY - 200) > (-this.mFloorHeight) ? (this.mainPageOffsetY - 200) : -this.mFloorHeight
      }
    }, this.mPackUpIntervalTime);
  }

  private secondFloorTouchUp(event: TouchEvent) {
    if (this.dragging) {
      if (Math.abs(this.mainPageOffsetY) > this.mPackUpFloorTriggerDistance) {
        this.packUpFloor()
      } else {
        this.scrollByBottom();
      }
    }
  }

  private scrollByBottom() {
    let intervalId = setInterval(() => {
      if (this.mainPageOffsetY >= 0) {
        this.mainPageOffsetY = 0;
        clearInterval(intervalId);
      } else {
        this.mainPageOffsetY = ((this.mainPageOffsetY + this.offsetStep) < 0) ? this.mainPageOffsetY + this.offsetStep : 0;
      }
    }, this.mPackUpIntervalTime);
  }
}