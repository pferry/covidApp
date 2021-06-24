//
//  CovidStatsView.swift
//  Covid app
//
//  Created by Pierre Ferry on 6/17/21.
//

import SwiftUI

struct CovidStatsView: View {
    var body: some View {
        VStack{
            NavigationView {
                Text("Hello, World!")
                    .navigationTitle("Navigation")
            }
            GeometryReader { geometry in
                        Text("Hello!")
                            .frame(
                                width: geometry.size.width,
                                height: geometry.size.height
                            ).background(Color.red)
                    }
        }
    }
}

struct StatPanel: View {
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
                Text("Deaths")
                    .font(Font.custom("roboto", size: 20))
                    .padding(8)
                    .padding(.leading, 8)
                    .padding(.top, 8)
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                    Text("3620")
                        .font(Font.custom("roboto-bold", size: 28))
                }.frame(width: 258)
                Text("VS a Week ago")
                    .padding(8)
                    .padding(.leading, 8)
                    .font(Font.custom("roboto", size: 20))
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                    Text("- 24%")
                    .font(Font.custom("roboto-bold", size: 28))
                }.frame(width: 258)
                Spacer()
            }//.frame(width: 258, height: 192)
        }.frame(width: 258, height: 192)
        
    }
}


struct CovidStatsView_Previews: PreviewProvider {
    static var previews: some View {
        //CovidStatsView()
        StatPanel()
    }
}
