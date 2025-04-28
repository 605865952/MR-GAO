import router from '@ohos.router'

@Entry
@Component
struct SplashPage {
  @State countDownSecond:number=4
  timeId:number=0
  onPageShow(): void {
   this.timeId=setInterval(()=>{
     if(this.countDownSecond===0){
       // router.replaceUrl({url:"pages/Index"})
     }else {
       this.countDownSecond--
     }
   },1000)
  }
  onPageHide(): void {
  router.clear()
    clearInterval(this.timeId)
  }

  build() {
    Stack({alignContent:Alignment.TopEnd}){
      Image($r('app.media.splash'))
        .width('100%')
        .height('100%')
      Text(`跳过${this.countDownSecond}`)
        .fontColor(Color.White)
        .fontSize('12fp')
        .letterSpacing(0.05)
        .backgroundColor('#33000000')
        .border({
          radius:'18vp',
          width:'1',
          color:Color.White
        })
        .margin({top:'50vp',left:'260vp'})
        .padding({
          left:'12vp',
          top:'8vp',
          right:'12vp',
          bottom:'8vp'
        })
        .onClick(()=>{
          router.replaceUrl({url:'pages/MinePage'})
        })
    }
      .width('100%')
    .height('100%')
  }
}