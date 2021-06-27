//
//  CovidStatsView.swift
//  Covid app
//
//  Created by Pierre Ferry on 6/17/21.
//

import SwiftUI


extension AnyTransition {
    static var moveAndFade: AnyTransition {
        return AnyTransition.move(edge: .leading)
            .combined(with: .opacity)
         }
}

struct CovidStatsView: View {
    
    @Binding var showMenu : Bool
    
    var body: some View {
        
        ZStack{
            GeometryReader { geometry in
                VStack(alignment: .center, spacing: 0) {
                    Menu(title: "Covid Stats", showMenu: $showMenu)
                    ScrollView {
                        VStack {
                            StatPanel(title: "Metric1", metric: 23, evolution: 12)
                                .padding(.top, 12)
                            StatPanel(title: "Metric2", metric: 32, evolution: -10)
                            StatPanel(title: "Metric3", metric: 12, evolution: 8)
                        
                        }.frame(maxWidth: .infinity,minHeight: geometry.size.height - 50)
                    }
                    .background(Color(red: 0.87059, green: 0.87059, blue: 0.87059, opacity: 1)) //backgroundGray
                    
                }.edgesIgnoringSafeArea(.bottom)
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
                    Spacer()
                    Circle()
                        .fill(evolution < 0 ? Color.green : Color.red)
                        .frame(width: 28, height: 28)
                    Text("\(evolution)%")
                        .font(Font.custom("roboto-bold", size: 28))
                    Spacer()
                }.frame(width: 258)
                Spacer()
            }
        }.frame(width: 258, height: 192)
        .padding(12)
    }
}


struct CovidStatsView_Previews: PreviewProvider {
    static var previews: some View {
        CovidStatsView(showMenu: .constant(false))
        //StatPanel(title: "Toto", metric: 23, evolution: 12)
    }
}
