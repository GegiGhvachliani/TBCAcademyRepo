import Foundation
import UIKit
 
print("Task 1")
print("------")
// 1
 
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
// return (rarity > 0 && rarity < 1.0) ? rarity : 0.0
var creature = CreatureType.fire(rarity: 5)
print(creature.description)
 
// 2
 
protocol CreatureStats {
    var health: Double { get }
    var attack: Double { get }
    var defense: Double { get }
    
    func updateStats(health: Double, attack: Double, defense: Double)
    // მაგ: დეფოლტ მნიშვნელობები გაუწეროთ?
}
 
// 3
 
class Trainer {
    public let name: String
    private var creatures: [DigitalCreature]
    
    public func add(creature: DigitalCreature) {
        creatures.append(creature) // self?
        creature.trainer = self
    }
    
    init(name: String, creatures: [DigitalCreature]) {
        self.name = name
        self.creatures = creatures
    }
}
 
// 4
 
class DigitalCreature: CreatureStats {
    var health: Double = 100
    var attack: Double = 30
    var defense: Double = 50
    
    func updateStats(health: Double, attack: Double, defense: Double) {
        self.health += health // თუ += ჯობს, რომ დაამატოს მნიშვნელობა ყოველ ჯერზე
        self.attack += attack //
        self.defense += defense
    }
    
    public let name: String
    public let type: CreatureType
    public var level: Int
    public var experience: Double
    weak public var trainer: Trainer?
    
    init(name: String, type: CreatureType, level: Int, experience: Double, trainer: Trainer? = nil) {
        self.name = name
        self.type = type
        self.level = level
        self.experience = experience
        self.trainer = trainer
    }
    
    deinit {
        print("\(name) is no longer with us. RIP.")
    }
}
// ესე უნდა იყოს ხო? არ უნდა ვუწერდეთ შიგნით health, attack და defence-ს?
 
 
// 5
 
class CreatureManager {
    private var creatures: [DigitalCreature] = []
    public func adoptCreature(_ creature: DigitalCreature) {
        creatures.append(creature)
        // აქ რამე უნდა კიდე?
    }
    public func trainCreature(named name: String) {
        creatures.forEach {
            if $0.name == name && $0.trainer != nil {
                $0.updateStats(health: 10, attack: 10, defense: 10) // ანუ ვარჯიშის მერე ემატება სტატები
            } else {
                print("Creature doesn't have a trainer or there's no such creature named \(name)")
            }
        }
    }
    public func listCreatures() -> [DigitalCreature] {
        return creatures // სწორია?
    }
    
    init(creatures: [DigitalCreature]) {
        self.creatures = creatures
    }
}
 
extension CreatureManager {
    func trainAllCreatures() { // if trainer != tra
       creatures.forEach { $0.updateStats(health: 10, attack: 10, defense: 10)}
    }
}
 
 
// 6
 
class CreatureShop {
    func purchaseRandomCreature() -> DigitalCreature {
        var randomNames = ["Alien","The Thing","Frankenstein","Werewolf","Meduse"].randomElement()!
        
        var randRarity: Double = Double.random(in: 0...1)
        
        var randomTypes = [CreatureType.air(rarity: randRarity), CreatureType.earth(rarity: randRarity), CreatureType.electric(rarity: randRarity), CreatureType.fire(rarity: randRarity), CreatureType.water(rarity: randRarity)].randomElement()!
        
        var randomLevel = Int.random(in: 1...100)
        var randomExperience: Double = Double.random(in: 1...1000)
        
        return DigitalCreature(name: randomNames, type: randomTypes, level: randomLevel, experience: randomExperience)
        
    } // Health, Attack, Defense ყოველთვის იგივე იქნება
    // radnom type გააკეთე
}
 
// 7
 
func updateLeaderBoard(players: [CreatureManager]) -> [CreatureManager] {
    return players.sorted { manager1, manager2 in
        let left = manager1.listCreatures().reduce(0) { sum, creature in
            sum + (creature.attack + creature.defense + creature.health)
        }
        let right = manager2.listCreatures().reduce(0) { sum, creature in
            sum + (creature.attack + creature.defense + creature.health)
        }
        return left > right
    }
}
 
//var sortedManagers = updateLeaderBoard(players: [manager1, manager2, manager3, manager4])
//sortedManagers
 
 
//8 გამოვიყენოთ წინა ტასკებში შექმნილი ყველა ფუნქციონალი:
//შექმენით რამდენიმე Trainer ობიექტი
//შექმენით რამდენიმე CreatureManager ობიექტი
//შექმენით ერთი ან ორი CreatureShop
//თითოეული მენეჯერისთვის:
//შეიძინეთ რამდენიმე შემთხვევითი არსება CreatureShop-იდან
//მიაბარეთ რამდენიმე არსება რომელიმე ტრენერს.
//სცადეთ არსებების წვრთნა CreatureManager-ის trainCreature(named:) მეთოდით
//გამოიყენეთ CreatureManager-ის trainAllCreatures() მეთოდი ყველა მოთამაშის არსებების საწვრთნელად (თუ ყავს მწვრთნელი, რა თქმა უნდა)
//განაახლეთ ლიდერბორდი updateLeaderboard() ფუნქციის გამოყენებით
//დაბეჭდეთ თითოეული მოთამაშის არსებების სია და მათი სტატისტიკა
//წაშალეთ ერთი არსება რომელიმე Trainer-იდან და აჩვენეთ, რომ weak reference მუშაობს სწორად (დაბეჭდეთ არსების trainer property-ს მნიშვნელობა წაშლამდე და წაშლის შემდეგ)
//დააკვირდით deinit მეთოდის გამოძახებას არსების წაშლისას
 
var creature1 = DigitalCreature(name: "Godzila", type: .fire(rarity: 0.1), level: 5, experience: 150.0)
var creature2 = DigitalCreature(name: "Predator", type: .earth(rarity: 0.5), level: 3, experience: 90.0)
var creature3 = DigitalCreature(name: "Dracula", type: .air(rarity: 0.9), level: 10, experience: 40.0)
var creature4 = DigitalCreature(name: "Phoenix", type: .fire(rarity: 0.95), level: 12, experience: 60.0)
var creature5 = DigitalCreature(name: "Kraken", type: .water(rarity: 0.85), level: 15, experience: 80.0)
var creature6 = DigitalCreature(name: "Golem", type: .earth(rarity: 0.7), level: 8, experience: 30.0)
var creature7 = DigitalCreature(name: "Wraith", type: .air(rarity: 0.92), level: 11, experience: 50.0)
var creature8 = DigitalCreature(name: "Sylph", type: .air(rarity: 0.88), level: 9, experience: 45.0)
 
//creature1.updateStats(health: 130, attack: 50, defense: 30)
//creature1 = DigitalCreature(name: "Godzila", type: .fire(rarity: 0.1), level: 5, experience: 150.0)
 
 
//შექმენით რამდენიმე Trainer ობიექტი
var trainer1 = Trainer(name: "Jackie Chan", creatures: [])
var trainer2 = Trainer(name: "Bruce Lee", creatures: [])
var trainer3 = Trainer(name: "Jean-Claude Van Damme", creatures: [])
 
//print("\(creature1.name) has a trainer - \(creature1.trainer?.name ?? "Lonely Creature, No Trainer.")")
 
//შექმენით რამდენიმე CreatureManager ობიექტი
var manager1 = CreatureManager(creatures: [])
var manager2 = CreatureManager(creatures: [])
var manager3 = CreatureManager(creatures: [])
var manager4 = CreatureManager(creatures: [])
 

manager1.adoptCreature(creature1)
manager1.adoptCreature(creature2)
manager1.adoptCreature(creature3)
//manager1.adoptCreature(creature3)
//manager1.creatures.count
//manager1.trainAllCreatures()
//manager1.trainCreature(named: "Dracula")
//manager1.creatures
 
//შექმენით ერთი ან ორი CreatureShop
var creatureShop = CreatureShop()
 
var randomCreature1 = creatureShop.purchaseRandomCreature()
var randomCreature2 = creatureShop.purchaseRandomCreature()
//randomCreature1
 
//თითოეული მენეჯერისთვის:
//შეიძინეთ რამდენიმე შემთხვევითი არსება CreatureShop-იდან
//მიაბარეთ რამდენიმე არსება რომელიმე ტრენერს.
//სცადეთ არსებების წვრთნა CreatureManager-ის trainCreature(named:) მეთოდით
//გამოიყენეთ CreatureManager-ის trainAllCreatures() მეთოდი ყველა მოთამაშის არსებების საწვრთნელად (თუ ყავს მწვრთნელი, რა თქმა უნდა)
//განაახლეთ ლიდერბორდი updateLeaderboard() ფუნქციის გამოყენებით
//დაბეჭდეთ თითოეული მოთამაშის არსებების სია და მათი სტატისტიკა
//წაშალეთ ერთი არსება რომელიმე Trainer-იდან და აჩვენეთ, რომ weak reference მუშაობს სწორად (დაბეჭდეთ არსების trainer property-ს მნიშვნელობა წაშლამდე და წაშლის შემდეგ)
//დააკვირდით deinit მეთოდის გამოძახებას არსების წაშლისას
 
//manager1.adoptCreature(randomCreature1)
//manager1.adoptCreature(randomCreature2)
//
//მიაბარეთ რამდენიმე არსება რომელიმე ტრენერს.
trainer1.add(creature: creature1)
trainer1.add(creature: creature2)
trainer1.add(creature: creature3)
 
trainer2.add(creature: creature4)
trainer2.add(creature: creature5)
 
trainer3.add(creature: creature6)
trainer3.add(creature: creature7)
 
//სცადეთ არსებების წვრთნა CreatureManager-ის trainCreature(named:) მეთოდით
var creat = manager1.listCreatures()[0]
 
manager1.trainCreature(named: creat.name)
