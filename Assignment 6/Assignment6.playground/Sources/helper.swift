import UIKit
//1. შექმენით Genre ტიპის enum, რომელიც შეიცავს ფილმის ჟანრებს, მაგალითად: action, drama, comedy, thriller და სხვა. შექმენით ძირითადი კლასი Film, რომელსაც ექნება შემდეგი თვისებები:
//title - ფილმის სახელი,
//releaseYear— გამოშვების წელი,
//genre — ფილმის ჟანრი,
//revenue - შემოსავალი
//მეთოდი description(), რომელიც დაბეჭდავს ინფორმაციას ფილმზე.
//
//3. Film კლასში შექმენით ფუნქცია removeFilm რომელიც პარამეტრად მიიღებს ფილმების მასივს და დასახელებას, ფუნქციამ უნდა წაშალოს მასივში თუ მოიძებნა მსგავსი დასახელების ფილმი.
//
enum Genre {
    case action, drama, comedy, thriller
}

class Film {
    var title: String
    var releaseYear: Int
    var genre: Genre
    var revenue: Int
    func description() {
        print(" title: \(title)\n release year: \(releaseYear)\n genre: \(genre)\n revenue: \(revenue)")
    }
    func removeFilm(from filmsArray: inout [Film], title: String) {
        filmsArray.removeAll {
            $0.title == title
        }
    }
    
    init(title: String, releaseYear: Int, genre: Genre, revenue: Int) {
        self.title = title
        self.releaseYear = releaseYear
        self.genre = genre
        self.revenue = revenue
    }
}
//2. შექმენით კლასი Person, რომელსაც აქვს შემდეგი თვისებები:
//name — პიროვნების სახელი
//birthYear — დაბადების წელი.
//მეთოდი getAge რომელიც დაიანგარიშებს და დააბრუნებს ამ პიროვნების ასაკს მოცემულ წელს.
//
class Person {
    var name: String
    var birthYear: Int
    func getAge(for thatDate: Int) -> Int {
        thatDate - birthYear
    }
    init(name: String, birthYear: Int) {
        self.name = name
        self.birthYear = birthYear
    }
}

//4. შექმენით კლასი Actor, რომელიც არის Person კლასის მემკვიდრე კლასი
//Actor-ს უნდა ჰქონდეს actedFilms  მსახიობის მიერ ნათამაშები ფილმების სია და მეთოდი რომელიც მსახიობის მიერ ნათამაშებ ფილმებს დაამატებს სიაში.
//
class Actor: Person {
    var actedFilms: [Film]
    func addActedFilm( _ film: Film) {
        actedFilms.append(film)
    }
    override init(name: String, birthYear: Int) {
        <#code#>
    }
}
//5. შექმენი Director კლასი, რომელიც ასევე Person-ის მემკვიდრეა და ექნება directedFilms რეჟისორის მიერ გადაღებული ფილმების სია და totalRevenue რეჟისორის ჯამური შემოსავალი.
//დაამატე მეთოდი რომელიც რეჟისორის მიერ გადაღებულ ფილმებს დაამატებს და დაითვლის თითოეული ფილმისთვის ჯამურ შემოსავალს.
//
//6. შექმენით 5 ფილმის და 5 მსახიობის ობიექტები და Dictionary, რომელშიც key იქნება მსახიობის სახელი, ხოლო მნიშვნელობებად მიიღებს იმ ფილმების სიას, რომლებშიც მონაწილეობს ეს მსახიობი.
//
//7. გამოიყენეთ map, იმისთვის რომ დაბეჭდოთ ყველა ფილმის სათაურების სია ამავე ფილმების მასივიდან
//
//8. reduce ფუნქციის გამოყენებით დაიანგარიშეთ ამ ყველა ფილმების გამოშვების საშუალო წელი.
//
//ბონუს ამოცანები:
//
//9. შექმენით კლასი SuperHero, რომელიც შეიცავს შემდეგ ველებს:
//name სუპერ გმირის სახელი
//superPower  სუპერ ძალა
//level - PowerLevel enum-ის ტიპის,
//და allies ამავე ტიპის მოკავშირეების ჩამონათვალი,
//დაამატეთ ინიციალიზაციის და დეინიციალიზაციის მეთოდები
//
//10. შექმენით Enum PowerLevel, რომელიც მოიცავს შემდეგ დონეებს: weak, average, strong, super და დაამატეთ აღწერის მეთოდი რომელიც დააბრუნებს level-ს ტექსტური ფორმით.
//
//11. uniquePowers ყველა გმირისათვის და დააბრუნებს  უნიკალური ძალების სიას
//
//12.  მეთოდი addAlly დაამატებს მოკავშირეების სიას, შექმენით 2 SuperHero ობიექტი და გახადეთ ისინი მოკავშირეები.

