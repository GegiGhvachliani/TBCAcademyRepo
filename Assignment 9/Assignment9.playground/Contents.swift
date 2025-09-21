import UIKit
import Foundation

//1. შექმენით "Genre" ტიპის enum, რომელიც შეიცავს წიგნის ჟანრებს (მაგ: fiction, nonFiction, mystery, sciFi, biography). დაამატეთ computed property "description", რომელიც დააბრუნებს ჟანრის აღწერას.
//
enum Genre: String {
    case fiction, nonFiction, mystery, sciFi, biography
    var description: String{
        switch self {
        case .fiction: return"Fiction — გამოგონილი ისტორია, ავტორის ფანტაზიის ნაყოფი"
        case .nonFiction: return "Non-Fiction — წიგნები რეალურ ფაქტებზე და ინფორმაციაზე დაფუძნებული"
        case .mystery:  return "Mystery — დეტექტიური და საიდუმლოებით სავსე სიუჟეტები"
        case .sciFi: return "Sci-Fi — სამეცნიერო ფანტასტიკა, ტექნოლოგიებზე და მომავალზე"
        case .biography: return "Biography — წიგნი რომელიმე ადამიანის ცხოვრების შესახებ"
        }
    }
}
//2. შექმენით enum "ReadingLevel" მნიშვნელობებით: beginner, intermediate, advanced. შემდეგ შექმენით პროტოკოლი "Readable" შემდეგი მოთხოვნებით:
//   - "title: String" ფროფერთი
//   - "author: String" ფროფერთი
//   - "publicationYear: Int" ფროფერთი
//   - "readingLevel: ReadingLevel" ფროფერთი
//   - "read()" მეთოდი, რომელიც დაბეჭდავს ინფორმაციას წიგნის წაკითხვის შესახებ, მაგ: "გილოცავთ თქვენ ერთ კლიკში წაიკითხეთ წიგნი" ან რამე სხვა, მიეცით ფანტაზიას გასაქანი 🤘
//
enum ReadingLevel: Int {
    case beginner, intermediate, advanced
}
protocol Readable {
    var title: String { get }
    var author: String { get }
    var publicationYear: Int { get }
    var readingLevel: ReadingLevel { get }
    
    func read()
}
//3. შექმენით სტრუქტურა "Book", რომელიც დააკმაყოფილებს "Readable" პროტოკოლს. დაამატეთ "genre: Genre" ფროფერთი და "description()" მეთოდი, რომელიც დაბეჭდავს სრულ ინფორმაციას წიგნზე.
//
struct Book: Readable {
    
    var title: String
    var author: String
    var publicationYear: Int
    var readingLevel: ReadingLevel
    var genre: Genre
    
    func description() {
        print(" title: \(title)\n author: \(author)\n publication year: \(publicationYear)\n reading level: \(readingLevel)")
    }
    func read() {
        print("გილოცავთ! თქვენ წაიკითხეთ წიგნი")
    }
}







extension Book: Comparable {
    static func < (lhs: Book, rhs: Book) -> Bool {
        lhs.readingLevel.rawValue < rhs.readingLevel.rawValue
    }
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.author == rhs.author && lhs.title == rhs.title
    }
}
//4. შექმენით "Library" კლასი შემდეგი ფროფერთებით:
//   - "name: String" - ბიბლიოთეკის სახელი
//   - "books: [Book]" - წიგნების მასივი
//
//   დაამატეთ მეთოდები:
//   - "add(book: Book)" - წიგნის დამატება
//   - "removeBookWith(title: String)" - წიგნის წაშლა სათაურის მიხედვით
//   - "listBooks()" - ყველა წიგნის ჩამონათვალის დაბეჭდვა
//
//  გააფართოვეთ “Library” კლასი “filterBooks” მეთოდით რომელიც არგუმენტად მიიღებს ქლოჟერს და დააბრუნებს ამ ქლოჟერის გამოყენებით გაფილტრულ წიგნთა მასივს.
//
class Library {
    var name: String
    var books = [Book]()
    
    init(name: String) {
        self.name = name
    }
    
   func add(book: Book) {
        books.append(book)
    }
   func removeBookWith(title: String) {
       books.removeAll { $0.title == title }
    }
    func listBooks() {
        if books.isEmpty {
            print("Library is empty!")
        } else {
            books.forEach {
                $0.description()
            }
        }
    }
}

extension Library {
    func filterBooks(by closure: (Book) -> Bool) -> [Book] {
        self.books.filter(closure)
    }
}
    
//5.  შექმენით generic ფუნქცია groupBooksByLevel<T: Readable>(_ books: [T]) -> [ReadingLevel: [T]], რომელიც დააჯგუფებს წიგნებს კითხვის დონის მიხედვით. გამოიყენეთ ეს ფუნქცია ბიბლიოთეკის წიგნებზე და დაბეჭდეთ შედეგი.
//
func groupBooksByLevel<T: Readable>(_ books: [T]) -> [ReadingLevel: [T]] {
    books.reduce(into: [ReadingLevel: [T]]()) {
        $0[$1.readingLevel, default: []].append($1)
    }
}
//6. შექმენით "LibraryMember" კლასი შემდეგი ფროფერთებით:
//   - "id: Int"
//   - "name: String"
//   - "borrowedBooks: [Book]"
//
//   დაამატეთ მეთოდები:
//   - "borrowBook(_ book: Book, from library: Library)" - წიგნის გამოწერა ბიბლიოთეკიდან
//   - "returnBook(_ book: Book, to library: Library)" - წიგნის დაბრუნება ბიბლიოთეკაში
//
class LibraryMember {
    let id: Int
    let name: String
    var borrowedBooks = [Book]()
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    func borrowBook(_ book: Book, from library: Library) {
        if library.books.contains(where: { $0 == book } ) {
            borrowedBooks.removeAll( where: { $0 == book } )
            library.add(book: book)
        } else {
            print("this book was not taken out under your name!")
        }
    }
    func returnBook(_ book: Book, to library: Library) {
        if borrowedBooks.contains(where: { $0 == book } ) {
            borrowedBooks.removeAll(where: { $0 == book } )
            library.add(book: book)
        } else {
            print("this book was not taken out under your name!")
        }
    }
}
//7. შექმენით მინიმუმ 5 "Book" ობიექტი და 1 "Library" ობიექტი. დაამატეთ წიგნები ბიბლიოთეკაში "add(book:)" მეთოდის გამოყენებით. შემდეგ:
//   - გამოიყენეთ "listBooks()" მეთოდი ყველა წიგნის ჩამოსათვლელად
//   - წაშალეთ ერთი წიგნი "removeBookWith(title:)" მეთოდის გამოყენებით
//   - გამოიყენეთ "filterBooks" მეთოდი და დაბეჭდეთ მხოლოდ ის წიგნები, რომლებიც გამოცემულია 2000 წლის შემდეგ
//
let books: [Book] = [
    Book(title: "იდიოტი", author: "ფიოდორ დოსტოევსკი", publicationYear: 1868, readingLevel: .advanced, genre: .mystery),
        Book(title: "ეშმაკნი", author: "ფიოდორ დოსტოევსკი", publicationYear: 1872, readingLevel: .advanced, genre: .fiction),
        Book(title: "მოთამაშე", author: "ფიოდორ დოსტოევსკი", publicationYear: 1867, readingLevel: .intermediate, genre: .fiction),
        Book(title: "დანაშაული და სასჯელი", author: "ფიოდორ დოსტოევსკი", publicationYear: 1866, readingLevel: .advanced, genre: .mystery),
        Book(title: "ძმები კარამაზოვები", author: "ფიოდორ დოსტოევსკი", publicationYear: 1880, readingLevel: .advanced, genre: .fiction)
]
let library1 = Library(name: "#1 public library")
books.forEach { library1.add(book: $0) }
library1.listBooks()
library1.removeBookWith(title: "ეშმაკნი")
var filteredArr = library1.filterBooks(by: { $0.publicationYear > 1850 } )
filteredArr.forEach { print($0.title, "release year is", $0.publicationYear) }
//8. შექმენით მინიმუმ 2 "LibraryMember" ობიექტი. თითოეული წევრისთვის:
//   - გამოიწერეთ 2 წიგნი "borrowBook(_:from:)" მეთოდის გამოყენებით
//   - დააბრუნეთ 1 წიგნი "returnBook(_:to:)" მეთოდის გამოყენებით
//   დაბეჭდეთ თითოეული წევრის გამოწერილი წიგნების სია
//
let person1 = LibraryMember(id: 0, name: "კვაჭი კვაჭანტირაძე")
person1.borrowBook(books[1], from: library1)
person1.borrowBook(books[3], from: library1)
person1.returnBook(books[1], to: library1)

let person2 = LibraryMember(id: 1, name: "ზე მორეირა")
person2.borrowBook(books[0], from: library1)
person2.borrowBook(books[2], from: library1)
person2.returnBook(books[0], to: library1)

print("person named \(person1.name) has taken following books from \(library1.name):")
person2.borrowedBooks.forEach { print($0.title) }
print("person named \(person2.name) has taken following books from \(library1.name):")
person2.borrowedBooks.forEach { print($0.title) }

