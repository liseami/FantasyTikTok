//
//  TimeLineView.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/5.
//

import SwiftUI
import FantasyUI

class TaskViewModule : ObservableObject{
    static let shared  = TaskViewModule()
    
    
    enum polularSwitch:MTPageSegmentProtocol {
        case photo
        case video
        case post
        case space

        var showText: String{
            switch self {
            case .photo:
                    return "粉丝+"
            case .video:
                    return "互关"
            case .post:
                    return "暖场"
            case .space:
                    return "赏金"
            }
        }
    }
    
    @Published var polularTab : polularSwitch = .photo
    var tabitems : [polularSwitch] = [.photo,.video,.post,.space]
}



struct HomeTaskView: View {
    
    @State private var offset : CGFloat = 0
    @State private var pageIndex : Int = 0
    
    @ObservedObject var uistate = UIState.shared
    @ObservedObject var vm = TaskViewModule.shared
    
    let str = randomString(Int.random(in: 12...140))
    
    var body: some View {
        
        
        
        VStack(spacing:0){
            MT_PageSegmentView(titles: vm.tabitems, offset: $offset)
            //Text("\(Int(floor(offset + 0.5) / ScreenWidth()))")
            MT_PageScrollowView(offset: $offset) {
                mainViews
            }
        }
        .frame(width: SW)
        .navigationBarTitleDisplayMode(.inline)
        .PF_Navitop(style: .large,showDivider: false) {
            Color.BackGround
        } TopCenterView: {
            Image("logo")
                .resizable()
                .scaledToFill()
                .frame(width: 28, height: 28)
        }


        
        
    }
    
    @ViewBuilder
    var mainViews : some View {
        HStack(spacing: 0) {
            Group {
                ScrollView {
                    LazyVStack {
                        Spacer().frame(width: 1, height: 1)
                        ForEach(0..<12){ index in
                            TaskRaw(taskbounty: Double.random(in: 0...100), task: "关注任务", postcontent: str)
                        }
                        Spacer().frame(width: 1, height: 80)
                    }
                    .padding(.all,12)
                }
                
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

struct TimeLineView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
