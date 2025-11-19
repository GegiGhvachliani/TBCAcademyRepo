import UIKit

struct News {
    let image: UIImage
    let newsTitle: String
    let newsDescription: String
    
    static var all: [News] = [
        News(image: UIImage(named: "calculator")!, newsTitle: "New Calculator App", newsDescription: "Price for calculators drop as new calculator application is in development"),
        News(image: UIImage(named: "chat")!, newsTitle: "Next Assignment Hinted", newsDescription: "Anzori hinted next assignment, Tamar is not happy, Lasha keeps gambling"),
        News(image: UIImage(named: "cartoon")!, newsTitle: "TBC Gandzi, Bog ...", newsDescription: "Banking Giants")
    ]
}


