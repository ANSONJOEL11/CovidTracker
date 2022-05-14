//
//  NetViewModel.swift
//  covidTracker



import Foundation
class NetViewModel {
    
    var countriesdecoded  = [Country]()
    var filtercountries = [Country]()
    var networkHandler = Networking()
    func viewModelResponse (url: String , completion: @escaping (Countries) -> Void ) {
        networkHandler.response(url: url) { [weak self](countries) in
            self?.countriesdecoded = countries.Countries
            completion(countries)
        }
    }
    
    func numberOfrows () -> Int {
        return countriesdecoded.count
    }
    
    func getCountryIndex(index : Int) -> Country {
       return countriesdecoded[index]
    }
    
    func countryname (index : Int ) -> String {
        return countriesdecoded[index].Country
    }
    func countryCode (index : Int ) -> String {
           return countriesdecoded[index].CountryCode
    }
    
    func filteredcountries()-> [Country]  {
       return filtercountries
    }
    
   
}
