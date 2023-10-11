import Foundation

class SuperEnemy {
    let name: String
    var hitPoints: Int
    
    init(name: String, hitPoints: Int) {
        self.name = name
        self.hitPoints = hitPoints
    }
}

protocol SuperHero {
    var name: String { get }
    var alias: String { get }
    var isEvil: Bool { get }
    var superPowers: [String: Int] { get }
    
    func attack(enemy: SuperEnemy) -> Int
    
    mutating func performSuperPower(enemy: SuperEnemy) -> Int
    
}

extension SuperHero {
    func getInfoOnSuperHero(hero: SuperHero) {
        print(hero.name, " has \(superPowers.keys) remaining")
    }
    
}


struct XCodeMan: SuperHero {
    var name: String = "XcodeMan"
    var alias: String = "Code Crusher"
    var isEvil: Bool = false
    var superPowers: [String : Int] = [
        "Playgroundmania" : 60,
        "FORCE UNRWAP" : 80
    ]
    
    func attack(enemy: SuperEnemy) -> Int {
        let attackStrength = Int.random(in: 20...40)
        var remainingHp = enemy.hitPoints - attackStrength
        enemy.hitPoints = remainingHp
        return enemy.hitPoints
    }
    
    mutating func performSuperPower(enemy: SuperEnemy) -> Int {
        if let (powerName, powerValue) = superPowers.randomElement() {
            var remainingHp = enemy.hitPoints - powerValue
            superPowers.removeValue(forKey: powerName)
            enemy.hitPoints = remainingHp
            return enemy.hitPoints
        }
        else  {return enemy.hitPoints}
    }
    
}

struct Batman: SuperHero {
    var name: String = "Batman"
    
    var alias: String = "HERO THAT GOTHAM DESERVES"
    
    var isEvil: Bool = false
    
    var superPowers: [String : Int] = [
        "Eye Beams" : 55,
        "Master Martial art" : 45
    ]
    
    
    func attack(enemy: SuperEnemy) -> Int {
        let attackStrength = Int.random(in: 20...40)
        var remainingHp = enemy.hitPoints - attackStrength
        enemy.hitPoints = remainingHp
        return enemy.hitPoints
    }
    
    mutating func performSuperPower(enemy: SuperEnemy) -> Int {
        if let (powerName, powerValue) = superPowers.randomElement() {
            var remainingHp = enemy.hitPoints - powerValue
            superPowers.removeValue(forKey: powerName)
            enemy.hitPoints = remainingHp
            return enemy.hitPoints
        }
        else  {return enemy.hitPoints}
    }
    
    
}


class SuperHeroSquad {
    var superheroes: [SuperHero]
    
    init(superheroes: [SuperHero]) {
        self.superheroes = superheroes
    }
    
    func nameAllHeroes() {
        for hero in superheroes {
            print(hero.name, terminator: ", ")
        }
    }
    
}



func simulateShowdown(heroes: SuperHeroSquad, enemy: SuperEnemy) {
    print(heroes.nameAllHeroes(), " VS ", enemy.name)
    print(enemy.name, " says: You should not have come here!")
    for i in heroes.superheroes {
        var hero = i
        hero.performSuperPower(enemy: enemy)
        print(hero.name, "has used a SuperPower! \(enemy.name)  has \(enemy.hitPoints) HP remaining")
        hero.getInfoOnSuperHero(hero: hero)
        while hero.superPowers.isEmpty == false  {
            hero.performSuperPower(enemy: enemy)
            print(hero.name, "has used a SuperPower! \(enemy.name) has \(enemy.hitPoints) HP remaining")
        }
        
        hero.attack(enemy: enemy)
        print(hero.name, " has Attacked, \(enemy.name) has \(enemy.hitPoints) HP remaining")
    }
    
    switch enemy.hitPoints {
    case 200...300:
        print("\(enemy.name) says : MUAHAHA, not even close, \(enemy.name) wins")
    case 100...200:
        print("\(enemy.name) says : Good fight Heroes, but I will never die")
    case 1...100:
        print("\(enemy.name) says : This hurt a lot, but I win")
    default:
        print("Congratulations Heroes, \(enemy.name) has fallen")
    }
}


let batman = Batman()
let xcodeman = XCodeMan()
let squad = SuperHeroSquad(superheroes: [batman, xcodeman])
let enemy = SuperEnemy(name: "ANDROID", hitPoints: 300)


simulateShowdown(heroes: squad, enemy: enemy)





