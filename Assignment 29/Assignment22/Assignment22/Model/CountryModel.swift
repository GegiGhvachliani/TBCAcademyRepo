struct Country: Decodable {
    var name: Name
    var currency: [String: Currency]?
    var capital: [String]?
    var spelling: [String]?
    var mapLink: Map
    var continent: [String]?
    var flag: Flag
    
    enum CodingKeys: String, CodingKey {
        case name
        case currency = "currencies"
        case capital
        case spelling = "altSpellings"
        case mapLink = "maps"
        case continent = "continents"
        case flag = "flags"
    }
    
    struct Name: Decodable {
        var common: String
        var nativeName: [String: NativeName]?
        
        
        struct NativeName: Decodable {
            var official: String
            var common: String
        }
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
        var png: String?
        var alt: String?
    }
}


typealias CountryResponseData = [Country]
