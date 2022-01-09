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
            
            let avatarW = SW * 0.1

            
            Image(String(Int.random(in: 1...12)))
                .resizable()
                .scaledToFill()
                .frame(width: avatarW, height: avatarW)
                .clipShape(Circle())
        
                
            VStack(alignment: .leading,  spacing:16){
                HStack(alignment: .top, spacing:6){
                    VStack(alignment: .leading, spacing: 0){
                        Text(task)
                            .mFont(style: .Title_17_B,color: .fc1)
                        Text("@lismemia")
                            .mFont(style: .Body_15_R,color: .fc2)
                    }
                   
                    Spacer()
                    HStack(alignment: .center){
                        Text("赏金")
                            .mFont(style: .Body_15_R,color: .fc2)
                        Text(taskbounty.toCurrencyString)
                            .mFont(style: .Title_17_B,color: .MainColor)
                    }
                   
                }
                
                VStack(alignment: .leading, spacing:4){
                    ProgressView(value: Double.random(in: 0...1))
                        .accentColor(.MainColor)
                    Text("已发放 \(Double.random(in: 0...1).toCurrencyString)剩余 \(Double.random(in: 0...1).toCurrencyString)")
                        .mFont(style: .Body_15_R,color: .fc2)
                }
        
                HStack{
                 
                    HStack{
                        ICON(name:"tiktok",fcolor:.white,size:16)
                        Text("去关注")
                            .mFont(style: .Body_15_B,color: .white)
                    }
                        .padding(.horizontal,12)
                        .padding(.vertical,6)
                        .background(Color.MainColor)
                        .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
                        
                    Spacer()
                }
               
                
                 
            }
            
               

//              Color.red.frame(width: imageW, height: imageW)
                
                
                
         
           
        }
        .padding(.all,16)
        .background(Color.Card)
        .onTapGesture {
            UIState.shared.showPostDetailView = true
        }
        .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
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
