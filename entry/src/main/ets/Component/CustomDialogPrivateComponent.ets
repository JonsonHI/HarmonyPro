@CustomDialog
export default struct CustomDialogPrivateComponent {
  controller: CustomDialogController = new CustomDialogController({ 'builder': '' });
  cancel: Function = () => {
  };
  confirm: Function = () => {
  };

  build() {
    Column() {
      Text('来到欢迎页')
      Text('在此特别提醒您（用户）在注册成为用户之前，请认真阅读本《用户注册及使用App隐私协议》（以下简称 “协议”），确保您充分理解本协议中各条款。请您审慎阅读并选择接受或不接受本协议。除非您接受本协议所有条款，否则您无权注册、登录或使用本协议所涉服 务。您的注册、登录、使用等行为将视为对本协议的接受，并同意接受本协议各项条款的约束。本协议约定本产品与用户之间关于本软件服务（以下简称“服务”）的权利义务。用户，是指注册、登录、使用本服务的个人或组织。本协议可由本产品随时更新，更新后 的协议条款一旦公布即代替原来的协议条款，恕不再另行通知，用户可在本App中查阅最新版协议条款')
      Row() {
        Text('不同意')
          .onClick(() => {
            this.cancel()
          })
        Text('同意')
          .onClick(() => {
            this.confirm()
          })
      }
      .justifyContent(FlexAlign.SpaceAround)
      .width('100%')

    }
    .height(300)
    .width('90%')
    .backgroundColor('white')
    .border({radius:20})
    .margin({bottom:50})
  }
}

