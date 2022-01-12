//
//  SceneDelegate.swift
//  FantasyTikTok
//
//  Created by 赵翔宇 on 2022/1/12.
//

import Foundation


class SceneDelegate: NSObject, UIWindowSceneDelegate,ObservableObject {
   
    
  func sceneWillEnterForeground(_ scene: UIScene) {
    // ...
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
    // ...
  }

  func sceneWillResignActive(_ scene: UIScene) {
    // ...
  }
    
  func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        print(URLContexts)// 👈🏻 接受抖音唤起app时携带的URL
      if let url = URLContexts.first?.url{
          TikTokClass.shared.TikTok.application(UIState.shared.app, open:  url, sourceApplication: nil, annotation: "")
      }
  }
    
}

//486c2c9586ba8d810qcs99Qd6vYNzvm9rAiT
//486c2c9586ba8d81FvGa3iptDb7TTOtvQXZJ
//486c2c9586ba8d81sniB8oLqQaxuxJ4naPtK
