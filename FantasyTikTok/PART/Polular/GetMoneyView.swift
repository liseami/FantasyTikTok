//
//  Polular.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/5.
//

import SwiftUI




class GetMoneyViewModule : ObservableObject{
    static let shared  = GetMoneyViewModule()
    
    
    enum polularSwitch:MTPageSegmentProtocol {
        case photo
        case video
        case post
        case space

        var showText: String{
            switch self {
            case .photo:
                    return "照片"
            case .video:
                    return "视频"
            case .post:
                    return "推文"
            case .space:
                    return "Space"
            }
        }
    }
    
    @Published var polularTab : polularSwitch = .photo
    var tabitems : [polularSwitch] = [.photo,.video,.post,.space]
}


struct GetMoneyView: View {
    
    @State private var offset : CGFloat = 0
    @State private var pageIndex : Int = 0
    @ObservedObject var vm = GetMoneyViewModule.shared
    
    var body: some View {
        
        
        
        VStack(spacing:0){
            invitebanner
            
     

        }
        .frame(width: SW)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Text("赞团"))
    }

    
    var invitebanner : some View {
        HStack{
            VStack(alignment: .center, spacing: 6){
                ICON(name:"share-line",fcolor:.Card,size:24)
                    .padding(.all,8)
                    .background(BlurView().opacity(0.3))
                    .clipShape(Circle())
                    .PF_Leading()
                
                
                Text("赞团团长计划")
                    .PF_Leading()
                    .mFont(style: .Title_17_R,color: .Card)
                Text("邀请成功，终身分佣金")
                    .PF_Leading()
                    .mFont(style: .largeTitle_24_B,color: .Card)
                Text("构建你的赞团，当赞团成员领取任务并获得奖励，你也将获得该奖励服务费的20%。")
                    .PF_Leading()
                    .mFont(style: .Title_17_R,color: .Card)
                Text("扩充你的赞团")
                    .mFont(style: .Body_15_B,color: .Card)
                    .padding(.horizontal,24)
                    .padding(.vertical,12)
                    .background(BlurView().opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
                    .padding(.top,24)
            }
        }
        .padding(.all,24)
        .background(LinearGradient(gradient: Gradient(colors: [.MainColor, Color.init(hex: "E80CB5")]), startPoint: .bottomLeading, endPoint: .topTrailing))
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .PF_Shadow(color: .fc1, style: .s700)
        .padding(.all,24)
    }
    
    
    @ViewBuilder
    var mainViews : some View {
        HStack(spacing: 0) {
            Group {
                PolularPhoto()
                PolularVideo()
                PolularPost()
                PolularSpace()
            }
            .frame(width: SW)
            .onChange(of: offset) { value in
                self.pageIndex = Int(floor(offset + 0.5) / SW)
            }
        }
    }
}

struct PolularView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(uistate: UIState.init(tabbarIndex: .light))
    }
}



