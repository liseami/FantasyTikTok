//
//  PushTaskSheet.swift
//  FantasyTikTok
//
//  Created by 赵翔宇 on 2022/1/10.
//

import SwiftUI
 

struct PushTaskSheet: View {
    var body: some View {
        VStack(spacing:0){
            PushTaskSheetRow(title: "点赞任务",subline: "助力上热门", iconnmae: "user-heart-line",color:.MainColor){}
            PushTaskSheetRow(title: "粉丝+",subline: "快速提升粉丝量",iconnmae: "team-line",color:.Warning){}
            PushTaskSheetRow(title: "暖场任务",subline: "短时间内引爆直播间", iconnmae: "emotion-2-line",color:.Purple){}
            PushTaskSheetRow(title: "互相关注",subline: "友好可信，数据可查",iconnmae: "parent-line",color:.Success){}
        }
        .background(Color.Card)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .PF_Shadow(color: .fc1, style: .s600)
        .padding(.all,12)
    }
}

struct PushTaskSheet_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            
            Color.black.opacity(0.3).ignoresSafeArea()
            PushTaskSheet()
        }
    
            
    }
}


struct PushTaskSheetRow : View {
    
    let title : String
    let subline : String
    let iconnmae : String
    let color : Color
    let action : ()->()
    
    
    var body: some View{
        
        Button {
            madasoft()
            action()
        } label: {
            HStack(alignment: .top, spacing:12){
                ICON(name: iconnmae,fcolor: color, size: 28)
                VStack(alignment: .leading, spacing: 4){
                    Text(title)
                        .mFont(style: .Title_17_B,color: color)
                    Text(subline)
                        .mFont(style: .Body_15_R,color: .fc2)
                }
                Spacer()
            }
            .padding(.horizontal,24)
            .padding(.vertical,16)
            .overlay(Rectangle().frame( height: 0.5).foregroundColor(.fc3.opacity(0.3)),alignment:.bottom)
        }

       
        
    }
}
