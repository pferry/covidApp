//
//  Utils.swift
//  Covid app
//
//  Created by Pierre Ferry on 6/28/21.
//

import Foundation

enum MyError: Error {
    case runtimeError(String)
}

extension Date {
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }

    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    var dayLastWeek : Date {
        return Calendar.current.date(byAdding: .day, value: -7, to: self)!
    }
}



/*
"allFranceDataByDate": [
    {
      "code": "DEP-01",
      "nom": "Ain",
      "date": "2021-03-15",
      "hospitalises": 181,
      "reanimation": 20,
      "nouvellesHospitalisations": 11,
      "nouvellesReanimations": 2,
      "deces": 538,
      "gueris": 2247,
      "source": {
        "nom": "Santé publique France Data"
      },
      "sourceType": "sante-publique-france-data"
    },
*/

struct shortDataPoint: Codable {
    var day: String
    var hospitalises = 0
    var reanimation = 0
    var nouvellesHospitalisations = 0
    var nouvellesReanimations = 0
    var deces = 0
    var gueris = 0
    
    init(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        self.day = dateFormatter.string(from: Date().dayBefore)
    }
    
    init(day: Date){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        self.day = dateFormatter.string(from: day)
    }
}

class displayData : ObservableObject {
    @Published var sevenDay = shortDataPoint()
    @Published var today = shortDataPoint()
}

struct Response: Codable {
    var allFranceDataByDate: [dataPoint]
}

struct dataPoint: Codable {
    var code: String
    var nom: String
    var date: String
    var hospitalises: Int
    var reanimation: Int
    var nouvellesHospitalisations: Int
    var nouvellesReanimations: Int
    var deces: Int
    var gueris: Int
    var source: Sources
    var sourceType: String
}

struct Sources: Codable {
    var nom: String
}



    

