//
//  SwiftUIView.swift
//  FantasyTikTok
//
//  Created by 赵翔宇 on 2022/1/12.
//

import SwiftUI
import Alamofire




struct TikTokAccountView : View{
    @ObservedObject var vm = TikTokAccountViewModel.shared
    
    var body: some View{
        
        
        VStack{
            Text("code")
            Text(vm.tiktokcode)
            Text("access_token")
            Text(vm.access_token)
            Spacer()
            MainButton(title: "获取token",iconname: "tiktok") {
                vm.gettoken()
            }
            MainButton(title: "链接抖音账户",iconname: "tiktok") {
                vm.opentiktok()
            }
            Text(" 基于字节跳动TikTokOpenApi打造")
                .mFont(style: .Body_15_R,color: .fc3)
        }
        .padding(.all,24)
        .PF_OverProgressView(loadingState: vm.isloading ? .fullScreen : .none)
        
        
    }
        
    
   
}


struct TikTokAccountView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



/// 抖音账户类
class TikTokAccountViewModel : ObservableObject{
    static let shared = TikTokAccountViewModel()
    
    @Published var tiktokcode : String = ""
    @Published var access_token : String = ""
    @Published var isloading : Bool = false
    
func gettoken(){
    //通过code请求Access_token
    let target = TikTokAccountApi.getAccess_token(p: .init(client_secret: App_Client_Secret, code: self.tiktokcode, grant_type: "authorization_code", client_key: App_client_key))
    Networking.requestObject(target, modeType: getAccess_token_responsemod.self) { r, m in
        if r.message == "success"{
            self.access_token = m!.access_token!
        }
    }
}
    
    func opentiktok(){
        isloading = true
        let req = DouyinOpenSDKAuthRequest.init()
        req.permissions = NSOrderedSet.init(object: "user_info,trial.whitelist")
        req.send(UIViewController()) { response in
            madasoft()
            if response.errCode.rawValue == 0{
                print("成功 code = \(String(describing: response.code))")
                self.tiktokcode = response.code!
                madaSuccess()
            }else{
                print("失败 code = \(response.errCode)")
                self.tiktokcode = response.code ?? "失败"
                madaError()
            }
        }
        isloading = false
    }
}

enum TikTokAccountApi : ApiType{
    
    case getAccess_token(p:getAccess_token_reqmod)
    
    var path: String{
        "oauth/access_token"
    }
    
    var method: HTTPMethod{
        .post
    }
    
  
    
    var parameters: [String : Any]?{
        switch self {
        case .getAccess_token(let p):
            return p.kj.JSONObject()
        }
    }
    
    var parameterEncoding: ParameterEncoding{
        return URLEncoding.default
    }
}

struct getAccess_token_reqmod : Convertible{

    var client_secret  : String = App_Client_Secret//   应用唯一标识对应的密钥
    var code  :  String?  // 授权码  true
    var grant_type  :  String  =  "authorization_code"//  写死"authorization_code"即可
    var client_key   : String = App_client_key  // 应用唯一标识
}
struct getAccess_token_responsemod : Convertible{
    var   error_code   :Int?   // 错误码    0
    var   expires_in    :Int?    //access_token接口调用凭证超时时间，单位（秒)    86400
    var   open_id    : String?   // 授权用户唯一标识    aaa-bbb-ccc
    var   refresh_expires_in : Int?  //  int64    refresh_token凭证超时时间，单位（秒)    86400
    var   refresh_token    : String?  //  用户刷新access_token    refresh_token
    var   scope    : String?     // 用户授权的作用域(Scope)，使用逗号（,）分隔，开放平台几乎几乎每个接口都需要特定的Scope。
    var   access_token    : String?   // 接口调用凭证    access_token
    var   description    : String?    //错误码描述
}
