//
//  Tabbar.swift
//  Fantline
//
//  Created by Liseami on 2021/12/14.
//

import SwiftUI

struct Tabbar: View {
    @ObservedObject var uistate = UIState.shared
    
    var body: some View {
            
            HStack{
                ForEach(uistate.tabbarItem,id: \.self){ tabitem in
                    let selected = tabitem == uistate.TabbarIndex
                    let iconname = tabitem.iconname
                    Button {
                        if tabitem == .pushTask{
                            uistate.showPushTaskSheet = true
                        }else{
                            uistate.TabbarIndex = tabitem
                        }
                    } label: {
                        Rectangle()
                      .hidden()
                      .overlay(
                        VStack(spacing:2){
                            ICON(name: selected ? iconname + ".selected" : iconname ,
                                 fcolor: selected ?  .fc1 : .fc2,
                                        size: 28)
                            Text(tabitem.title)
                                .mFont(style: .Caption_9_R,color: selected ?  .fc1 : .fc2)
                        }
                      )
                    }
                }
            }
            .padding(.horizontal,16)
            .background(
                ZStack{
                    Color.back1.opacity(0.3).ignoresSafeArea()
                    BlurView().ignoresSafeArea()
                }
                )
            .frame( height: GoldenH + 8, alignment: .center)
            .overlay(Divider().background(Color.fc2).opacity(0.3),alignment: .top)
            .overlay(
            ProgressView.init(value:uistate.TabbarProgress )
                .progressViewStyle(LinearProgressViewStyle(tint: Color.MainColor))
                .frame(height: 0.5)
                .ifshow(uistate.TabbarProgress != 0),alignment: .top)
            .background(Color.Card.ignoresSafeArea())
        
        .MoveTo(.bottomCenter)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }

}
