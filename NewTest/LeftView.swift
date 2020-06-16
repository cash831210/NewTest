//
//  Home.swift
//  NewTest
//
//  Created by 莊鎧旭 on 2020/6/9.
//  Copyright © 2020 Cash. All rights reserved.
//

import SwiftUI

struct  LeftView: View {
    
    @State var isShowMenu = false
    
    var body: some View {
        ZStack {
            Button("Open Menu") {
                self.isShowMenu.toggle()
            }
            MenuView(isShow: $isShowMenu)
        }
    }
    
}

#if DEBUG
struct LeftView_Previews: PreviewProvider {
    static var previews: some View {
        LeftView()
    }
}
#endif


struct MenuRowView: View {
    
    var image = ""
    var text = ""
    
    var body: some View {
        HStack() {
            Image(systemName: image)
                .frame(width: 30, height: 30, alignment: .center)
                .imageScale(.large)
                .foregroundColor(Color.green)
            Text(text)
            Spacer()
        }
    }
}

//

struct Menu: Identifiable {
    var id = UUID()
    var image = ""
    var text = ""
}

let menuData: [Menu] = [Menu(image: "star.fill", text: "AAA"), Menu(image: "star.fill", text: "BBB"), Menu(image: "star.fill", text: "CCC"), Menu(image: "star.fill", text: "DDD"),]

struct MenuView: View {
    
    @Binding var isShow: Bool
    
    var data = menuData
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(menuData){
                item in MenuRowView(image: item.image, text: item.text)
                
            }
            Spacer()
        }
        .padding(.top, 10)
        .padding(30)
        .background(Color.gray)
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding(.trailing, 50)
        .offset(x: isShow ? 0 : -UIScreen.main.bounds.width)
        .animation(.default)
        .onTapGesture {
            self.isShow.toggle()
        }
    }
}
