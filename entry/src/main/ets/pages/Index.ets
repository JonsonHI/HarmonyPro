import router from '@ohos.router'
import preferences from '@ohos.data.preferences';
import CustomDialogPrivateComponent from '../Component/CustomDialogPrivateComponent';
import common from '@ohos.app.ability.common';
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  private context?: common.UIAbilityContext;
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogPrivateComponent(
      {
        cancel: () => {
          this.onCancel();
        },
        confirm: () => {
          this.onConfirm();
        }
      }),
    alignment: DialogAlignment.Center,
    offset: { dx: 0, dy: 10 },
    customStyle: true,
    autoCancel: false
  });

  onCancel(){
    this.context?.terminateSelf()
  }
  onConfirm(){
    let self = this
    this.getDataPreferences(this).then((preferences: preferences.Preferences) => {
      preferences.put('isPrivate',false,function(err,val){
        if (err) {
          console.log('存储错误',err)
          return
        }
        preferences.flush()
        self.dialogController.close()
        self.jumpToHomePage()

      })
    })
  }

  jumpToHomePage(){
    router.replaceUrl({url:'pages/MainPage'})
  }

  getDataPreferences(common: Object) {
    return preferences.getPreferences(getContext(common), 'myStore');
  }

  onPageShow(){
    this.getDataPreferences(this).then((preferences: preferences.Preferences) => {
      preferences.get('isPrivate', true).then((value: preferences.ValueType) => {
        console.info('LauncherPage', 'onPageShow value: ' + value);
        if (value) {
          this.dialogController.open();
        }
        else {
          this.jumpToHomePage();
        }
      });
    });
  }


  aboutToAppear(){
    // this.getDataPreferences(this).then((preferences)=>{
    //   preferences.delete('isPrivate')
    // })
    // setTimeout(()=>{
    //   router.replaceUrl({url:'pages/MainPage'})
    // },2000)
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