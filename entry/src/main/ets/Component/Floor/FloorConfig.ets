import { getScreenHeight } from '../../utils/ScreenUtils';

export class FloorConfig {

  /**
   * 二楼高度(可外部传入，例：沉浸式场景、非沉浸式场景)
   */

  private mFloorHeight: number = getScreenHeight()
  // private mScreenHeight: number = getScreenHeight()

  /**
   * 展开二楼拉拽距离
   */
  private mExpandFloorTriggerDistance: number = 150;

  /**
   * 收起二楼拉拽距离
   */
  private mPackUpFloorTriggerDistance: number = 150;

  /**
   * 阻尼系数
   */
  private mFlingFactor: number = 0.75;


  /**
   * 展开动画效果 时长，定时器常量，随便定义
   */
  private mExpandIntervalTime: number = 20;

  /**
   * 收起动画效果 时长，定时器常量，随便定义
   */
  private mPackUpIntervalTime: number = 20;

  setFloorHeight(height: number) {
    this.mFloorHeight = height
    return this
  }

  getFloorHeight() {
    return this.mFloorHeight
  }

  setExpandFloorTriggerDistance(distance: number) {
    this.mExpandFloorTriggerDistance = distance
    return this
  }

  getExpandFloorTriggerDistance() {
    return this.mExpandFloorTriggerDistance
  }

  setPackUpFloorTriggerDistance(distance: number) {
    this.mPackUpFloorTriggerDistance = distance
    return this
  }

  getPackUpFloorTriggerDistance() {
    return this.mPackUpFloorTriggerDistance;
  }

  setFlingFactor(flingFactor: number) {
    this.mFlingFactor = flingFactor
    return this
  }

  getFlingFactor() {
    return this.mFlingFactor
  }

  setExpandIntervalTime(interval: number) {
    this.mExpandIntervalTime = interval
    return this
  }

  getExpandIntervalTime() {
    return this.mExpandIntervalTime
  }

  setPackUpIntervalTime(interval: number) {
    this.mPackUpIntervalTime = interval
    return this
  }

  getPackUpIntervalTime() {
    return this.mPackUpIntervalTime
  }
}