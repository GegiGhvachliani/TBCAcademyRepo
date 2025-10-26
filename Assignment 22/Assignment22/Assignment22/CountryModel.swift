////
////  CountryModel.swift
////  Assignment22
////
////  Created by Gegi Ghvachliani on 25.10.25.
////
//
//
//struct CountryModel: Decodable {
//    var name: Name
//    var currencies: Currency
//    var capital: [String]
//    var altSpellings: [String]
//    var maps: Map
//    var continents: [String]
//    var flags: Flag
//    
//    enum CodingKeys: String, CodingKey {
//        case name
//        case currencies = "currecny"
//        case capital
//        case altSpellings = "spelling"
//        case maps = "mapLinks"
//        case continents = "continent"
//        case flags = "flag"
//        
//    }
//}
//
//struct Name: Decodable {
//    var common: String
//    var nativeName: NativeName
//    
//    enum CodingKeys: String, CodingKey {
//        case common = "OfficialName"
//        case nativeName
//    }
//}
//
//struct NativeName: Decodable {
//    var kat: Kat
//}
//
//struct Kat: Decodable {
//    var common: String
//    
//    enum CodingKeys: String, CodingKey {
//        case common = "nativeName"
//    }
//}
//
//struct Currency: Decodable {
//    var GEL: GEL
//}
//
//struct GEL: Decodable {
//    var symbol: String
//    var name: String
//    
//    enum CodingKeys: String, CodingKey {
//        case name = "symbolTitle"
//        case symbol
//    }
//}
//
//struct Map: Decodable {
//    var googleMaps: String
//    var openStreetMaps: String
//}
//
//struct Flag: Decodable {
//    var svg: String
//    var infoAboutFlag: String
//    
//    enum CodingKeys: String, CodingKey {
//        case infoAboutFlag = "alt"
//        case svg
//    }
//}
//
//
//struct CountryResponseData: Decodable {
//    var countries: [CountryModel]
//}
//
//
//  CountryModel.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 25.10.25.
//


struct CountryModel: Decodable {
    var name: Name
    var currencies: [String: Currency]?
    var capital: [String]?
    var altSpellings: [String]?
    var maps: Map?
    var continents: [String]?
    var flags: Flag?
}

struct Name: Decodable {
    var common: String
    var nativeName: [String: NativeName]?
}

struct NativeName: Decodable {
    var official: String
    var common: String
}

struct Currency: Decodable {
    var symbol: String?
    var name: String
}

struct Map: Decodable {
    var googleMaps: String?
    var openStreetMaps: String?
}

struct Flag: Decodable {
    var svg: String?
    var alt: String?
}

// Decode as array:
typealias CountryResponseData = [CountryModel]
