//
//  MyOrderViewModel.swift
//  MyCtStoreOrderAPIWithMVVM
//
//  Created by Santosh dudhat on 22/05/22.
//

import Foundation
final class CountryViewModel {
    private var arrOfCountry: [Population] = []
    var webServices: Webservices = Webservices()
    init() {
        
    }
    
    func numberOfRowInSection() -> Int { return arrOfCountry.count }
    
    func loadCountry(complition: @escaping (Bool, String) -> Void) {
        webServices.requestGETURL(url: "https://datausa.io/api/data?drilldowns=Nation&measures=Population", method: .get, parameters: [:], headers: nil) { responseData, responseStatusCode, responseJSON in
            if responseStatusCode == 200 {
                complition(true, "")
                let decoder = JSONDecoder()
                do {
                    let responseObject = try decoder.decode(NationPopulation.self, from: responseData)
                    self.arrOfCountry = responseObject.detailsOfCountry
                    if self.arrOfCountry.count != 0 {
                        complition(true, "")
                    } else {
                        complition(false, "Data nathi")
                    }
                } catch {
                    complition(false, "API decode thay nathi")
                }
            } else {
                complition(false, "kak mistake thay fari thi try karo")
            }
        } failure: { error in
            print(error.localizedDescription)
            complition(false, error.localizedDescription)
        }
        
    }
    
}

