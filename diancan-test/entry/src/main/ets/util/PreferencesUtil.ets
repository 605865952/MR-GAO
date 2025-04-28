import { preferences } from '@kit.ArkData'

class PreferencesUtil{
  sp_name:string='GreenTreasureStore'
  //首选项实例
 private  pref:preferences.Preferences | null=null
//初始化preferences实例
  //@context应用上下文
 async  init(context:Context){
    try {
      this.pref =await preferences.getPreferences(context,this.sp_name)
    }catch (err){}

  }
  //销毁preferences实例，-缓存，持久化文件一并销毁
  async delPreference(context:Context){
    try {
      await preferences.deletePreferences(context,this.sp_name)
      console.log(`preferences[${this.sp_name}]销毁成功`)
    }catch (err){
      console.log(`preferences[${this.sp_name}]销毁失败`)
      console.log('err:',JSON.stringify(err))
    }
  }
  //从preferences实例中获取键对应值
  async getPreferenceValue(key:string,defaultValue:preferences.ValueType):Promise<preferences.ValueType>{
    let value:preferences.ValueType=defaultValue
    //获取对应值之前，先判断preferences是否初始化完成
    if(!this.pref){
      console.error(`preferences[${this.sp_name}]尚未初始化`)
    return value
    }
    try {
      value=await this.pref.get(key,defaultValue)
      console.log(`读取preferences[${key}=${value}]成功`)
    }catch (err){
      console.log(`读取[${key}]失败`,JSON.stringify(err))
    }
    return value
  }
  //从Preferences实例中写入数据
  async putPreferenceValue(key:string,value:preferences.ValueType,){
      //写入之前判断preferences是否初始化完成
    if(!this.pref){
      console.error(`preferencs[${this.sp_name}]尚未初始化`)
      return
    }
    //将数据写入内存中
    try {
      await this.pref.put(key,value)
      //持久化，重启应用也可以保存数据
      await this.pref.flush()
      console.log(`保存preferencs[${key}=${value}]成功`)
    }catch (err){
      console.error(`保存preferences[${key}=${value}]失败`)
    }

  }
}

const preferenceUtil=new PreferencesUtil()
export default preferenceUtil as PreferencesUtil