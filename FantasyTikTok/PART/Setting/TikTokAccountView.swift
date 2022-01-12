//
//  SwiftUIView.swift
//  FantasyTikTok
//
//  Created by 赵翔宇 on 2022/1/12.
//

import SwiftUI


struct TikTokAccountView : View{
   
    var body: some View{
        
        
        VStack{
            MainButton(title: "链接抖音账户",iconname: "WeiboLogo") {
                openTikTok()
            }
            Text("基于公司抖音Api打造")
                .mFont(style: .Body_15_R,color: .fc3)
        }
    
    }
    
    func openTikTok(){
//        let req = DouyinOpenSDKAuthRequest.init()
//            req.permissions = NSOrderedSet.init(object: "user_info,trial.whitelist")
//        req.send(UIViewController()) { response in
//                 madasoft()
//                if response.errCode.rawValue == 0{
//                    print("成功 code = \(String(describing: response.code))")
//                    TikTokAccountViewModel.shared.tiktokcode = response.code ?? "成功123"
//                    madaError()
//                }else{
//                    print("失败 code = \(response.errCode)")
//                    TikTokAccountViewModel.shared.tiktokcode = response.code ?? "失败"
//                    madaError()
//                }
//             }
    }
}

struct TikTokAccountView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
