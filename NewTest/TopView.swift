//
//  Top.swift
//  NewTest
//
//  Created by 莊鎧旭 on 2020/6/10.
//  Copyright © 2020 Cash. All rights reserved.
//

import SwiftUI

struct TopView: View {
    
    @State var isShowMenu = false
    @State var isShowInfo = false
    
    var body: some View {
        ZStack {
            ContentView()
                .background(Color.white)
                .cornerRadius(0)
                .shadow(radius: 20)
                .offset(y : isShowInfo ? 10 : UIScreen.main.bounds.height)
                .animation(.spring())
            
            
            VStack {
                HStack(){
                    MenuLeftButton(show: $isShowMenu)
                    Spacer()
                    MenuRightButtons(show: $isShowInfo)
                }
                Spacer()
            }
            
            
        }
    }
}

#if DEBUG
struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
#endif

//

struct MenuLeftButton: View {
    
    @Binding var show : Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Button(action: {
                self.show.toggle()
            }) {
                Spacer()
                Image(systemName: "list.dash")
                .foregroundColor(Color.black)
            }
            .padding(30)
            .frame(width: 70, height: 50, alignment: .center)
            .background(Color.yellow)
            .cornerRadius(30)
            .shadow(radius: 10)
            Spacer()
        }
    }
    
}

struct CircleButton: View {
    
    var icon = "person.crop.circle"
    
    var body: some View {
        VStack{
            Image(systemName: icon)
                .foregroundColor(Color.black)
        }
        .padding(30)
        .frame(width: 50, height: 50, alignment: .center)
        .background(Color.yellow)
        .cornerRadius(30)
        .shadow(radius: 10)
    }
}


struct MenuRightButtons: View {
    
    @Binding var show : Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack() {
                Button(action: {
                    self.show.toggle()
                }) {
                    CircleButton()
                }
                Button(action: {
                    self.show.toggle()
                }) {
                    CircleButton(icon: "bell")
                }
            }
            .padding()
            Spacer()
        }
    }
    
}


//

