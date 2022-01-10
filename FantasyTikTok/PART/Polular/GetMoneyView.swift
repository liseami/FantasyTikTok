//
//  Polular.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/5.
//

import SwiftUI
import FantasyUI




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
        
        
        
        PF_OffsetScrollView(offset: $offset) {
            VStack(spacing:0){
                invitebanner
                
                
                desp
                
                links
          
                
                
                Spacer()
            }
        }
        .PF_Navitop(style: offset < -5 ? .large : .none, backgroundView: {
            BlurView()}, TopCenterView: {})
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Text("赞团"))
    }

    
    var links : some View{
        VStack(alignment: .leading, spacing: 12) {
            MoneyViewLinkRaw(tilte: "链接邀请 ", iconname: "share-line",color: .Blue)
            MoneyViewLinkRaw(tilte: "海报邀请", iconname: "side-bar-line",color:.Blue)
            MoneyViewLinkRaw(tilte: "下载讲解视频", iconname: "video-chat-line",color:.Blue)
        }
        .padding(.horizontal,24)
        .padding(.vertical,12)
    }
    
    var invitebanner : some View {
        HStack{
            VStack(alignment: .center, spacing: 12){
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
                    .mFont(style: .large32_B,color: .Card)
            
                HStack{
                    Text("HK3K3OP")
                    ICON(name: "share-forward-line",fcolor: .Card,size: 24)
                        .padding(.all,12)
                        .background(Color.Blue)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                }
              
                    .mFont(style: .Body_15_B,color: .Card)
                    .padding(.horizontal,4)
                    .padding(.leading,12)
                    .padding(.vertical,4)
                    .background(BlurView().opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .padding(.top,24)
            }
        }
        .padding(.all,24)
        .background(LinearGradient(gradient: Gradient(colors: [.Blue, Color.Info]), startPoint: .bottomLeading, endPoint: .topTrailing))
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .PF_Shadow(color: .fc1, style: .s600)
        .PF_Shadow(color: .fc1, style: .s800)
        .padding(.horizontal,24)
        .padding(.vertical,12)
    }
    
    var desp : some View{
        VStack(spacing:6){
            HStack(alignment: .center){
                Text("20%服务费永久分佣")
                    .mFont(style: .Title_17_B,color: .fc1)
                Spacer()
                Text("学到更多")
                    .mFont(style: .Body_15_B,color: .Blue)
            }
            Text("活动期间，邀请好友加入你的赞团(团队人数上不封顶)，好友做任务获得赏金，你就可以获得赏金中的20%作为佣金。")
                .mFont(style: .Body_15_R,color: .fc2)
        }
        .padding(.horizontal,24)
        .padding(.vertical,12)
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
        ContentView(uistate: UIState.init(tabbarIndex: .money))
    }
}





struct MoneyViewLinkRaw : View {
    let tilte : String
    let iconname : String
    let color : Color
    
    var body: some View{
        HStack{
            ICON(name: iconname,fcolor: color,size: 24)
                .padding(.all,12)
                .background(color.opacity(0.1))
                .clipShape(Circle())
            Text(tilte)
                .mFont(style: .Body_15_B,color: color)
            Spacer()
            ICON(name: "arrow-right-line",fcolor: color,size: 16)
        }
        .padding(.vertical,8)
        .padding(.horizontal,12)
        .background(color.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        
    }
}
