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
       Column({space:10}){
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

       Button('注册')
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