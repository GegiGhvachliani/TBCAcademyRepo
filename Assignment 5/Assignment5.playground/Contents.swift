import UIKit
import Foundation

//1. შექმენით მასივი `fruits`, რომელიც შეიცავს 5 ხილის სახელს. გამოიყენეთ `forEach` მეთოდი, რომ დაბეჭდოთ თითოეული ხილის სახელი ცალ-ცალკე ხაზზე.
//
resultFor(exercise: "დავალება 1") {
    var fruits = ["ვაშლი", "მსხალი", "ატამი", "კომში", "ბანანი"]
    fruits.forEach{ fruit in print(fruit) }
}

//2. დაწერეთ ფუნქცია `filterEvenNumbers`, რომელიც იღებს Int-ების მასივს და იყენებს `filter` მეთოდს, რომ დააბრუნოს ახალი მასივი მხოლოდ ლუწი რიცხვებით. გამოიძახეთ ეს ფუნქცია სხვადასხვა მასივებზე და დაბეჭდეთ შედეგები.
//
resultFor(exercise: "დავალება 2") {
    func filterEvenNumbers(array: [Int]) -> [Int] {
        array.filter{ $0 % 2 == 0 }
    }
    var arrayOfNumbers = [1, 2, 3, 4, 5, 6, 7]
    var arrayOfNumbers1 = [11, 12, 13, 14, 15, 16, 17]
    var newArray = filterEvenNumbers(array: arrayOfNumbers)
    var newArray1 = filterEvenNumbers(array: arrayOfNumbers1)
    
    newArray.map{ print($0, terminator: " ")}
    print("\n")
    newArray1.map{ print($0, terminator: " ")}
}
//3. დაწერეთ ფუნქცია sumOfUniqueSquares, რომელიც იღებს Int-ების მასივს, გადააქცევს მას Set-ად (რომ მოაშოროს დუბლიკატები), შემდეგ იყენებს map მეთოდს ყველა ელემენტის კვადრატში ასაყვანად, და ბოლოს reduce მეთოდს ჯამის გამოსათვლელად. გამოიძახეთ ეს ფუნქცია სხვადასხვა მასივებზე და დაბეჭდეთ შედეგები.
//
resultFor(exercise: "დავალება 3") {
    func sumOfUniqueSquares(array: inout [Int]) {
        let set = Set(array).map { $0*$0 }.reduce(into: 0) { result, number in result += number }
        print(set)
    }
    var array1 = [1,2,2,3,3,4,5,6]
    var array2 = [11,11,33,23,33,14,35,56]
    sumOfUniqueSquares(array: &array1)
    sumOfUniqueSquares(array: &array2)
}
    
//4. შექმენით ორი Set fruitsA და fruitsB, რომელებიც შეიცავენ ხილების სახელებს (ზოგიერთი ხილი შეიძლება გვქონდეს ორივე სეტში). გამოიყენეთ Set-ის ოპერაციები (union, intersection, symmetricDifference) და forEach მეთოდი, რომ დაბეჭდოთ: 1) ყველა უნიკალური ხილი ორივე სეტიდან 2) ხილები, რომლებიც ორივე სეტში გვხვდება 3) ხილები, რომლებიც მხოლოდ ერთ სეტშია
//
resultFor(exercise: "დავალება 4") {
    var fruitsA: Set<String> = ["ვაშლი", "მსხალი", "ბანანი", "ატამი"]
    var fruitsB: Set<String> = ["ქლიავი", "კომში", "ბანანი", "ატამი"]
    
    var unioned = fruitsA.union(fruitsB)
    var intersectioned = fruitsA.intersection(fruitsB)
    var symetricDifferenced = fruitsA.symmetricDifference(fruitsB)
    
    print("ყველა უნიკალური ხილი ორივე სეტიდან: ")
    unioned.forEach{print($0, terminator: " ")}
    print("\n\nხილები, რომლებიც ორივე სეტში გვხვდება: ")
    intersectioned.forEach{print($0, terminator: " ")}
    print("\n\nხილები, რომლებიც მხოლოდ ერთ სეტშია")
    symetricDifferenced.forEach{print($0, terminator: " ")}
}
//5. შექმენით ორგანზომილებიანი მასივი `matrix`, რომელიც შეიცავს რამდენიმე Int მასივს. გამოიყენეთ `flatMap` მეთოდი, რომ გადააქციოთ ის ერთგანზომილებიან მასივად. დაბეჭდეთ ორიგინალი მატრიცა და მიღებული ბრტყელი მასივი.
//
resultFor(exercise: "დავალება 5") {
    var matrix: [[Int]] = [[1, 3, 4],
                           [4, 5, 6],
                           [7, 8, 9]]
    print("ირიგინალი მასივი: ")
    matrix.map{print($0, terminator: " ")}
    
    var dimension1 = matrix.flatMap{$0}
    print("\n\nflatMap-ით დაწერილი: ")
    dimension1.map{print($0, terminator: " ")}
}
//6. დაწერეთ ფუნქცია `processOptionalNumbers`, რომელიც იღებს `[Int?]` ტიპის მასივს (ოფციონალური Int-ების მასივი). გამოიყენეთ `compactMap`, რომ მიიღოთ ახალი მასივი, სადაც ყველა nil მნიშვნელობა მოშორებულია და დანარჩენი რიცხვები გაორმაგებულია. გამოიძახეთ ფუნქცია და დაბეჭდეთ შედეგი.
//
resultFor(exercise: "დავალება 6") {
    func processOptionalNumbers( array: [Int?]) {
        var newArray = array.compactMap{$0}.map{$0*2}
        newArray.map{print($0,terminator: " ")}
    }
    var someArr: [Int?] = [11,3,45,nil,5,nil,1]
    processOptionalNumbers(array: someArr)
}
//7. შექმენით ფუნქცია, რომელიც დაითვლის და დაგვიბრუნებს მასივში არსებული სტრინგებიდან რამდენია პალინდრომი. პალინდრომი არის ტექსტი, რომელიც ორივე მხრიდან ერთნაირად იკითხება.
//
//(მაგ.: let array = [“ABA”, “AKKA”, “0101”] ამ მასივში არის ორი პალინდრომი, “ABA” და “AKKA”).
//
resultFor(exercise: "დავალება 7") {
    func palindromeFinder(array:  [String])->Int {
        var count = 0
        for word in array { if word == String(word.reversed()) {
            count += 1
            }
        }
        return count
    }
    
    let array = ["rogor", "gegi", "ara", "goga", "aba"]
    print("მოცემულ კონტეინერში არის \(palindromeFinder(array: array)) პალინდრომი ")
}

        

//8. დაწერეთ ფუნქცია `groupWordsByLength`, რომელიც იღებს String-ების მასივს და იყენებს `reduce` მეთოდს, რომ დააჯგუფოს სიტყვები მათი სიგრძის მიხედვით Dictionary-ში. გამოიძახეთ ეს ფუნქცია სხვადასხვა სიტყვების მასივზე და დაბეჭდეთ შედეგი.
//
//მაგალითად: input: ["apple", "banana", "kiwi", "grape", "strawberry"]
//
//      output: [4: ["kiwi"], 5: ["apple", "grape"], 6: ["banana"], 10: ["strawberry"]]
//
//
resultFor(exercise: "დავალება 8 ") {
    func groupWordsByLength(array: [String]) {
        var myDictionary: [Int:[String]] = [:]
        
        myDictionary = array.reduce(into: myDictionary) { myDictionary, word in
            myDictionary[word.count, default: []].append(word)
        }
        
             // მეორე ვარიანტი:
        
//        myDictionary = array.reduce(into: myDictionary){ myDictionary, word in
//            if myDictionary[word.count] != nil {
//                myDictionary[word.count]?.append(word)
//            } else {
//                myDictionary[word.count] = [word]
//            }
//        }

        for (key,value) in myDictionary{
            print("\(key):\(value)")            }
        }
    var opa = ["ვაშლი", "მსხალი", "ატამი", "კივი", "წივი", "ატამი", "გარგარი", "ბროწეული"]
    groupWordsByLength(array: opa)
}
//ბონუს დავალებები:
//
//9. დაწერეთ ფუნქცია, რომელიც მიიღებს სამ პარამეტრს: ორი მთელი რიცხვების მასივს და ქლოჟერს, ქლოჟერის მეშვეობით დაბეჭდეთ ამ მასივების გაერთიანება.
//
resultFor(exercise: "დავალება 9") {
    func unite(array1: [Int], array2: [Int], action: ([Int],[Int]) -> ()) {
        action(array1,array2)
    }
    var action: ([Int],[Int]) -> () = { arr1, arr2 in
        let new = arr1+arr2
        print(new)
    }
    var arr1 = [1, 3, 4, 5]
    var arr2 = [2, 3, 4, 5, 6, 78]
    unite(array1: arr1, array2: arr2, action: action)
}
//10. დაწერეთ ფუნქცია `applyOperations`, რომელიც იღებს Int-ების მასივს და closure-ების მასივს, სადაც თითოეული closure იღებს Int-ს და აბრუნებს Int-ს. ფუნქციამ უნდა გამოიყენოს `map` მეთოდი, რომ ყველა ოპერაცია ჩაატაროს ყველა რიცხვზე და დააბრუნოს შედეგების მასივი. გამოიძახეთ ეს ფუნქცია სხვადასხვა რიცხვებისა და ოპერაციების კომბინაციებით.
//
resultFor(exercise: "დავალება 10") {
    func applyOperations(array: [Int], actions: [(Int) -> (Int)]) {
        array.map{
            for action in actions {
                print(action($0))
            }
            print("\n")
        }
    }
    var action1: (Int)->(Int) = { $0*$0 }
    var action2: (Int)->(Int) = { $0+3 }
    var action3: (Int)->(Int) = { $0*4 }
    
    var actions = [action1, action2, action3]
    var array = [11, 23, 3]
    
    applyOperations(array: array, actions: actions)
}
//11. შექმენით ფუნქცია ‘filterAndTransform’, რომელიც იღებს Int-ების მასივს და ასრულებს შემდეგ ოპერაციებს: 1) იყენებს filter მეთოდს, რომ დატოვოს მხოლოდ 10-ზე მეტი რიცხვები 2) იყენებს map მეთოდს, რომ გამოაკლოს 10 ყველა დარჩენილ რიცხვს 3) იყენებს sorted მეთოდს, რომ დაალაგოს შედეგი ზრდადობით.
//
resultFor(exercise: "დავალება 11") {
    func filterAndTransform(array: inout [Int]) {
        array = array.filter{ $0>10 }
        array = array.map{ $0-10 }
        array = array.sorted(by: < )
        
        print(array)
    }
    
    var array = [1,2,3,444,55,662,14]
    filterAndTransform(array: &array)
    
}
//12. დაწერეთ ფუნქცია `executeInOrder`, რომელიც იღებს ვარიადულ closure პარამეტრს (ყველა closure-ს აქვს ტიპი `() -> Void`). ფუნქციამ უნდა შეასრულოს ეს closure-ები მიმდევრობით, ყოველი შესრულების წინ და შემდეგ კი დაბეჭდოს შესაბამისი შეტყობინება. გამოიძახეთ ეს ფუნქცია რამდენიმე სხვადასხვა ოპერაციით და დააკვირდით შესრულების თანმიმდევრობას.
//
//მაგალითად:
//
//executeInOrder(firstOperation, secondOperation, thirdOperation)
//
//output:
//
//Executing closure 1...
//First operation is running.
//Finished executing closure 1.
//
//Executing closure 2...
//Second operation is running.
//Finished executing closure 2.
//
//Executing closure 3...
//Third operation is running.
//Finished executing closure 3.
resultFor(exercise: "დავალება 12") {
    func executeInOrder(closures:  (() -> Void)...) {
        var count = 1
        for closure in closures {  print("ოპერაცია \(count) დაიწყო")
                                   closure()
                                   print("ოპერაცია \(count) დასრულდა\n")
                                   count += 1
                                }
    }
    
    var action1 = { print("პირველი ოპერაცია")}
    var action2 = { print("მეორე ოპერაცია")}
    var action3 = { print("მესამე ოპერაცია")}
    
    executeInOrder(closures: action1, action2, action3)
}

