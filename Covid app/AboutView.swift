//
//  AboutView.swift
//  Covid app
//
//  Created by Pierre Ferry on 6/27/21.
//

import SwiftUI

struct AboutView: View {
    @Binding var showMenu : Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                VStack(alignment: .center, spacing: 0) {
                    Menu(title: "About", showMenu: $showMenu)
                    ZStack (alignment: Alignment(horizontal: .center, vertical: .top))
                    {
                    Text("This is my about view")
                    }.frame(minWidth: geometry.size.width, minHeight: geometry.size.height)
                    .background(Color(red: 0.87059, green: 0.87059, blue: 0.87059, opacity: 1)) //backgroundGray
                    
                }.zIndex(0)
                
            
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(showMenu: .constant(false))
    }
}
