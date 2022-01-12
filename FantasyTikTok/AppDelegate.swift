//
//  App.swift
//  TimeMachine (iOS)
//
//  Created by Liseami on 2021/10/1.
//

import Foundation
import UIKit
import DouyinOpenSDK


class TikTokClass : NSObject,ObservableObject{
    static let shared = TikTokClass()
    var TikTok =  DouyinOpenSDKApplicationDelegate.sharedInstance()
}


class AppDelegate :NSObject, UIApplicationDelegate,DouyinOpenSDKLogDelegate{
 
    
    
    func onLog(_ logInfo: String) {
        print(logInfo)
    }
    
    let tiktok = TikTokClass.shared.TikTok
    
    ///
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        //        //友盟启动
        //        UM_RUN()
        //        //AppleStore初始化
        //        AppStore_init()
        //        //UI调整
        Customappearance()
        //
        //        //初次登陆检查
        LaunchManager.shared.firstLaunchTest()
        //
        UIState.shared.app = application
        tiktok.registerAppId("aw6gq77f1segkm0l")
        tiktok.logDelegate = self
        tiktok.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
    
    
//
//
//    ///抖音唤起本App
//    ///options
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//        //抖音OpenURL
//
//        if tiktok.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String, annotation: options[UIApplication.OpenURLOptionsKey.annotation]){
//            UIState.shared.douyincode = "UIApplication.OpenURLOptionsKey"
//            madaSuccess()
//            return true
//        }
//        return false
//    }
//
//
//    ///抖音唤起本App
//    ///sourceApplication
//    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//
//        if tiktok.application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
//        {
//            UIState.shared.douyincode = "sourceApplication"
//            madaSuccess()
//            return true
//        }
//        return false
//    }
//
//
////    /抖音唤起本App
////    /handleOpen
//    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
//        if tiktok.application(application, open: url, sourceApplication: nil, annotation: ""){
//            madaSuccess()
//            UIState.shared.douyincode = "handleOpen"
//            return true
//        }
//        return false
//    }
//


    
    
    
//    SceneDelegate
    func application(
      _ application: UIApplication,
      configurationForConnecting connectingSceneSession: UISceneSession,
      options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
      let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
      sceneConfig.delegateClass = SceneDelegate.self // 👈🏻
    
      return sceneConfig
    }
    
}







