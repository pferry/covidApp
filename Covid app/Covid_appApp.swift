//
//  Covid_appApp.swift
//  Covid app
//
//  Created by Pierre Ferry on 6/17/21.
//

import SwiftUI

@main
struct Covid_appApp: App {
    @State private var showMenu = false
    @State private var activeView = "CovidStats"
  /*
    func selectView (viewName: String)-> some View {
        switch viewName {
        case "CovidStats":
            CovidStatsView(showMenu: $showMenu)
        case "About":
            AboutView(showMenu: $showMenu)
        default:
            CovidStatsView(showMenu: $showMenu)
        }
    }
    */

    var body: some Scene {
        WindowGroup {
            ZStack{
                if activeView == "CovidStats"{
                    CovidStatsView(showMenu: $showMenu).zIndex(0)
                }
                if activeView == "About"{
                    AboutView(showMenu: $showMenu).zIndex(0)
                }
                if showMenu {
                    Rectangle()
                        .fill(Color(red: 0, green: 0, blue: 0, opacity: 0.12))
                        .zIndex(1)
                    NavigationMenuView(showMenu: $showMenu, activeView: $activeView)
                        .transition(.moveAndFade)
                        .zIndex(2)
                   }
            }
        }
    }
}
