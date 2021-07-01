//
//  ViewController.swift
//  Covid app
//
//  Created by Pierre Ferry on 6/28/21.
//

import UIKit

class ViewController: UIViewController{
    
    let urlString = "https://coronavirusapi-france.vercel.app/AllDataByDate?date=2021-03-15"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDayData(day: "")
    }
 
    func fetchDayData(day: String){
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _ , error in
            guard let data = data, error == nil else {
                print("error")
                return
            }
            print("got data")
        }
    }
    
}

