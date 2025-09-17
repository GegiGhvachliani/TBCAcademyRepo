import UIKit

//1)შექმენით FoodGroup Enum, რომელიც მოიცავს: fruit, vegetable, protein, dairy, grain ჩამონათვალს.
//
enum FoodGroup {
    case fruit
    case vegetable
    case protein
    case dairy
    case grain
}
//2)შექმენით enum ProductStatus (გაყიდულია, ხელმისაწვდლომია ქეისებით)
//
enum ProductStatus: CaseIterable {
    case available
    case soldOut
}
//3)შექმენით სტრუქტურა Product რომელიც შეიცავს
// -ცვლადებს: name, category(FoodGroup), price, info(რომელიც ფასის და სახელის ინფოს მოგვაწვდის), ფასდაკლება, მასა, კალორია100გრამზე, ProductStatus ცვლადი
// -ფუნქციები: ფასდაკლებული ფასის ჩვენება, ყიდვა, გამოითვალე კალორია მასაზე დაყრდნობით.
//
struct Product {
    var name: String
    var category: FoodGroup
    var price: Double
    func info() {
        print("name: \(name), price: \(price) GEL/kg")
    }
    var sale: Double   // in %
    var weight: Double
    var caloryPer100: Double
    var productStatus: ProductStatus
    
    func discountedPrice() {
        print("discounted price: \((price * (1 - sale / 100)) * 100.rounded() / 100) GEL/kg")
    }
    mutating func buy(kg: Double) {
        if self.productStatus == .available {
            if kg > weight {
                print("you cannot buy \(kg) kgs. Only \(weight) kilos left \n")
            } else if kg <= weight {
                weight -= kg
                print("\nyou bought \(kg) of \(self.name). \ntotal price: \(price*kg) GEL ")
                discountedPrice()
                print("total with discounted price: \((price * (1 - sale / 100 ) * kg * 100).rounded() / 100) GEL\n")
                if kg == weight{
                    self.productStatus = .soldOut
                }
            }
        } else {
            print("product is sold out")
        }
    }
    func caloryAmoutFor(kg: Double) -> Int {
        Int(caloryPer100 * kg * 10)
    }
}

var someProduct = Product(name: "Watermelon", category: .fruit, price: 2.3, sale: 20, weight: 200, caloryPer100: 320, productStatus: .available)
someProduct.info()
someProduct.buy(kg: 4)
someProduct.buy(kg: 4000)

var totalCalory = someProduct.caloryAmoutFor(kg: 9)
print("total amount of calory: \(totalCalory)")


//4)შექმენით მასივი პროდუქტებით სადაც მინიმუმ 15 პროდუქტი გექნებათ.
//
var productArray: [Product] = [
    Product(name: "Apple", category: .fruit, price: 2.5, sale: 10, weight: 200, caloryPer100: 52, productStatus: .available),
    Product(name: "Banana", category: .fruit, price: 3.0, sale: 5, weight: 150.5, caloryPer100: 89, productStatus: .available),
    Product(name: "Tomato", category: .vegetable, price: 1.8, sale: 0, weight: 120.5, caloryPer100: 18, productStatus: .available),
    Product(name: "Potato", category: .vegetable, price: 2.4, sale: 15, weight: 300.5, caloryPer100: 77, productStatus: .available),
    Product(name: "Carrot", category: .vegetable, price: 1.5, sale: 0, weight: 100, caloryPer100: 41, productStatus: .available),
    Product(name: "Chicken Breast", category: .protein, price: 12.0, sale: 20, weight: 500, caloryPer100: 165, productStatus: .available),
    Product(name: "Beef", category: .protein, price: 18.3, sale: 10, weight: 400, caloryPer100: 250, productStatus: .available),
    Product(name: "Eggs", category: .protein, price: 5.2, sale: 0, weight: 60, caloryPer100: 155, productStatus: .available),
    Product(name: "Milk", category: .dairy, price: 4.1, sale: 5, weight: 1000.5, caloryPer100: 42, productStatus: .available),
    Product(name: "Cheese", category: .dairy, price: 15.5, sale: 10, weight: 200, caloryPer100: 402, productStatus: .available),
    Product(name: "Yogurt", category: .dairy, price: 3.5, sale: 0, weight: 150, caloryPer100: 60, productStatus: .available),
    Product(name: "Rice", category: .grain, price: 6.0, sale: 5, weight: 1000.5, caloryPer100: 130, productStatus: .available),
    Product(name: "Bread", category: .grain, price: 2.2, sale: 0, weight: 250, caloryPer100: 265, productStatus: .available),
    Product(name: "Pasta", category: .grain, price: 4.5, sale: 10, weight: 500, caloryPer100: 131, productStatus: .available),
    Product(name: "Oats", category: .grain, price: 7.0, sale: 5, weight: 800, caloryPer100: 389, productStatus: .available)
]
//5)მიღებული მასივისგან შექმენით ახალი მასივი სადაც მხოლოდ პროდუქტის name იქნება ჩამოწერილი
//
var productNames: [String] = productArray.map { $0.name }
//6)თავდაპირველი მასივის ელემენტები დაალაგეთ ფასის ზრდადობის მიხედვით.
//
productArray = productArray.sorted { $0.price < $1.price }
//7)რენდომ (1)კატეგორიის ყველა პროდუქტის სტატუსი შეცვალეთ ხელმისაწვდომიდან გაყიდულზე.
//
for index in 0...productArray.count - 1 {
    var randomStatus = ProductStatus.allCases.randomElement()
    productArray[index].productStatus = randomStatus!
}
//8)გაიგეთ ყველა იმ პროდუქტის ერთეულის ჯამური ღირებულება რომელიც ხელმისაწვდომია.
//
func totalCostOf(_ array: [Product]) -> Double {
    var sum: Double = 0
    array.forEach{
        if $0.productStatus == .available {
            sum += $0.price * $0.weight
        }
    }
    return sum
}
var totalCost = totalCostOf(productArray)
print("total cost of products is \(totalCost)\n")
//
//ბონუს ამოცანა
//
//შექმენით ფუნქცია რომელიც მიიღებს პროდუქტების მასივს და დააბრუნებს dictionary-ს სადაც key იქნება კატეგორიის სახელწოდება და value იქნება იმ პროდუქტების მასივი რომლებიც შეესაბამება მოცემულ კატეგორიას.
func groupByCategory(_ array: [Product]) -> [FoodGroup: [Product]] {
    var dictionary: [FoodGroup: [Product]] = [:]
    array.forEach {
        dictionary[$0.category, default: []].append($0)
    }
    return dictionary
}
var groupedByCayegory = groupByCategory(productArray)
for (category, productsArray) in groupedByCayegory{
    print("\(category):", productsArray.map{ $0.name }, separator: " ")
}

