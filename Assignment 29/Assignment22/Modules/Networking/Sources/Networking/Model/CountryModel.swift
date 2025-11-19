public struct Country: Decodable {
    public var name: Name
    public var currency: [String: Currency]?
    public var capital: [String]?
    public var spelling: [String]?
    public var mapLink: Map
    public var continent: [String]?
    public var flag: Flag
    
    public enum CodingKeys: String, CodingKey {
        case name
        case currency = "currencies"
        case capital
        case spelling = "altSpellings"
        case mapLink = "maps"
        case continent = "continents"
        case flag = "flags"
    }
    
    public struct Name: Decodable {
        public var common: String
        public var nativeName: [String: NativeName]?
        
        
        public struct NativeName: Decodable {
            public var official: String
            public var common: String
        }
    }
    
    public struct Currency: Decodable {
        public var symbol: String?
        public var name: String
    }
    
    public  struct Map: Decodable {
        public var googleMaps: String?
        public var openStreetMaps: String?
    }
    
    public  struct Flag: Decodable {
        public var svg: String?
        public var png: String?
        public var alt: String?
    }
}

public typealias CountryResponseData = [Country]

//public class CountryResponseData: Decodable {
//    public var countires: [Country] = []
//}
