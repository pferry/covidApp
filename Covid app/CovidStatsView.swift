//
//  CovidStatsView.swift
//  Covid app
//
//  Created by Pierre Ferry on 6/17/21.
//

import SwiftUI


extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct CovidStatsView: View {
    
    @State private var showMenu = false
    
    var body: some View {
        ZStack{
            VStack(alignment: .center, spacing: 0) {
                Menu(title: "Covid Stats", showMenu: $showMenu)
                
                ScrollView {
                    VStack {
                        StatPanel(title: "Metric1", metric: 23, evolution: 12)
                            .padding(.top, 12)
                        StatPanel(title: "Metric2", metric: 32, evolution: 10)
                        StatPanel(title: "Metric3", metric: 12, evolution: 8)
                    
                    }.frame(maxWidth: .infinity)
                }
                .background(Color(red: 0.87059, green: 0.87059, blue: 0.87059, opacity: 1)) //backgroundGray
                
            }
        if showMenu {
            NavigationMenuView()
                .transition(.moveAndFade)
           }
        }
    }
}




struct StatPanel: View {
    var title: String
    var metric: NSInteger
    var evolution: NSInteger
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top))
        {
            RoundedRectangle(cornerRadius: 4.0)
                .fill(Color.white)
                .frame(width: 258, height: 192)
                .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.2),
                        radius: 3.0,
                        x: CGFloat(0),
                        y: CGFloat(1))
                .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.12),
                        radius: 1.0,
                        x: CGFloat(0),
                        y: CGFloat(2))
            VStack(alignment: .leading){
                Text(title)
                    .font(Font.custom("roboto", size: 20))
                    .padding(4)
                    .padding(.leading, 12)
                    .padding(.top, 12)
                HStack(alignment: .center){
                    Text("\(metric)")
                        .font(Font.custom("roboto-bold", size: 28))
                }.frame(width: 258)
                Text("VS a Week ago")
                    .padding(8)
                    .padding(.leading, 8)
                    .font(Font.custom("roboto", size: 20))
                HStack(alignment: .center){
                    Text("- \(evolution)%")
                        .font(Font.custom("roboto-bold", size: 28))
                }.frame(width: 258)
                Spacer()
            }
        }.frame(width: 258, height: 192)
        .padding(12)
    }
}


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
                            .frame(width: 18, height: 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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



struct CovidStatsView_Previews: PreviewProvider {
    static var previews: some View {
        CovidStatsView()
        //StatPanel(title: "Toto", metric: 23, evolution: 12)
    }
}
