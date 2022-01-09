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
            
            VStack(spacing:0){
                
                
                HStack{
                    Text("抖赞钱包")
                        .PF_Leading()
                        .mFont(style: .Title_17_B,color: .MainColor)
                    Spacer()
                    ICON(name: "more-line",fcolor: .fc3,size: 16)
                }
          
                    .padding(.vertical,12)
                
                HStack(alignment: .top, spacing: 4){
                    Text("可提现")
                        .mFont(style: .Body_12_R,color: .fc2)
                    Text(Double.random(in: 0...120).toCurrencyString)
                        .mFont(style: .LargeTitle_22_B,color: .fc1)
                    Spacer()
                }
                .padding(.vertical,12)
                .padding(.bottom,24)
                
                
                
                Rectangle()
                    .frame( height: 1)
                    .padding(.horizontal,-12)
                    .foregroundColor(.fc3.opacity(0.1))
                   
                HStack{
                    Text("去做赏金任务")
                        .mFont(style: .Body_13_B,color: .MainColor)
                    Spacer()
                    ICON(name: "arrow-right-line",fcolor: .fc3,size: 16)
                }
                .padding(.vertical,12)
           
            }
            .padding(.horizontal,12)
                .background(Color.Card)
                .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                .shadow(color: .fc1.opacity(0.1), radius: 12, x: 0, y: 0)
                .padding(.all,16)
        })

        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Text("Username"))
    
    }
    
    var tabbar : some View{
        VStack(spacing:12){
            HStack(spacing:24){
                ForEach(vm.tabitems,id:\.self){item in
                    let selected = item == vm.messageTab
            
                    VStack(alignment: .center, spacing: 8){
                        Text(item.showText)
                        .mFont(style: .Title_17_B,color: selected ? .fc1 : .fc2)
                        RoundedRectangle(cornerRadius: 2, style: .continuous)
                            .frame(maxWidth:44, maxHeight: 3)
                            .foregroundColor(.MainColor)
                            .ifshow(selected)
                            .matchedGeometryEffect(id: "tabanimation", in: tabanimation)
                        RoundedRectangle(cornerRadius: 2, style: .continuous)
                            .frame(maxWidth:44, maxHeight: 3)
                            .foregroundColor(.clear)
                            .ifshow(!selected)
                            
                    }
                    .onTapGesture {
                        withAnimation {
                            vm.messageTab = item
                        }
                    }
                }
                Spacer()
            }
            .padding(.horizontal,24)
            .padding(.top,24)
            .background(RoundedRectangle(cornerRadius: 2, style: .continuous)
                            .frame(maxHeight: 0.5)
                            .foregroundColor(.fc3.opacity(0.6)),alignment: .bottom)
                
        }
    }
    var message : some View {
        HStack(alignment: .center, spacing: 0) {
            HStack(alignment: .top,  spacing:12){
                Image("liseamiAvatar")
                    .resizable()
                    .scaledToFill()
                    .frame(width: SW * 0.12, height: SW * 0.12)
                    .clipShape(Circle())
               
                VStack(alignment: .leading, spacing: 6){
                    Text(randomString(3))
                        .mFont(style: .Title_17_B,color: .fc1)
                    
                    Text(randomString(Int.random(in: 0...120)))
                        .mFont(style: .Title_17_R,color: .fc2)
                }
           
                
                Spacer()
            }
            Text("12:21")
                .mFont(style: .Body_13_R,color: .fc3)
        }
           
        
    }
}

struct InBoxView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(uistate: UIState.init(tabbarIndex: .profile))
    }
}
