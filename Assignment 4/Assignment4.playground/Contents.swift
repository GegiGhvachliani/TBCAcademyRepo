import UIKit

//1. შექმენით ფუნქცია სახელად `greet`, რომელიც იღებს String ტიპის პარამეტრს `name` და ბეჭდავს მისალმებას. მაგალითად, თუ გადავცემთ "გიორგი", უნდა დაიბეჭდოს "გამარჯობა, გიორგი!".

resultFor(exercise: "დავალება 1") {
    func greet(_ name: String){
        print("გამარჯობა, \(name)!")
    }
    greet("გიორგი")
}

//
//2. დაწერეთ ფუნქცია printMultiplicationTable, რომელიც იღებს ერთ Int ტიპის პარამეტრს number და ბეჭდავს ამ რიცხვის გამრავლების ტაბულას 1-დან 10-მდე. მაგალითად, თუ გადავცემთ 5-ს, ფუნქციამ უნდა დაბეჭდოს:
//
//5 x 1 = 5
//
//5 x 2 = 10
//
//5 x 3 = 15
//...
//5 x 10 = 50
//
//გამოიძახეთ ეს ფუნქცია რამდენიმე სხვადასხვა რიცხვისთვის.
//
resultFor(exercise: "დავალება 2") {
    func printMultiplicationTable(for number: Int){
        for i in 1...10{
            print("\(number) x \(i) = \(number*i)")
        }
    }
    
    for number in 7...9{
        print("multiplication table for \(number):")
        printMultiplicationTable(for: number)
        print("\n")
    }
}

//
//3. შექმენით ფუნქცია `isEven`, რომელიც იღებს Int ტიპის პარამეტრს და აბრუნებს Bool-ს - true თუ რიცხვი ლუწია, false თუ კენტი. გამოიყენეთ ეს ფუნქცია რამდენიმე რიცხვის შესამოწმებლად და დაბეჭდეთ შედეგები.
//
resultFor(exercise: "დავალება 3") {
    func isEven(number: Int) -> Bool{
        number % 2 == 0
    }
    
    for number in 1...5{
        if isEven(number: number){
            print("\(number) is even")
        } else{
            print("\(number) is odd")
        }
    }
}
//4. დაწერეთ ფუნქცია `repeatString`, რომელსაც აქვს ორი პარამეტრი: String ტიპის `text` და Int ტიპის `count`. ფუნქციამ უნდა დააბრუნოს ახალი სტრინგი, სადაც `text` გამეორებულია `count`-ჯერ. მაგალითად, `repeatString("ჰა", 3)` უნდა დააბრუნოს "ჰაჰაჰა".
//
resultFor(exercise: "დავალება 4") {
    func repeatString(text: String, count: Int) -> String{
        var finalWord = ""
        for times in 1...count{
            finalWord += text
        }
        return finalWord
    }
    print(repeatString(text: "ჰა", count: 4))
}

//5. შექმენით ფუნქცია `calculateTax`, რომელსაც აქვს ორი პარამეტრი: Double ტიპის `price` და Double ტიპის `taxRate` (პროცენტებში). ფუნქციამ უნდა დააბრუნოს გადასახადის თანხა. გამოიძახეთ ეს ფუნქცია სხვადასხვა ფასისთვის და დაბეჭდეთ შედეგები.
//
resultFor(exercise: "დავალება 5") {
    func calculateTax(price: Double, taxRate: Double) -> Double{
        price*taxRate/100
    }
    
    print(calculateTax(price: 120, taxRate: 7))
    print(calculateTax(price: 90, taxRate: 32))
    print(calculateTax(price: 100, taxRate: 20))
}
//6. დაწერეთ ფუნქცია `printNumbers`, რომელსაც აქვს ვარიადული Int ტიპის პარამეტრი `numbers`. ფუნქციამ უნდა დაბეჭდოს ყველა გადაცემული რიცხვი. გამოიძახეთ ეს ფუნქცია სხვადასხვა რაოდენობის არგუმენტებით.
//
resultFor(exercise: "დავალება 6") {
    func printNumbers(numbers: Int... ){
        for number in numbers{
            print("\(number),", terminator: " ")
        }
        print("\n")
    }
    
    printNumbers(numbers: 1,23,4,5,6,72)
    printNumbers(numbers: 1,23)
    printNumbers(numbers: 111,323,123,12,3,1)
}
//7. ფუნქციის გარეთ შექმენით მუდმივა ‘pi’ და მიანიჭეთ შესაბამისი მნიშვნელობა. შექმენით ფუნქცია ‘calculateCircleArea’ რომელსაც აქვს Double ტიპის პარამეტრი `radius`. Pi-ს და radius-ის გამოყენებით დაბეჭდეთ წრის ფართობი.
//
resultFor(exercise: "დავალება 7") {
    let pi = 3.14159
    func calculateCircleArea(radius: Double){
        print("\(radius) სმ რადიუსის მქონე წრის ფართობია \(pi*radius*radius) კვადრატული სანტიმეტრი ")
    }
    
    calculateCircleArea(radius: 19)
    calculateCircleArea(radius: 11)
    calculateCircleArea(radius: 10)
}

//8. შექმენით ფუნქცია printEvenNumbers, რომელიც იღებს ვარიადულ Int ტიპის პარამეტრს numbers. ფუნქციამ უნდა დაბეჭდოს მხოლოდ ლუწი რიცხვები გადმოცემული არგუმენტებიდან. გამოიძახეთ ეს ფუნქცია სხვადასხვა რაოდენობის არგუმენტებით და დაბეჭდეთ შედეგები.
//
resultFor(exercise: "დავალება 8 ") {
    func printEvenNumbers(numbers: Int...){
        print("არჩეული ლუწი რიცხვებია:", terminator: " ")
        for number in numbers{
            if number%2 == 0 {print(number, terminator: " ")}
        }
        print("\n")
    }
    printEvenNumbers(numbers: 12,2,3,4,5,6,77,7)
    printEvenNumbers(numbers: 1,3,2,4,5,6)
    printEvenNumbers(numbers: 44,55,33)
}
//ბონუს დავალებები:
//
//9. დაწერეთ ფუნქცია `applyOperation`, რომელსაც აქვს სამი პარამეტრი: ორი Int ტიპის რიცხვი და ერთი closure, რომელიც იღებს ორ Int-ს და აბრუნებს Int-ს. ფუნქციამ უნდა გამოიყენოს ეს closure ორ რიცხვზე და დააბრუნოს შედეგი. გამოიძახეთ ეს ფუნქცია სხვადასხვა არითმეტიკული ოპერაციებისთვის (მიმატება, გამოკლება, გამრავლება) და დაბეჭდეთ შედეგები.
//
resultFor(exercise: "დავალება 9") {
    func applyOperation(_ num1: Int, _ num2: Int, closure: (Int,Int)->(Int)){
        print(" operation result for \(num1) and \(num2) is :\(closure(num1,num2))")
    }
    
    let mimateba: (Int,Int) -> (Int) = {num1, num2 in return num1+num2}
    let gamokleba: (Int,Int) -> (Int) = {num1, num2 in return num1-num2}
    let gamravleba: (Int,Int) -> (Int) = {num1, num2 in return num1*num2}
    
    var num1 = 3, num2 = 5
    applyOperation(num1, num2, closure: mimateba)
    applyOperation(num1, num2, closure: gamokleba)
    applyOperation(num1, num2, closure: gamravleba)
    
}
//10. შექმენით ფუნქცია `repeatOperation`, რომელსაც აქვს ორი პარამეტრი: Int ტიპის `count` და @autoclosure ტიპის closure `operation`. ფუნქციამ უნდა გამოიძახოს ეს operation `count`-ჯერ. გამოიყენეთ ეს ფუნქცია, რომ დაბეჭდოთ "გამარჯობა" 5-ჯერ.
//
resultFor(exercise: "დავალება 10") {
    func repeatOperation(count: Int, operation: @autoclosure ()->()){
        if count < 1 {
            print("რიცხვი აუცილებლად დადებითი უნდა იყოს, სცადეთ თავიდან\n")
        } else {
            for i in 1...count{
                operation()
            }
        }
    }
    var printer = {print("გამარჯობა")}
    repeatOperation(count: -5, operation: printer() )
    repeatOperation(count: 5, operation: printer() )
}
//11. დაწერეთ ფუნქცია createCounter, რომელიც აბრუნებს closure-ს. ეს ფუნქცია უნდა შეიცავდეს ლოკალურ ცვლადს count, რომელიც ინიციალიზდება 0-ით. დაბრუნებულმა closure-მ უნდა გაზარდოს ეს count ცვლადი ყოველ გამოძახებაზე და დააბრუნოს მისი ახალი მნიშვნელობა.
//
resultFor(exercise: "დავალება 11") {
    func createCounter() -> ()->Int {
        var  count = 0
        func incrementer()->(Int){
            count += 1
            return count
        }
        return incrementer
        }
    
     let increment = createCounter()
    print(increment())
    print(increment())
    print(increment())
    print(increment())
    }


    

//12. შექმენით ფუნქცია performOperation, რომელსაც აქვს ერთი closure ტიპის პარამეტრი operation. ფუნქციამ უნდა დაბეჭდოს “ოპერაცია დაიწყო” და შემდეგ გამოიძახოს operation. გამოიძახეთ ეს ფუნქცია და closure-ს შიგნით დაბეჭდეთ “ოპერაცია დასრულდა”.
//
resultFor(exercise: "დავალება 12") {
    func performOperation( operation: () -> () ){
        print("ოპერაცია დაიწყო")
        operation()
    }
    var someClosure: () -> () = { print("ოპერაცია დასრულდა")}
    performOperation(operation: someClosure)
}


