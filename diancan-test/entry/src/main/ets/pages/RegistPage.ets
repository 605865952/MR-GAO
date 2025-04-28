import prompt from '@ohos.prompt'
import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct RegistPage {
  @State username:string='admin'
  @State password:string='admin'
  @State password2:string='admin'

  build() {
     Column(){
       Image($r('app.media.icon')).width(40).height(40).margin({bottom:'20vp',top:40})
       Text('用户注册').fontSize(18).fontWeight(FontWeight.Bold).margin({bottom:30})
       Column(){
         TextInput({placeholder:'请输入手机号'})
           .inputStyle()
           .onChange(data=>{

           })
         TextInput({placeholder:'请输入密码'})
           .inputStyle()
           .type(InputType.Password)
         TextInput({placeholder:'请在此输入密码'})
           .inputStyle()
           .type(InputType.Password)
       }.padding(15)

       Button('注册',{type:ButtonType.Capsule})
         .width('50%')
         .backgroundColor($r('app.color.tint_main'))
         .margin({top:20,left:20,right:20})
         .onClick(()=>{
           this.loginBtnClick()
         })
     }
  }
  loginBtnClick(){
    //判断用户名和密码非空
    if(this.username==''||this.password==''||this.password2==''){
      //不能跳转，同时提示
      promptAction.showToast({
        message:'手机号，密码，再次密码不能为空',
        duration:1000,
        bottom:'360vp'
      })
    }
  }
}
//拓展样式组件
@Extend(TextInput)
function inputStyle(){
  .placeholderColor(0x999999)
  .maxLength(6)
  .padding('12vp')
  .margin('10vp')
}