import display from '@ohos.display';


/**
 * 屏幕高度
 */
// export let screenHeight: number = getScreenHeight()
// export let screenWidth: number = getScreenWidth()


export function getScreenHeight(): number {
  try {
    let displayClass = display.getDefaultDisplaySync();
    return px2vp(displayClass.height);
  } catch (exception) {
    console.error('Failed to obtain the default display object. Code: ' + JSON.stringify(exception));
  }
  return 0;
}
export function getScreenWidth(): number {
  try {
    let displayClass = display.getDefaultDisplaySync();
    return px2vp(displayClass.width);
  } catch (exception) {
    console.error('Failed to obtain the default display object. Code: ' + JSON.stringify(exception));
  }
  return 0;
}