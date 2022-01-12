//
//  UIViewControllerVIew.swift
//  FantasyTikTok
//
//  Created by 赵翔宇 on 2022/1/11.
//

import SwiftUI
import DouyinOpenSDK

struct ControllerView: UIViewControllerRepresentable {

    let controller : UIViewController
    
    // 2.
    func makeUIViewController(context: Context) -> UIViewController {
        return controller
    }
    
    // 3.
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}




