import UIKit

//1. შექმენით ორი მუდმივა (let) და ორი ცვლადი (var) სხვადასხვა ტიპის (Int, Double, String, Bool). მიანიჭეთ მათ მნიშვნელობები და დაბეჭდეთ.
//
print("🔴🔴🔴 დავალება 1 🔴🔴🔴\n")

let A: Int = 1
let B = 3.4
var C = "Swift"
var D: Bool = true

print(A)
print(B)
print(C)
print(D)


//
//2. შექმენით Int ტიპის ცვლადი და გამოიყენეთ არითმეტიკული ოპერატორები (+, -, *, /) სხვადასხვა ოპერაციების შესასრულებლად. დაბეჭდეთ შედეგები.
//
print("\n🔴🔴🔴 დავალება 2 🔴🔴🔴\n")

let a = 10, b = 4
let addition: Int, subtraction: Int, multiplication: Int, division: Int
addition = a+b
subtraction = a-b
multiplication = a*b
division = a/b

print("\(a) + \(b) = \(addition)")
print("\(a) - \(b) = \(subtraction)")
print("\(a) * \(b) = \(multiplication)")
print("\(a) / \(b) = \(division)")


//
//3. შექმენით ორი Double ტიპის ცვლადი და გამოიყენეთ შედარების ოპერატორები (==, !=, >, <, >=, <=) მათ შესადარებლად. დაბეჭდეთ შედარების შედეგები.
//
print("\n🔴🔴🔴 დავალება 3 🔴🔴🔴\n")

var num1 = 3.4, num2 = 4.3
print("\(num1) == \(num2) --> \(num1 == num2)")
print("\(num1) != \(num2) --> \(num1 != num2)")
print("\(num1) > \(num2) --> \(num1 > num2)")
print("\(num1) < \(num2) --> \(num1 < num2)")
print("\(num1) >= \(num2) --> \(num1 >= num2)")
print("\(num1) <= \(num2) --> \(num1 <= num2)")


//4. შექმენით String ტიპის ცვლადი თქვენი სახელით და Character ტიპის მუდმივა თქვენი სახელის პირველი ასოთი. გამოიყენეთ სტრინგის ინტერპოლაცია ორივე მნიშვნელობის დასაბეჭდად ერთ წინადადებაში.
//
print("\n🔴🔴🔴 დავალება 4 🔴🔴🔴\n")

var firstName: String = "Gegi"
var firstLetter: Character = "G"
print(" My name is \(firstName)\n The first letter of my name is \(firstLetter) ")


//5. შექმენით Optional String ტიპის ცვლადი. გამოიყენეთ optional binding (if let), რომ უსაფრთხოდ ამოიღოთ მნიშვნელობა და დაბეჭდოთ ის.
//
print("\n🔴🔴🔴 დავალება 5 🔴🔴🔴\n")

var someOpt: String?
if let someOpt {
    print(someOpt)
} else {
    print("variable is empty")
}


//6. დაწერეთ for-in ციკლი, რომელიც დაბეჭდავს რიცხვებს 1-დან 10-მდე.
//
print("\n🔴🔴🔴 დავალება 6 🔴🔴🔴\n")

var num = 0
for num in 1...10{
    print(num)
}


//7. შექმენით Int ტიპის ცვლადი და გამოიყენეთ while ციკლი, რომ დაბეჭდოთ მისი მნიშვნელობა 0-მდე (ყოველ იტერაციაზე აკლებთ 1-ს).
//
print("\n🔴🔴🔴 დავალება 7 🔴🔴🔴\n")

var someVariable: Int = 9
while (someVariable >= 0){
    print(someVariable)
    someVariable -= 1
}


//8. დაწერეთ if-else if-else სტრუქტურა, რომელიც შეამოწმებს Int ტიპის ცვლადის მნიშვნელობას და დაბეჭდავს შესაბამის შეტყობინებას (მაგალითად, დადებითია, უარყოფითია თუ ნულის ტოლი).
//
print("\n🔴🔴🔴 დავალება 8 🔴🔴🔴\n")

var number1 = -4
if number1 > 0 {
    print("it is positive")
}
else
if number1 == 0 {
    print("Equal to Zero")
} else {
    print("it is negative")
}


//ბონუსი:
//
//9. შექმენით ორი Int ტიპის ცვლადი: number და sum. გამოიყენეთ while ციკლი number-ის ციფრების ჯამის გამოსათვლელად და შედეგი შეინახეთ sum-ში. მაგალითად, თუ number არის 1234, sum უნდა იყოს 10 (ანუ 1+2+3+4). დაბეჭდეთ საწყისი რიცხვი და მიღებული ჯამი.
//
print("\n🔴🔴🔴 დავალება 9 🔴🔴🔴\n")

var number: Int = 123459
var sum: Int = 0
print("number: \(number)")
while (number > 0){
    sum += number % 10
    number /= 10
}
print("sum of its digits: \(sum)")

//10. შექმენით String ტიპის ცვლადი სიტყვით და Int ტიპის ცვლადი სახელით count ნულის მნიშვნელობით. გამოიყენეთ for-in ციკლი სიტყვაში ხმოვნების (a, e, i, o, u) დასათვლელად. ყოველი ხმოვნის შემთხვევაში გაზარდეთ count ერთით. ციკლის დასრულების შემდეგ დაბეჭდეთ საწყისი სიტყვა და მასში ნაპოვნი ხმოვნების რაოდენობა.
//
print("\n🔴🔴🔴 დავალება 10 🔴🔴🔴\n")

var word1: String = "waeIOkkUurd"
var count: Int = 0
for P in word1 {
    if (P == "a" || P == "e" || P == "i" || P == "o" || P == "u" || P == "A" || P == "E" || P == "I" || P == "O" || P == "U") {
        count += 1
    }
}
print("the count of vowels in the word '\(word1)' is \(count)")


//11. შექმენით სტრინგ ტიპის ცვლადი და მიანიჭეთ მნიშვნელობა, დაბეჭდეთ მისი შებრუნებული მნიშვნელობა, მაგ: “xCode” -> “”edoCx”
//
print("\n🔴🔴🔴 დავალება 11 🔴🔴🔴\n")

var word = "xCode"
var reversedWord: String = ""
var S: Character
for S in word
{
    reversedWord = "\(S)\(reversedWord)"
}
print("word before reverse: \(word)")
print("word after reverse: \(reversedWord)")


//12. შექმენით Int ტიპის ცვლადი და მიანიჭეთ მას ორნიშნა მნიშვნელობა, შეამოწმეთ შედგება თუ არა ეს რიცხვი ერთი და იგივე ციფრებისგან.
//
print("\n🔴🔴🔴 დავალება 9 🔴🔴🔴\n")

var randomNumber = 35
print("number \(randomNumber)")
if randomNumber / 10 == randomNumber % 10 {
    print("digits are same")
} else {
    print("digits are not same ")
}
