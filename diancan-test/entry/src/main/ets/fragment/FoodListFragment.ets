@Preview
@Component
struct FoodListFragment {
  build() {
    Column(){
      Stack(){
        Image($r('app.media.order_top')).height('100%').width('100%')
        Column(){
          Row(){
            Column(){
              Row(){
                Text($r('app.string.restaurant_name'))
                  .fontWeight(700)
                  .sentenceStyle()
              }
            }
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('100%')
          .padding(10)
        }.padding({top:10,left:16})
      }.height(150)
    }
  }

}
@Extend(Text)
function sentenceStyle(){
  .fontColor(Color.White)
  .fontSize(20)
}