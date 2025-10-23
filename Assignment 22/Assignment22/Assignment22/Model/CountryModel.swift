import UIKit

struct CountryModel {
    let name: String
    let nativeName: String
    let spelling: String
    let capital: String
    let currencyName: String
    let currencySymbol: String
    let googleMaps: String
    let openStreetMaps: String
    let flag: String
    let flagInfo: String
    
    static let countryModels: [CountryModel] = [
        CountryModel(
            name: "Japan",
            nativeName: "日本",
            spelling: "Nippon",
            capital: "Tokyo",
            currencyName: "Japanese Yen",
            currencySymbol: "¥",
            googleMaps: "https://goo.gl/maps/7Fz7s1rRtYwzM1bW8",
            openStreetMaps: "https://www.openstreetmap.org/relation/382313",
            flag: "Japan",
            flagInfo: "A white field with a red circle in the center symbolizing the rising sun."
        ),
        CountryModel(
            name: "France",
            nativeName: "France",
            spelling: "République française",
            capital: "Paris",
            currencyName: "Euro",
            currencySymbol: "€",
            googleMaps: "https://goo.gl/maps/g7QxxSFsWyTPKuzx9",
            openStreetMaps: "https://www.openstreetmap.org/relation/2202162",
            flag: "France",
            flagInfo: "Three vertical bands of blue, white, and red."
        ),
        CountryModel(
            name: "Brazil",
            nativeName: "Brasil",
            spelling: "República Federativa do Brasil",
            capital: "Brasília",
            currencyName: "Brazilian Real",
            currencySymbol: "R$",
            googleMaps: "https://goo.gl/maps/waCKk21HeeqF1n4V9",
            openStreetMaps: "https://www.openstreetmap.org/relation/59470",
            flag: "Brazil",
            flagInfo: "Green with a yellow diamond and a blue globe showing a starry sky and the motto 'Ordem e Progresso'."
        ),
        CountryModel(
            name: "Germany",
            nativeName: "Deutschland",
            spelling: "Bundesrepublik Deutschland",
            capital: "Berlin",
            currencyName: "Euro",
            currencySymbol: "€",
            googleMaps: "https://goo.gl/maps/mD9FBMq1nvQ4c5wA8",
            openStreetMaps: "https://www.openstreetmap.org/relation/51477",
            flag: "Germany",
            flagInfo: "Three horizontal bands of black, red, and gold."
        ),
        CountryModel(
            name: "Canada",
            nativeName: "Canada",
            spelling: "Canada",
            capital: "Ottawa",
            currencyName: "Canadian Dollar",
            currencySymbol: "$",
            googleMaps: "https://goo.gl/maps/jyJfCz2vLdgLr9tW7",
            openStreetMaps: "https://www.openstreetmap.org/relation/1428125",
            flag: "Canada",
            flagInfo: "Two vertical red bands with a white square and red maple leaf in the center."
        ),
        CountryModel(
            name: "Italy",
            nativeName: "Italia",
            spelling: "Repubblica Italiana",
            capital: "Rome",
            currencyName: "Euro",
            currencySymbol: "€",
            googleMaps: "https://goo.gl/maps/Un4zY8hKxYv4Z7Pj6",
            openStreetMaps: "https://www.openstreetmap.org/relation/365331",
            flag: "Italy",
            flagInfo: "Three vertical bands of green, white, and red."
        ),
        CountryModel(
            name: "Australia",
            nativeName: "Australia",
            spelling: "Commonwealth of Australia",
            capital: "Canberra",
            currencyName: "Australian Dollar",
            currencySymbol: "$",
            googleMaps: "https://goo.gl/maps/NdGcY7A4fL2s8X9P8",
            openStreetMaps: "https://www.openstreetmap.org/relation/80500",
            flag: "Australia",
            flagInfo: "Blue field with the Union Jack and six white stars representing the Commonwealth and the Southern Cross."
        ),
        CountryModel(
            name: "Georgia",
            nativeName: "საქართველო",
            spelling: "Sakartvelo",
            capital: "Tbilisi",
            currencyName: "Georgian Lari",
            currencySymbol: "₾",
            googleMaps: "https://goo.gl/maps/A1JzYdfmXbF2",
            openStreetMaps: "https://www.openstreetmap.org/relation/28699",
            flag: "Georgia",
            flagInfo: "White with five red crosses — one large and four smaller in each quadrant."
        ),
        CountryModel(
            name: "United States",
            nativeName: "United States of America",
            spelling: "USA",
            capital: "Washington, D.C.",
            currencyName: "United States Dollar",
            currencySymbol: "$",
            googleMaps: "https://goo.gl/maps/9ge9xQ9X1Qp",
            openStreetMaps: "https://www.openstreetmap.org/relation/148838",
            flag: "United States",
            flagInfo: "Thirteen stripes and fifty stars representing the 50 states and 13 original colonies."
        ),
        CountryModel(
            name: "South Korea",
            nativeName: "대한민국",
            spelling: "Daehan Minguk",
            capital: "Seoul",
            currencyName: "South Korean Won",
            currencySymbol: "₩",
            googleMaps: "https://goo.gl/maps/7ECmUNV7dd92",
            openStreetMaps: "https://www.openstreetmap.org/relation/307756",
            flag: "South Korea",
            flagInfo: "White with a red-blue yin-yang symbol in the center and four black trigrams around it."
        )
    ]
}
