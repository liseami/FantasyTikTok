//
//  PostView.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/6.
//

import SwiftUI

struct TaskRaw: View {
    let taskbounty : Double
    let task : String
    let postcontent : String
    
    
    
    var body: some View {
        
        
        HStack(alignment: .top,  spacing:12){
            
            let avatarW = SW * 0.14
            let imageW = SW - 24 - 32 - avatarW - 12
           
            Image("liseamiAvatar")
                .resizable()
                .scaledToFill()
                .frame(width: avatarW, height: avatarW)
                .clipShape(Circle())
            VStack(alignment: .leading,spacing:12){
                
                
                HStack(alignment: .center, spacing:6){
                    Text(task)
                        .mFont(style: .Title_17_B,color: .fc1)
                    Spacer()
                
                }
                
                HStack{
                    Text("赏金")
                        .mFont(style: .Body_15_R,color: .fc1)
                    Text(taskbounty.toCurrencyString)
                        .mFont(style: .Body_15_B,color: .Success)
                }
              
                
                Text("欢迎大家关注我哟～😊")
                    .mFont(style: .Body_15_R,color: .fc1)
                
                
                
                ProgressView(value: 0.5)
                
                
            
                
               
            
//              Color.red.frame(width: imageW, height: imageW)
                
                
                    
               
                
                
            }
            
            Text("去关注")
                .mFont(style: .Body_15_B,color: .white)
                .padding(.horizontal,12)
                .padding(.vertical,6)
                .background(Color.MainColor)
                .clipShape(Capsule(style: .continuous))
                .padding(.trailing,12)
           
        }
        .padding(.all,16)
        .background(Color.Card)
        .onTapGesture {
            UIState.shared.showPostDetailView = true
        }
      
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }
}

struct PostRaw_Previews: PreviewProvider {
    static var previews: some View {
        TaskRaw(taskbounty: 1, task: "订阅任务", postcontent: randomString(140))
            .previewLayout(.sizeThatFits)
        ZStack{
            Color.BackGround.ignoresSafeArea()
            TaskRaw(taskbounty: 1, task: "订阅任务", postcontent: randomString(140))
                .padding(.all,12)
        }
    }
}
