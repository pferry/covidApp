//
//  NavigationMenuView.swift
//  Covid app
//
//  Created by Pierre Ferry on 6/25/21.
//

import SwiftUI

struct Menu: View {
    var title: String
    @Binding var showMenu: Bool
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center))
        {
            Rectangle()
                .fill(Color(red: 0.32157, green: 0.47451, blue: 0.89412, opacity: 1)) //Menu Blue
                .frame(height: 50)
            
            
            HStack {
                Button(action: {
                                    withAnimation {
                                        showMenu.toggle()
                                    }
                }) {
                    
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 3) {
                        Rectangle()
                            .frame(width: 18, height: 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Rectangle()
                            .frame(width: 18, height: 2, alignment: .center)
                        Rectangle()
                            .frame(width: 18, height: 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                }
                    .padding(12)
                    .foregroundColor(.white)
                Text(title)
                    .font(Font.custom("roboto-bold", size: 20))
                    .foregroundColor(.white)
            }
        }
    }
}

struct NavigationMenuView: View {
    @Binding var showMenu: Bool
    @Binding var activeView: String
    
    var body: some View {
        GeometryReader { geometry in
            HStack (spacing: 0){
                ZStack{
                    Rectangle()
                        .fill(Color(red: 0.32157, green: 0.47451, blue: 0.89412, opacity: 1))
                   
                    //Menu page
                    VStack(alignment: .leading, spacing: 16) {
                        //Cross
                        Button(action: {
                                            withAnimation {
                                                showMenu.toggle()
                                            }
                        }){
                            ZStack{
                            Rectangle()
                                .rotation(Angle(degrees: 45))
                                .frame(width: 16, height: 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            Rectangle()
                                .rotation(Angle(degrees: -45))
                                .frame(width: 16, height: 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            }
                                .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(16)
                        }
                        //Page list
                        VStack(alignment: .leading, spacing: 16){
                            
                            Button(action: {
                                                withAnimation {
                                                    activeView = "CovidStats"
                                                    showMenu.toggle()
                                                }
                            }){
                                Text("Covid Stats").font(Font.custom("roboto", size: 20))
                            }
                            
                            Button(action: {
                                                withAnimation {
                                                    activeView = "About"
                                                    showMenu.toggle()
                                                }
                            }){
                                Text("About").font(Font.custom("roboto", size: 20))
                            }
                        }
                            .padding(32)
                        
                        Divider()
                            .background(Color.white)
                        Spacer()
                    }.foregroundColor(.white)
                    //Shadow overlay
                }
                Rectangle()
                    .fill(Color(red: 0, green: 0, blue: 0, opacity: 0.0))
                    .frame(maxWidth: geometry.size.width * 0.20)
            }
        }
    }
}

struct NavigationMenuView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationMenuView(showMenu: .constant(true),activeView: .constant("CovidStats"))
    }
}
