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







