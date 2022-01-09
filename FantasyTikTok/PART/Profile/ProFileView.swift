//
//  Message.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/5.
//

import SwiftUI


class ProFileViewVM : ObservableObject{
    static let shared  = ProFileViewVM()
    
    
    enum messageSwitch:MTPageSegmentProtocol {
        case message
        case notice
        case mentions

        var showText: String{
            switch self {
            case .message:
                    return "私信"
            case .notice:
                    return "通知"
            case .mentions:
                    return "@提及"
            }
        }
    }
    
    @Published var messageTab : messageSwitch = .message
    var tabitems : [messageSwitch] = [.message,.notice,.mentions]
}


struct ProFileView: View {
    
 
    
    @ObservedObject var vm = ProFileViewVM.shared
    @State private var offset : CGFloat = 0
    @State private var pageIndex : Int = 0
    
    @Namespace var tabanimation
    var body: some View {
        
        
         
        PF_OffsetScrollView(offset: $offset, content: {
            VStack(alignment: .center, spacing: 24) {
                cashCard
                    .padding(.horizontal,24)
                
                
                VStack(spacing:24){
                    
                    profiletask
                   
                    
                    
                    balance
                
                    Rectangle()
                        .frame( height: 1)
                        .foregroundColor(.back1)
                        .padding(.horizontal,24)
                    
                    
                    mydouzan
                   
                    Rectangle()
                        .frame( height: 1)
                        .foregroundColor(.back1)
                        .padding(.horizontal,24)
                    
                    
                    toolbox
                    
                    
                    
                }
                .padding(.vertical,24)
                .background(Color.Card)
        
                
               
               
            }
            .padding(.top,24)
       
          
        })
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Text("Username"))
        .PF_Navitop(style: self.offset < -6 ? .large : .none, backgroundView: {
            BlurView()
        }, TopCenterView: {
        })
      
    
    }
    
    var toolbox : some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("自媒体工具箱")
                .PF_Leading()
                .mFont(style: .Title_17_B,color: .fc1)
            let w = SW / 5
            let columns =
            Array(repeating:GridItem(.fixed(w), spacing: 12), count: 4)
            
                     LazyVGrid(columns: columns, spacing: 12) {
                         ForEach(0 ..< 8) { item in
                             VStack{
                                 ICON(name:"arrow-up-circle-line",fcolor:.MainColor,size:32)
                                     .padding(.all,12)
                                     .background(Color.back1)
                                     .clipShape(Circle())
                                    Text("工具")
                                     .mFont(style: .Body_13_R,color: .fc1)
                             }
                            
                         }
                     }
        }
        .padding(.horizontal,24)
    }
    
    
    var mydouzan : some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("我的抖赞")
                .PF_Leading()
                .mFont(style: .Title_17_B,color: .fc1)
            let w = SW / 5
            let columns =
            Array(repeating:GridItem(.fixed(w), spacing: 12), count: 4)
            
                     LazyVGrid(columns: columns, spacing: 12) {
                         ForEach(0 ..< 8) { item in
                             VStack{
                                 ICON(name:"arrow-up-circle-line",fcolor:.MainColor,size:32)
                                     .padding(.all,12)
                                     .background(Color.back1)
                                     .clipShape(Circle())
                                    Text("我报名的")
                                     .mFont(style: .Body_13_R,color: .fc1)
                             }
                            
                         }
                     }
        }
        .padding(.horizontal,24)
    }
    var profiletask : some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing:12){
                Spacer().frame(width: 12)
                HStack{
                    ICON(name:"checkbox-multiple-line",fcolor:.Card,size:24)
                    VStack(alignment: .leading, spacing: 4){
                        Text("补填邀请码")
                            .mFont(style: .Title_17_B,color: .Card)
                        Text("轻松领取2000赞铜板")
                            .mFont(style: .Body_15_R,color: .Card)
                    }
                Spacer()
                }
                .padding(.all,12)
                .background(Color.Info)
                .frame(width: SW * 0.7)
                .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                
                HStack{
                    ICON(name:"checkbox-multiple-line",fcolor:.Card,size:24)
                    VStack(alignment: .leading, spacing: 4){
                        Text("邀请朋友")
                            .mFont(style: .Title_17_B,color: .Card)
                        Text("轻松领取2000赞铜板")
                            .mFont(style: .Body_15_R,color: .Card)
                    }
                Spacer()
                }
                .padding(.all,12)
                .background(Color.Info)
                .frame(width: SW * 0.7)
                .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                Spacer().frame(width: 12)
                
            }
        }
    }
    
    var balance : some View {
        HStack{
            HStack{
                ICON(name:"logo",fcolor:.MainColor,size:16)
                
                Text("赞金币")
                    .mFont(style: .Body_15_R,color: .fc1)
            Spacer()
                Text(Double.random(in: 0...1000).toCurrencyString)
                    .mFont(style: .Body_15_B,color: .fc1)
            }
            .padding(.horizontal,12)
            .padding(.vertical,12)
            .background(Color.Card)
            .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
            .shadow(color: .fc1.opacity(0.06), radius: 4, x: 0, y: 2)
            HStack{
                ICON(name:"logo",fcolor:.MainColor,size:16)
                
                Text("赞铜板")
                    .mFont(style: .Body_15_R,color: .fc1)
            Spacer()
                Text(Double.random(in: 0...1000).toCurrencyString)
                    .mFont(style: .Body_15_B,color: .fc1)
            }
            .padding(.horizontal,12)
            .padding(.vertical,12)
            .background(Color.Card)
            .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
            .shadow(color: .fc1.opacity(0.06), radius: 4, x: 0, y: 2)
        }
        .padding(.horizontal,24)
    }
    
    var cashCard : some View{
        VStack(spacing:0){
            VStack(spacing:0){
                HStack{
                    Text("抖赞钱包")
                        .PF_Leading()
                        .mFont(style: .Title_19_B,color: .MainColor)
                    Spacer()
                    ICON(name: "more-line",fcolor: .fc1,size: 16)
                }
                    .padding(.vertical,12)
                
                HStack(alignment: .top, spacing: 4){
                    Text("可提现")
                        .mFont(style: .Body_15_R,color: .fc2)
                    Text(Double.random(in: 0...120).toCurrencyString)
                        .mFont(style: .LargeTitle_22_B,color: .fc1)
                    Spacer()
                }
                .padding(.vertical,12)
                .padding(.bottom,24)
            }
            .background(Color.Card.overlay(Image("logo").resizable()
                                            .scaledToFill()
                                            .offset(x:120,y:24)))
            Rectangle()
                .frame( height: 1)
                .padding(.horizontal,-12)
                .foregroundColor(.fc3.opacity(0.1))
               
            HStack{
                Text("去做赏金任务")
                    .mFont(style: .Title_17_B,color: .Info)
                Spacer()
                ICON(name: "arrow-right-line",fcolor: .fc3,size: 16)
            }
            .padding(.vertical,12)
        }
        .padding(.horizontal,12)
            .background(Color.Card)
            .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
            .shadow(color: .fc1.opacity(0.1), radius: 12, x: 0, y: 0)
        
            
    }
    
    

}

struct InBoxView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(uistate: UIState.init(tabbarIndex: .profile))
    }
}
