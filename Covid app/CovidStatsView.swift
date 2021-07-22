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
    @ObservedObject var displayData : displayData

    @State var day = Date().dayBefore
    
    let urlString = "https://coronavirusapi-france.vercel.app/AllDataByDate?date=2021-03-15"
    
    
    var body: some View {
        
        ZStack{
            GeometryReader { geometry in
                VStack(alignment: .center, spacing: 0) {
                    Menu(title: "Covid Stats", showMenu: $showMenu)
                    ZStack (alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                        ScrollView {
                            VStack {
                                StatPanel(title: "Hospitalisés", metric: $displayData.today.hospitalises, lastWeek: $displayData.sevenDay.hospitalises)
                                    .padding(.top, 12)
                                StatPanel(title: "Réanimation", metric: $displayData.today.reanimation, lastWeek: $displayData.sevenDay.reanimation)
                                StatPanel(title: "Entrées hospitalisation", metric: $displayData.today.nouvellesHospitalisations, lastWeek: $displayData.sevenDay.nouvellesHospitalisations)
                                StatPanel(title: "Entrées réanimation", metric: $displayData.today.nouvellesReanimations, lastWeek: $displayData.sevenDay.nouvellesReanimations)
								Rectangle()
									.fill(Color.white.opacity(0.0))
									.frame(minHeight:50)
                            
                            }.frame(maxWidth: .infinity,minHeight: geometry.size.height)
                        }.background(Color(red: 0.87059, green: 0.87059, blue: 0.87059, opacity: 1)) //backgroundGray
                        DatePicker(displayData: displayData)
                    }
                }.edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}


struct DatePicker: View {
    @State private var day = Date().dayBefore
	@ObservedObject var displayData : displayData
	
	let dateFormatter = DateFormatter()
    
    init(displayData : displayData){
        dateFormatter.dateFormat = "dd/MM/YYYY"
		self.displayData = displayData
    }
    

    var body: some View{
        ZStack{
            Rectangle()
                .fill(Color(red: 0.97647, green: 0.81569, blue: 0.57647, opacity: 1)) //backgroundGray
                .frame(maxHeight: 44)
            HStack{
                ZStack{
					Button(action: {
										withAnimation {
											day = day.dayBefore
											do {
												try fetchData(displayData: displayData, day: day)
											}
											catch {
												print("An error occured while fetching data")
											}
										}
					}){
					
					Rectangle()
                        .fill(Color(red: 0, green: 0, blue: 0, opacity: 0)) //backgroundGray
                        .frame(maxWidth: 62, maxHeight: 44)
					}
					Image("Arrow").rotationEffect(.degrees(180))
                }
                Text("\(dateFormatter.string(from: day))")
                    .font(Font.custom("roboto", size: 20))
                ZStack{
					Button(action: {
										withAnimation {
											day = day.dayAfter
											do {
												try fetchData(displayData: displayData, day: day)
											}
											catch {
												print("An error occured while fetching data")
											}
										}
					}){
                    Rectangle()
                        .fill(Color(red: 0, green: 0, blue: 0, opacity: 0)) //backgroundGray
                        .frame(maxWidth: 62, maxHeight: 44)
					}
                    Image("Arrow")
                }
            }
        }
    }
}


struct StatPanel: View {
    var title: String
    @Binding var metric: NSInteger
    @Binding var lastWeek: NSInteger
    
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
                        .fill(evolution(today: metric, sevenDays: lastWeek) <= 0 ? Color.green : Color.red)
                        .frame(width: 28, height: 28)
                    Text("\(evolution(today: metric, sevenDays: lastWeek))%")
                        .font(Font.custom("roboto-bold", size: 28))
                    Spacer()
                }.frame(width: 258)
                Spacer()
            }
        }.frame(width: 258, height: 192)
        .padding(12)
    }
    
    func evolution (today: Int, sevenDays: Int) -> Int{
        print("metric : \(today) evolution: \(sevenDays)")
        if sevenDays == 0 {
            return 0
        } else {
            print("compute : \((today - sevenDays) / sevenDays * 100)")
            return Int(Double(today - sevenDays) / Double(sevenDays) * 100)
        }
    }
 }
    


struct CovidStatsView_Previews: PreviewProvider {
    static var previews: some View {
        CovidStatsView(showMenu: .constant(false), displayData: displayData(), day: Date().dayBefore)
        //StatPanel(title: "Toto", metric: 23, evolution: 12)
    }
}



