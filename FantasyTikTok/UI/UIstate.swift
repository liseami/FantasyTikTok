//
//  UIstate.swift
//  Fantline
//
//  Created by Liseami on 2021/12/14.
//

import SwiftUI

class UIState : ObservableObject{
    
    static let shared = UIState()
    
    let userdefult = UserDefaults.standard
   
    init(tabbarIndex : tabbarItemEnum = .home){
        self.TabbarIndex = tabbarIndex
    }
    
    @Published var logged : Bool = true
    // Tabar
    @Published var TabbarIndex : tabbarItemEnum = .home
    @Published var TabbarProgress : Double = 0
    var tabbarItem : [tabbarItemEnum] = [.home,.light,.search,.profile]
    
    enum tabbarItemEnum {
        case home
        case light
        case search
        case profile
        var iconname : String{
            switch self {
            case .home:
                return "home"
            case .light:
                return "light"
            case .search:
                return "search"
            case .profile :
                return "profile"
            }
        }
    }
    
    ///hometool
    @Published var showSettingView : Bool = false
    @Published var showProfileView : Bool = false
    
    ///post
    @Published var showPostDetailView : Bool = false
    
}
