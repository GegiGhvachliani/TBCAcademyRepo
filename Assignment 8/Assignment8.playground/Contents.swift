import UIKit
import Foundation
//
//1. შექმენით Genre ტიპის enum, რომელიც შეიცავს ფილმის ჟანრებს, მაგალითად: action, drama, comedy, thriller და სხვა. შექმენით ძირითადი კლასი Film, რომელსაც ექნება შემდეგი თვისებები:
//title - ფილმის სახელი,
//releaseYear— გამოშვების წელი,
//genre — ფილმის ჟანრი,
//revenue - შემოსავალი
//მეთოდი description(), რომელიც დაბეჭდავს ინფორმაციას ფილმზე.
//
//3. Film კლასში შექმენით ფუნქცია removeFilm რომელიც პარამეტრად მიიღებს ფილმების მასივს და დასახელებას, ფუნქციამ უნდა წაშალოს მასივში თუ მოიძებნა მსგავსი დასახელების ფილმი.
//
print("\n 🔴🔴🔴 დავალება 1 & 3 🔴🔴🔴\n")
enum Genre {
    case action, drama, comedy, thriller
}

class Film {
    var title: String
    var releaseYear: Int
    var genre: Genre
    var revenue: Int
    
    func description() {
        print(
            "\n title: \(title)\n release year: \(releaseYear)\n genre: \(genre)\n revenue: \(revenue) \n"
        )
    }
    static func removeFilm(from filmsArray: inout [Film], filmTitle: String) {
        var beforeChange = filmsArray
        filmsArray.removeAll {
            $0.title == filmTitle
        }
        if beforeChange.count == filmsArray.count {
            print("film titled \"\(filmTitle)\" not found")
        } else {
            print("film title \"\(filmTitle)\" was successfully deleted")
        }
    }
    init(title: String, releaseYear: Int, genre: Genre, revenue: Int) {
        self.title = title
        self.releaseYear = releaseYear
        self.genre = genre
        self.revenue = revenue
    }
}
let film1 = Film(title: "Inception", releaseYear: 2010, genre: .thriller, revenue: 830000000)
let film2 = Film(title: "Titanic", releaseYear: 1997, genre: .drama, revenue: 2187000000)
let film3 = Film(title: "The Dark Knight", releaseYear: 2008, genre: .action, revenue: 1005000000)
let film4 = Film(title: "The Hangover", releaseYear: 2009, genre: .comedy, revenue: 469000000)
let film5 = Film(title: "Gladiator", releaseYear: 2000, genre: .action, revenue: 465000000)
var someFilm = Film(title: "random", releaseYear: 1999, genre: .action, revenue: 1_000_000)
var filmsArray = [film1, film2, film3, film4, film5, someFilm]
someFilm.description()
Film.removeFilm(from: &filmsArray, filmTitle: "random")
//2. შექმენით კლასი Person, რომელსაც აქვს შემდეგი თვისებები:
//name — პიროვნების სახელი
//birthYear — დაბადების წელი.
//მეთოდი getAge რომელიც დაიანგარიშებს და დააბრუნებს ამ პიროვნების ასაკს მოცემულ წელს.
//
print("\n 🔴🔴🔴 დავალება 2 🔴🔴🔴\n")
class Person {
    var name: String
    var birthYear: Int
    
    func getAge(for date: Int) -> Int {
        date - birthYear
    }
    
    init(name: String, birthYear: Int) {
        self.name = name
        self.birthYear = birthYear
    }
}
var person = Person(name: "Joseph" , birthYear: 1878)
print("\(person.getAge(for: 2004)) years have passed since \(person.name)'s birth\n ")
//4. შექმენით კლასი Actor, რომელიც არის Person კლასის მემკვიდრე კლასი
//Actor-ს უნდა ჰქონდეს actedFilms  მსახიობის მიერ ნათამაშები ფილმების სია და მეთოდი რომელიც მსახიობის მიერ ნათამაშებ ფილმებს დაამატებს სიაში.
//
print("\n 🔴🔴🔴 დავალება 4 🔴🔴🔴\n")
class Actor: Person {
    var actedFilms: [Film]
    func addFilmToCareer(_ film: Film) {
        actedFilms.append(film)
    }
    init(actedFilms: [Film], name: String, birthYear: Int) {
        self.actedFilms = actedFilms
        super.init(name: name, birthYear: birthYear)
    }
}

var randomActor = Actor(actedFilms: [film1, film2], name: "random actor", birthYear: 1984)
randomActor.addFilmToCareer(film3)
randomActor.actedFilms.forEach {
    print($0.title)
}
//5. შექმენი Director კლასი, რომელიც ასევე Person-ის მემკვიდრეა და ექნება directedFilms რეჟისორის მიერ გადაღებული ფილმების სია და totalRevenue რეჟისორის ჯამური შემოსავალი.
//დაამატე მეთოდი რომელიც რეჟისორის მიერ გადაღებულ ფილმებს დაამატებს და დაითვლის თითოეული ფილმისთვის ჯამურ შემოსავალს.
//
print("\n 🔴🔴🔴 დავალება 5 🔴🔴🔴\n")
class Director: Person {
    var directedFilms: [Film]
    var totalRevenue: Int {
        directedFilms.reduce(into: 0) { totalRevenue, film in
            totalRevenue += film.revenue
        }
    }
    
    init(directedFilms: [Film], name: String, birthYear: Int) {
        self.directedFilms = directedFilms
        super.init(name: name, birthYear: birthYear)
    }
}
var randomDirector = Director(directedFilms: [film1, film4, film5], name: "Bob", birthYear: 1980)
print(randomDirector.totalRevenue, "USD")
//6. შექმენით 5 ფილმის და 5 მსახიობის ობიექტები და Dictionary, რომელშიც key იქნება მსახიობის სახელი, ხოლო მნიშვნელობებად მიიღებს იმ ფილმების სიას, რომლებშიც მონაწილეობს ეს მსახიობი.
print("\n 🔴🔴🔴 დავალება 6 🔴🔴🔴\n")
//
//let film1 = Film(title: "Inception", releaseYear: 2010, genre: .thriller, revenue: 830000000)
//let film2 = Film(title: "Titanic", releaseYear: 1997, genre: .drama, revenue: 2187000000)
//let film3 = Film(title: "The Dark Knight", releaseYear: 2008, genre: .action, revenue: 1005000000)
//let film4 = Film(title: "The Hangover", releaseYear: 2009, genre: .comedy, revenue: 469000000)
//let film5 = Film(title: "Gladiator", releaseYear: 2000, genre: .action, revenue: 465000000)
//var filmsArray = [film1, film2, film3, film4, film5, someFilm]
// MARK: ეს ფილმები უკვე შექმნილია მაღლა და აღარ შევქმნი ახალს

let actor1 = Actor(actedFilms: [film1, film3],name: "Leonardo DiCaprio",birthYear: 1974)
let actor2 = Actor(actedFilms: [film2], name: "Kate Winslet", birthYear: 1975)
let actor3 = Actor(actedFilms: [film3, film5], name: "Christian Bale", birthYear: 1974)
let actor4 = Actor(actedFilms: [film4], name: "Bradley Cooper", birthYear: 1975)
let actor5 = Actor(actedFilms: [film1, film2, film3, film5], name: "Russell Crowe", birthYear: 1964)
var actorsArray = [actor1, actor2, actor3, actor4, actor5]

var filmActorDictionary: [String: [Film]] = [
    actor1.name : [film1, film3],
    actor2.name : [film2],
    actor3.name : [film3, film4],
    actor4.name : [film4],
    actor5.name : [film1, film2, film3, film5]
]
filmActorDictionary.forEach { (actor, actedFilms) in
    print("\(actor):", terminator: " ")
    actedFilms.forEach {
        print($0.title, terminator: ", ")
    }
    print("\n")
}
//7. გამოიყენეთ map, იმისთვის რომ დაბეჭდოთ ყველა ფილმის სათაურების სია ამავე ფილმების მასივიდან
//
print("\n 🔴🔴🔴 დავალება 7 🔴🔴🔴\n")
filmsArray.map { print($0.title) }
//8. reduce ფუნქციის გამოყენებით დაიანგარიშეთ ამ ყველა ფილმების გამოშვების საშუალო წელი.
//
print("\n 🔴🔴🔴 დავალება 8 🔴🔴🔴\n")
var averageOfreleaseYear = filmsArray.reduce(into: 0) { sumOfDate, date in
    sumOfDate += date.releaseYear } / filmsArray.count
print("average of films release year is \(averageOfreleaseYear)")
//ბონუს ამოცანები:
//
//9. შექმენით კლასი SuperHero, რომელიც შეიცავს შემდეგ ველებს:
//name სუპერ გმირის სახელი
//superPower  სუპერ ძალა
//level - PowerLevel enum-ის ტიპის,
//და allies ამავე ტიპის მოკავშირეების ჩამონათვალი,
//დაამატეთ ინიციალიზაციის და დეინიციალიზაციის მეთოდები
//
//12.  მეთოდი addAlly დაამატებს მოკავშირეების სიას, შექმენით 2 SuperHero ობიექტი და გახადეთ ისინი მოკავშირეები.
print("\n 🔴🔴🔴 დავალება 9 & 12 🔴🔴🔴\n")
class SuperHero {
    var name: String
    var superPower: SuperPower
    var allies: [SuperHero]
    
    func addAlly(with superhero: SuperHero) {
        allies.append(superhero)
    }
    
    init(name: String, superPower: SuperPower, allies: [SuperHero]) {
        self.name = name
        self.superPower = superPower
        self.allies = allies
    }
    deinit {
        print("deinitialization")
    }
}

enum SuperPower: String {
    case flying
    case invisibility
    case superStrength
    case telepathy
    case speed
    
    var description: String {
        switch self {
        case .flying: return "flying"
        case .invisibility: return "invisibility"
        case .speed: return "speed"
        case .superStrength: return "super strength"
        case .telepathy: return "telepathy"
        }
    }
}
var superhero1 = SuperHero(name: "random1", superPower: .flying, allies: [])
var superhero2 = SuperHero(name: "random2", superPower: .superStrength, allies: [])
superhero1.addAlly(with: superhero2)
print("\(superhero1.name) made ally with \(superhero2.name)\n")

//10. შექმენით Enum PowerLevel, რომელიც მოიცავს შემდეგ დონეებს: weak, average, strong, super და დაამატეთ აღწერის მეთოდი რომელიც დააბრუნებს level-ს ტექსტური ფორმით.
//
print("\n 🔴🔴🔴 დავალება 10 🔴🔴🔴\n")
enum PowerLevel {
    case weak, average, strong, superStrong
    var description: String {
        switch self {
        case .weak: return "powere level is weak"
        case .average: return "powere level is average"
        case .strong: return "powere level is strong"
        case .superStrong: return "powere level is super strong"
        }
    }
}

var randomPowerLevel = PowerLevel.superStrong
print(randomPowerLevel)
//11. uniquePowers ყველა გმირისათვის და დააბრუნებს  უნიკალური ძალების სიას
//
print("\n 🔴🔴🔴 დავალება 11 🔴🔴🔴\n")
func uniquePowers(from superHeroesArray: [SuperHero]) -> [SuperPower] {
    var dictionary: [SuperPower : Int] = [:]
    var uniquePowers: [SuperPower] = []
    superHeroesArray.forEach {
        dictionary[$0.superPower, default: 0 ] += 1
    }
    dictionary.forEach { (power, frequency) in
        if  frequency == 1 {
            uniquePowers.append(power)
        }
    }
    return  uniquePowers
}

let superHeroesArray: [SuperHero] = [
    SuperHero(name: "Superman", superPower: .flying, allies: []),
    SuperHero(name: "Invisible Woman", superPower: .invisibility, allies: []),
    SuperHero(name: "Hulk", superPower: .superStrength, allies: []),
    SuperHero(name: "Professor X", superPower: .telepathy, allies: []),
    SuperHero(name: "Flash", superPower: .speed, allies: []),
    SuperHero(name: "Iron Man", superPower: .superStrength, allies: []),
    SuperHero(name: "Martian Manhunter", superPower: .telepathy, allies: []),
    SuperHero(name: "Wonder Woman", superPower: .superStrength, allies: []),
    SuperHero(name: "Green Lantern", superPower: .flying, allies: []),
    SuperHero(name: "Black Widow", superPower: .invisibility, allies: [])
]

var someUniquePowers = uniquePowers(from: superHeroesArray)
print("unique powers from superheroes array: ", terminator: "")
someUniquePowers.forEach { unique in
    print(unique, terminator: " ")
}


