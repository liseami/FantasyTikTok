//
//  SearchView.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/5.
//

import SwiftUI
import FantasyUI


class SearchManager : ObservableObject{
    
    static let shared  = SearchManager()
    
    @Published var showSearchInputView : Bool = false
    enum searchResultSwitch : MTPageSegmentProtocol {
        case hot
        case music
        case tag
        case people
        case video
       
        var showText: String{
            switch self {
            case .hot:
               return "热点"
            case .music:
                return "话题"
            case .tag:
                return "音乐"
            case .people:
                return "达人"
            case .video:
                return "视频"
            }
        }
    }
    
    
    @Published var searchResultTab : searchResultSwitch = .hot
    var tabitems : [searchResultSwitch] = [.hot,.music,.tag,.people,.video]
}


struct SearchView: View {
 
    @State private var startToSearch : Bool = false
    
    @State private var offset : CGFloat = 0
    @State private var pageIndex : Int = 0
    
    @ObservedObject var vm = SearchManager.shared
    
    
    var body: some View {
        
        
        VStack(spacing:0){
            MT_PageSegmentView(titles: vm.tabitems, offset: $offset)
            MT_PageScrollowView(offset: $offset) {
                mainViews
            }
        }
        .frame(width: SW)
        .navigationBarTitleDisplayMode(.inline)
        .PF_Navitop(style: .large,showDivider: false) {
            Color.BackGround
        } TopCenterView: {
            Text("抖音大盘")
                .mFont(style: .Title_17_B,color: .fc1)
        }
        }
    
    @ViewBuilder
    var mainViews : some View {
        HStack(spacing: 0) {
            Group {
                ScrollView {
                    LazyVStack(spacing:12){
                        Spacer().frame(width: 1, height: 1)
                        ForEach(0..<12){ index in
                            Hottag()
                        }
                        Spacer().frame(width: 1, height: 80)
                    }
                    .padding(.all,0)
                }
                
                PolularVideo()
                PolularPost()
                PolularSpace()
                PolularSpace()
            }
            .frame(width: SW)
            
        }
    }
    
    }

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(uistate: UIState.init(tabbarIndex: .search))
    }
}

struct Hottag : View{
    var body: some View{
        
        HStack(spacing:12){
            Image("\(Int.random(in: 1...12))")
                .resizable()
                .scaledToFill()
                .frame(width: SW * 0.16, height: SW * 0.16)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            VStack(alignment: .leading, spacing: 6){
                Text("影响力指数" + "  \(Int.random(in: 10000...1000000))")
                    .PF_Leading()
                    .mFont(style: .Body_12_B,color: .fc2)
            Text("#" + randomString(12))
                    .mFont(style: .Body_15_B,color: .fc1)
            Text("日播放" + "\(Double.random(in: 1...12))" + "亿")
                    .mFont(style: .Caption_10_R,color: .fc3)
        }
       
        Spacer()
            ICON(sysname: "play.fill",fcolor: .fc1,size: 16)
                .padding(.all,6)
                .background(Color.fc3.opacity(0.1))
                .clipShape(Circle())
    }
        .padding(.all,12)
        .background(Color.Card)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .padding(.horizontal,12)
        
}
}


