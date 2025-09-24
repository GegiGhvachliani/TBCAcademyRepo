import UIKit
import Foundation
//1. შექმენით CreatureType enum-ი სხვადასხვა ტიპის ელემენტებით (მაგ: fire, water, earth, air, electric …). გამოიყენეთ associated value, რომ თითოეულ ტიპს ჰქონდეს rarity: Double მნიშვნელობა 0-დან 1-მდე. დაამატეთ computed property description, რომელიც დააბრუნებს არსების ტიპის აღწერას. 
//
extension Double {
    var zeroToOne: Double {
        min(max(self, 0), 1)
    }
}

enum CreatureType {
    
    case fire(rarity: Double)
    case water(rarity: Double)
    case earth(rarity: Double)
    case air(rarity: Double)
    case electric(rarity: Double)
    
    var description: Double {
        switch self { // ან where დაამუღამე
        case .fire(var rarity): if rarity > 0 && rarity < 1.0 { return rarity } else { return 0.0 }
        case .water(var rarity): if rarity > 0 && rarity < 1.0 { return rarity } else { return 0.0 }
        case .earth(var rarity): if rarity > 0 && rarity < 1.0 { return rarity } else { return 0.0 }
        case .air(var rarity): if rarity > 0 && rarity < 1.0 { return rarity } else { return 0.0 }
        case .electric(var rarity): if rarity > 0 && rarity < 1.0 { return rarity } else { return 0.0 }
        }
    }
}
var b = CreatureType.air(rarity: 0.3)
b.description
//2. შექმენით პროტოკოლი CreatureStats შემდეგი მოთხოვნებით:
//var health: Double
//var attack: Double
//var defense: Double
//func updateStats(health: Double, attack: Double, defense: Double) მეთოდი, რომელიც განაახლებს ამ მონაცემებს (შეგიძლიათ ფუნქციის პარამეტრები სურვილისამებრ შეცვალოთ, მაგ: დეფოლტ მნიშვნელობები გაუწეროთ 😌) 
protocol CreatureStats {
    var health: Double { get set }
    var attack: Double { get set }
    var defense: Double { get set }
    
    func updateStats(health: Double, attack: Double, defense: Double)
}
//3. შექმენით კლასი Trainer შემდეგი ფროფერთებით:
//public let name: String
//private var creatures: [DigitalCreature]
//დაამატეთ public მეთოდი add(creature: DigitalCreature) რომლითაც შეძლებთ ახალი არსების დამატებას მასივში, ასევე არსებას საკუთარ თავს (self) დაუსეტავს ტრენერად.
//
class Trainer {
    public let name: String
    private var creatures: [DigitalCreature]
    
    public func remove(creature: DigitalCreature) {
        creatures.removeAll { $0 === creature }
        creature.trainer = nil

    }
    public func add(creature: DigitalCreature) {
        creatures.append(creature)
        creature.trainer = self
    }
    init(name: String, creatures: [DigitalCreature]) {
        self.name = name
        self.creatures = creatures
    }
}
//4. შექმენით კლასი DigitalCreature, რომელიც დააკმაყოფილებს CreatureStats პროტოკოლს. დაამატეთ:
//public let name: String
//public let type: CreatureType
//public var level: Int
//public var experience: Double
//weak public var trainer: Trainer?
//დაამატეთ deinit მეთოდი, რომელიც დაბეჭდავს შეტყობინებას არსების წაშლისას. 
//
//

class DigitalCreature: CreatureStats {
    public let name: String
    public let type: CreatureType
    public var level: Int
    public var experience: Double
    weak public var trainer: Trainer?
    
    var health: Double
    var attack: Double
    var defense: Double
    
    init(name: String, type: CreatureType, level: Int, experience: Double, trainer: Trainer? = nil, health: Double, attack: Double, defense: Double) {
        self.name = name
        self.type = type
        self.level = level
        self.experience = experience
        self.trainer = trainer
        self.health = health
        self.attack = attack
        self.defense = defense
    }
    
    func updateStats(health: Double = 100, attack: Double = 30, defense: Double = 20) {
        self.health = health
        self.attack = attack
        self.defense = defense
    }
    func statisticPrinter() {
        print("""
            \n
              \(name) statistic
            attack: \(attack)
            defense: \(defense)
            health: \(health)
            \n
            """)
    }
    
    deinit {
        print("\(name) has been dealocated")
    }
}





//5. შექმენით CreatureManager კლასი შემდეგი ფუნქციონალით:
//private var creatures: [DigitalCreature] - არსებების მასივი
//public func adoptCreature(_ creature: DigitalCreature) - არსების დამატება
//public func trainCreature(named name: String) - კონკრეტული არსების წვრთნა (გაითვალისწინეთ რომ წვრთნა მოხდება მხოლოდ მაშინ თუ არჩეულ არსებას ყავს მწვრთნელი!)
//public func listCreatures() -> [DigitalCreature] - ყველა არსების სიის დაბრუნება გააფართოვეთ CreatureManage კლასი მეთოდით func trainAllCreatures(), რომელიც გაწვრთნის ყველა არსებას. 
class CreatureManager {
    private var creatures: [DigitalCreature]  = []
    
    init(creatures: [DigitalCreature] = []) {
        self.creatures = creatures
    }
    
    public func adoptCreature(_ creature: DigitalCreature) {
        creatures.append(creature)
        
    }
    public func trainCreature(named name: String) {
        creatures.forEach { creature in
            if creature.name == name && creature.trainer != nil {
                creature.updateStats()
            }
        }
    }
    
    public func listCreatures() -> [DigitalCreature] { creatures }
}

extension CreatureManager {
    func trainAllCreatures() {
        creatures.forEach {
            if $0.trainer != nil { $0.updateStats() }
        }
    }
}


//6. შექმენით CreatureShop კლასი მეთოდით purchaseRandomCreature() -> DigitalCreature. ეს მეთოდი დააბრუნებს რანდომიზირებულად დაგენერირებულ არსებას. 
//
func randomStringGenerator () -> String {
    var randomString: String = "random_"
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    randomString += String((1...5).map { _ in
        letters.randomElement()!
    })
    return randomString
}
extension CreatureType {
    /// რენდომ DigitalCreature-ის რენდომ CreatureType-ის  დასაგენირებლად. რადგან :CaseIterable პროტოკოლს ვერ ვიყენებ
    static var ownAllCases: [CreatureType] {
        return     [
            .air(rarity: 0.2),
            .earth(rarity: 0.3),
            .electric(rarity: 0.15 ),
            .fire(rarity: 0.5),
            .water(rarity: 0.4)
        ]
    }
}

class CreatureShop {
    func purchaseRandomCreature() -> DigitalCreature {
        let randomName: String = randomStringGenerator()
        let randomType: CreatureType = CreatureType.ownAllCases.randomElement()!
        let randomLevel: Int = Int.random(in: 1...100)
        let randomExperience: Double = Double.random(in: 0.5...10.5)
        let randomHealthLevel: Double = Double.random(in: 1...300)
        let randomAttackLevel: Double = Double.random(in: 1...400)
        let randomDefenceLevel: Double = Double.random(in: 1...200)
        
        return DigitalCreature(name: randomName, type: randomType, level: randomLevel, experience: randomExperience, health: randomHealthLevel, attack: randomAttackLevel, defense: randomDefenceLevel)
    }
}





//7. შექმენით გლობალური ფუნქცია updateLeaderboard(players: [CreatureManager]) -> [CreatureManager], რომელიც დაალაგებს მოთამაშეებს მათი არსებების ჯამური ძალის მიხედვით.  
//
extension CreatureManager: Comparable {
    static func < (lhs: CreatureManager, rhs: CreatureManager) -> Bool {
        let lhsTotalPower = lhs.creatures.reduce(into: 0) { sum, creature in
            sum += creature.attack + creature.defense + creature.health
        }
        let rhsTotalPower = rhs.creatures.reduce(into: 0) { sum, creature in
            sum += creature.attack + creature.defense + creature.health
        }
        return lhsTotalPower < rhsTotalPower
    }
    
    static func == (lhs: CreatureManager, rhs: CreatureManager) -> Bool {
        let lhsTotalPower = lhs.creatures.reduce(into: 0) { sum, creature in
            sum += creature.attack + creature.defense + creature.health
        }
        let rhsTotalPower = rhs.creatures.reduce(into: 0) { sum, creature in
            sum += creature.attack + creature.defense + creature.health
        }
        return lhsTotalPower == rhsTotalPower
    }
}
func updateLeaderBoard(players: [CreatureManager]) -> [CreatureManager] {
   let sortedLeaderBoard = players.sorted(by: > )
    return sortedLeaderBoard
}





//8. გამოვიყენოთ წინა ტასკებში შექმნილი ყველა ფუნქციონალი:
//შექმენით რამდენიმე Trainer ობიექტი
var trainer1 = Trainer(name: "Trainer1", creatures: [])
var trainer2 = Trainer(name: "Trainer2", creatures: [])
var trainer3 = Trainer(name: "Trainer3", creatures: [])
var trainer4 = Trainer(name: "Trainer4", creatures: [])
var trainer5 = Trainer(name: "Trainer5", creatures: [])
//შექმენით რამდენიმე CreatureManager ობიექტი
var manager1 = CreatureManager()
var manager2 = CreatureManager()
var manager3 = CreatureManager()
var manager4 = CreatureManager()
var manager5 = CreatureManager()

var managers: [CreatureManager] = [
                                    manager1,
                                    manager2,
                                    manager3,
                                    manager4,
                                    manager5
]
//შექმენით ერთი ან ორი CreatureShop
var creatureShop1 = CreatureShop()
var creatureShop2 = CreatureShop()
//თითოეული მენეჯერისთვის:
//შეიძინეთ რამდენიმე შემთხვევითი არსება CreatureShop-იდან
managers.forEach{
    $0.adoptCreature(creatureShop1.purchaseRandomCreature())
    $0.adoptCreature(creatureShop1.purchaseRandomCreature())
    $0.adoptCreature(creatureShop1.purchaseRandomCreature())
}
//მიაბარეთ რამდენიმე არსება რომელიმე ტრენერს.
var creature1 = DigitalCreature(name: "bob", type: .air(rarity: 0.3), level: 15, experience: 3.4, health: 132, attack: 2000, defense: 500)
var creature2 = DigitalCreature(name: "gog", type: .earth(rarity: 0.2), level: 99, experience: 131, health: 1300, attack: 200, defense: 205)
var creature3 = DigitalCreature(name: "pop", type: .fire(rarity: 0.4), level: 103, experience: 1300, health: 23, attack: 3000, defense: 100)

trainer1.add(creature: creature1)
trainer1.add(creature: creature2)
trainer1.add(creature: creature3)

//სცადეთ არსებების წვრთნა CreatureManager-ის trainCreature(named:) მეთოდით
manager1.adoptCreature(creature1)
manager1.adoptCreature(creature2)
manager1.adoptCreature(creature3)

manager1.trainCreature(named: "bob")
manager1.trainCreature(named: "gog")
var randomCreature = manager1.listCreatures()[0]
manager1.trainCreature(named: randomCreature.name)

//გამოიყენეთ CreatureManager-ის trainAllCreatures() მეთოდი ყველა მოთამაშის არსებების საწვრთნელად (თუ ყავს მწვრთნელი, რა თქმა უნდა)
managers.forEach {
    $0.trainAllCreatures()
}
//განაახლეთ ლიდერბორდი updateLeaderboard() ფუნქციის გამოყენებით
updateLeaderBoard(players: managers)
//დაბეჭდეთ თითოეული მოთამაშის არსებების სია და მათი სტატისტიკა
managers.forEach {
    $0.listCreatures().forEach {
        $0.statisticPrinter()
    }
}
//წაშალეთ ერთი არსება რომელიმე Trainer-იდან და აჩვენეთ, რომ weak reference მუშაობს სწორად (დაბეჭდეთ არსების trainer property-ს მნიშვნელობა წაშლამდე და წაშლის შემდეგ)
//დააკვირდით deinit მეთოდის გამოძახებას არსების წაშლისას --->
//MARK: მე ხომ მხოლოდ trainer-იდან ვშლი DigitalCreature-ს და არ ვშლი მთლიანად digitalCreature-ს. რატომ უნდა გამოიძახოს deinit() ვერ გავიგე.
print(creature1.trainer?.name ?? "no trainer")
trainer1.remove(creature: creature1)
print(creature1.trainer?.name ?? "no trainer")


print()
print()
print()
print()
print()
print()
print()
print()
print()
print()


