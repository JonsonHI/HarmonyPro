
import promptAction from '@ohos.promptAction';

export function  showToast(message:string,duration: number = 2000,bottom:number = 50){

  try {
    promptAction.showToast({
      message: message,
      duration: duration,
      bottom:bottom
    });
  } catch (error) {
    console.error(`showToast args error code is ${error.code}, message is ${error.message}`);
  };


}