import prompt from '@ohos.prompt'
import { promptAction } from '@kit.ArkUI'
import PreferencesUtil from '../util/PreferencesUtil'
import { preferences } from '@kit.ArkData'
import preferenceUtil from '../util/PreferencesUtil'

@Entry
@Component
struct RegistPage {
  @State username:string=''
  @State password:string=''
  @State password2:string=''

  build() {
     Column(){
       Image($r('app.media.icon')).width(40).height(40).margin({bottom:'20vp',top:40})
       Text('用户注册').fontSize(18).fontWeight(FontWeight.Bold).margin({bottom:30})

         TextInput({placeholder:'请输入手机号'})
           .inputStyle()
           .onChange(data=>{
             this.username=data
           })
         TextInput({placeholder:'请输入密码'})
           .inputStyle()
           .type(InputType.Password)
           .onChange(data=>{
             this.password=data
           })
         TextInput({placeholder:'请在此输入密码'})
           .inputStyle()
           .type(InputType.Password)
           .onChange(data=>{
             this.password2=data
           })


       Button('注册',{type:ButtonType.Capsule})
         .width('50%')
         .backgroundColor($r('app.color.tint_main'))
         .margin({top:20,left:20,right:20})
         .onClick(()=>{
           this.loginBtnClick()
         })
     }
  }
  async  loginBtnClick(){
    //判断用户名和密码非空
    if(this.username==''||this.password==''||this.password2==''){
      //不能跳转，同时提示
      promptAction.showToast({
        message:'手机号，密码，再次密码不能为空',
        duration:1000,
        bottom:'360vp'
      })
    }
    if (this.password != this.password2) {
      promptAction.showToast({
        message: '密码、再次密码必须相同',
        duration: 1000,
        bottom: '360vp'
      })
      return
    }
    PreferencesUtil.putPreferenceValue('user_name',this.username)
    PreferencesUtil.putPreferenceValue('pwd',this.password)
    let v: preferences.ValueType = await preferenceUtil.getPreferenceValue('user_name', '')
    console.log('VVV'+v)
    promptAction.showToast({
      message:`注册成功${this.password2}=${this.password}`,
      duration:1000,
      bottom:'360vp'
    })
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