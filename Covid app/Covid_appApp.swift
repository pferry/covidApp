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
    @ObservedObject var appData = displayData()

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
    init() {
        do {
			try fetchData(displayData: appData, day: Date().dayBefore)
        }
        catch {
            print("An error occured while fetching data")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                if activeView == "CovidStats"{
                    CovidStatsView(showMenu: $showMenu, displayData: appData, day: Date().dayBefore).zIndex(0)
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
    
    
    
    
  /*  func fetchData(day: Date) throws {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"

        let urlString = "https://coronavirusapi-france.vercel.app/AllDataByDate?date=" + dateFormatter.string(from: day)
        let urlString7d = "https://coronavirusapi-france.vercel.app/AllDataByDate?date=" + dateFormatter.string(from: day.dayLastWeek)

        
        guard let url = URL(string: urlString) else {
            throw MyError.runtimeError("bad url")
        }
        print(url)
        
        URLSession.shared.dataTask(with: url) { data, _ , error in
            if let data = data {
                do {
                let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
                    // we have good data – reduce the numbers to give the right format
                    print("decode is fine")
                    let reducedResponse = decodedResponse.allFranceDataByDate.reduce(shortDataPoint(day: day)) { Result, dPoint in
                        var compute = shortDataPoint(day: day)
                        if dPoint.code.contains("REG") {
                            return Result
                        }
                        compute.hospitalises = dPoint.hospitalises + Result.hospitalises
                        compute.reanimation = dPoint.reanimation + Result.reanimation
                        compute.nouvellesHospitalisations = dPoint.nouvellesHospitalisations + Result.nouvellesHospitalisations
                        compute.nouvellesReanimations = dPoint.nouvellesReanimations + Result.nouvellesReanimations
                        compute.deces = dPoint.deces + Result.deces
                        compute.gueris = dPoint.gueris + Result.gueris
                        return compute
                    }
                    print(reducedResponse.reanimation)
                    // everything is good, so we can exit
                    DispatchQueue.main.async {
                        // update our UI
                        self.appData.today = reducedResponse
                    }
                }
                catch {
                    print(error)
                }
            }
        }.resume()
        
        guard let url7d = URL(string: urlString7d) else {
            throw MyError.runtimeError("bad url")
        }
        print(url)
        
        URLSession.shared.dataTask(with: url7d) { data, _ , error in
            if let data = data {
                do {
                let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
                    // we have good data – reduce the numbers to give the right format
                    print("decode is fine")
                    let reducedResponse = decodedResponse.allFranceDataByDate.reduce(shortDataPoint(day: day)) { Result, dPoint in
                        var compute = shortDataPoint(day: day)
                        if dPoint.code.contains("REG") {
                            return Result
                        }
                        compute.hospitalises = dPoint.hospitalises + Result.hospitalises
                        compute.reanimation = dPoint.reanimation + Result.reanimation
                        compute.nouvellesHospitalisations = dPoint.nouvellesHospitalisations + Result.nouvellesHospitalisations
                        compute.nouvellesReanimations = dPoint.nouvellesReanimations + Result.nouvellesReanimations
                        compute.deces = dPoint.deces + Result.deces
                        compute.gueris = dPoint.gueris + Result.gueris
                        return compute
                    }
                    print(reducedResponse.reanimation)
                    // everything is good, so we can exit
                    DispatchQueue.main.async {
                        // update our UI
                        self.appData.sevenDay = reducedResponse
                    }
                }
                catch {
                    print(error)
                }
            }
        }.resume()
    }*/
}
