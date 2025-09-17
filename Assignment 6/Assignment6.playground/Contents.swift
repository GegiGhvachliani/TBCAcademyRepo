import UIKit



//1.შექმენით ორი ინტეჯერის ცვლადი, შემთხვევითი რიცხვის გენერაციით. შეკრიბეთ და ჯამი დაბეჭდეთ თუ ის ლუწია ან მეტია 100-ზე.
//
//
//
resultFor(exercise: "დავალება 1") {
    var random1 = Int.random(in: 0...100)
    var random2 = Int.random(in: 0...100)
    print("შემთხვევითი რიცხვები: \(random1), \(random2)")
    var sum = random1+random2
    sum % 2 == 0 || sum > 100 ? print(sum) : print("რიცხვების ჯამი არც ლუწია და არც 100-ზე მეტი")
}
//
//
//2.შექმენით ცვლადი სახელად grade რომელიც იქნება შემთხვევითად შერჩეული რიცხვი 1-დან 100-მდე. switch statement-ის გამოყენებით დაწერეთ პროგრამა რომელიც კონსოლში გამოგვიტანს თუ რა შეფასებას მიიღებს სტუდენტი იმ შემთხვევაში თუ დაგენერირებულ ქულას მიიღებს გამოცდაზე. >90 => A; 80+ => B; >70 => C; >60 => D; >40 => E; <40 => F;
//
//
//
resultFor(exercise: "დავალება 2") {
    var grade = Int.random(in: 1...100)
    print("სტუდენტის ქულა: \(grade)")
    switch grade {
    case 91...100:print("სტუდენტის შეფასება: A")
    case 81...90: print("სტუდენტის შეფასება: B")
    case 71...80: print("სტუდენტის შეფასება: C")
    case 61...70: print("სტუდენტის შეფასება: D")
    case 51...60: print("სტუდენტის შეფასება: E")
    case 0...50: print ("სტუდენტის შეფასება: F")
    default: print("error")
    }
}
//
//
//3.ციკლის გამოყენებით დინამიურად დააგენერირეთ შემთხვევითი რიცხვების 10 მონაცემიანი ოფშენალ მასივი. იმ შემთხვევაში თუ დაგენერირებული მონაცემი იქნება ხუთის ჯერადი მასივს დავამატოთ nil სხვა შემთხვევაში დავამატოთ დაგენერირებული რიცხვი.
//
//
//
    print("🔴   დავალება 3   🔴\n   ")


    var arrayOfOptionals = [Int?](repeating: nil, count: 10)
    for value in 0...9 {
        var random = Int.random(in: 0...200)
        if  random  % 5 != 0 {
            arrayOfOptionals[value] = random
        }
    }


    print(arrayOfOptionals)
    print("\n")
    print("----------------")
//
//
//4.მესამე ამოცანაში დაგენერირებული მასივისგან შექმენით ახალი მასივი რომელშიც აღარ გვექნება optional მონაცემები. გამოიყენეთ optional unwrapping-ი.
//
//
//
resultFor(exercise: "დავალება 4") {
    var arrayWithNonOptionals: [Int] = arrayOfOptionals.compactMap{$0}
    print(arrayWithNonOptionals)
    
    // მეორე ვარიანტი
//    for value in arrayOfOptionals {
//        if let value {
//            arrayWithNonOptionals.append(value)
//        }
//    }
//    print(arrayWithNonOptionals)
}
//
//
//5.მოცემული გვაქვს integer-ების მასივი [1, 7, 12, 15, 7, 13, 5, 7, 9, 12, 23, 7]. მოცემული მასივისგან შექმენით ახალი მასივი(Array) სადაც ყველა მონაცემი იქნება უნიკალური. ამოცანა გააკეთეთ Set-ის გარეშე.
//
//
//
resultFor(exercise: "დავალება 5") {
    var array = [1, 7, 12, 15, 7, 13, 5, 7, 9, 12, 23, 7]
    var newArr: [Int] = []
    for number in array {
        if !newArr.contains(number){
            newArr.append(number)
        }
    }
    print(newArr)
}
//
//
//6.მოცემული გვაქვს ორი მასივი let names = [“გელა“, “ზაირა“, “შალვა“, “მურადი“, “მაყვალა“] და let grades = [80, 23, 71, 75, 100]. მოცემული მასივებისგან დინამიურად შექმენით Dictionary სადაც names პირველი ელემენტი იქნება dictionary-ის key ხოლო grades-ის ბოლო ელემენტი value. შესაბამისად names-ის მეორე ელემენტს უნდა შეესაბამებოდეს grades-ის ბოლოს წინა ელემენტი და ა.შ. დაბეჭდეთ სახელი რომელსაც ყველაზე მაღალი შეფასება აქვს.
//
//
//
resultFor(exercise: "დავალება 6") {
    let names = ["გელა", "ზაირა", "შალვა", "მურადი", "მაყვალა"]
    let grades = [80, 23, 71, 75, 100]
    var bestGrade = 0
    var bestStudent = ""
    
    var gradesTable: [String:Int] = [:]
    
    for index in 0..<names.count {
        var nameOnIndex = names[index]
        var gradeOnIndex = grades[grades.count - 1 - index]
        gradesTable[nameOnIndex] = gradeOnIndex
    }
    
    print("სტუდენტები თავიანთი ქულებით: ")
    for (name, grade) in gradesTable {
        print(name,":",grade)
    }
    
    for (student, grade) in gradesTable {
        if grade > bestGrade {
            bestGrade = grade
            bestStudent = student
        }
    }
    
    print("\nკლასში საუკეთესო ქულის (\(bestGrade)) მქონე სტუდენტია \(bestStudent)")
    
}
//
//
//7.ციკლის გამოყენებით დინამიურად დააგენერირეთ 1-დან 10-მდე ინტერვალში შემთხვევითი რიცხვების 100 მონაცემიანი მასივი. დაბეჭდეთ ყველაზე ხშირად გამეორებადი რიცხვი.
//
//
resultFor(exercise: "დავალება 7") {
    var maxCount = 0
    var mostFrequentNumber = 0
    var randomNumbersArray: [Int] = []
    var counts: [Int:Int] = [:]
    for times in 0...99 {
        randomNumbersArray.append(Int.random(in: 1...10))
    }
    randomNumbersArray.forEach{
        counts[$0] = (counts[$0] ?? 0 ) + 1
    }
    for (key,value) in counts {
        if value > maxCount {
            maxCount = value
            mostFrequentNumber = key
        }
    }
    print(counts)
    print("ყველაზე მეტჯერ (\(maxCount)) გამეორდა \(mostFrequentNumber)")
}
//
//
//8.დააგენერირეთ 2 შემთხვევითი რიცხვი 1-დან 100-მდე და დაბეჭდეთ ის რიცხვი რომლის გამყოფების ჯამიც მეტია.
//
//
resultFor(exercise: "დავალება 8") {
    var number1 = Int.random(in: 1...100)
    var number2 = Int.random(in: 1...100)
    
    func NumberDivisorsSum(_ number: Int) -> Int {
        var sum = 0
        for divisor in 1...number {
            if number % divisor == 0 {
                sum += divisor
            }
        }
        return sum
    }
    print("პირველი რიცხვი:",number1)
    print("მეორე რიცხვი:",number2)
    
    var SumOfnumber1Divisors = NumberDivisorsSum(number1)
    var SumOfnumber2Divisors = NumberDivisorsSum(number2)
    
    if SumOfnumber1Divisors > SumOfnumber2Divisors {
        print("\(number1)-ის გამყოფების ჯამია:", SumOfnumber1Divisors)
    } else {
        print("\(number2)-ის გამყოფების ჯამია:", SumOfnumber2Divisors)
    }
    
}
