import Foundation

class PirateShip: Cannons {
    let name: String
    var cannonsCount: Int
    
    
    private var cargoManager: CargoManaging
    private var crewManager: CrewManaging
    
    init(name: String, cannonsCount: Int, cargoManager: CargoManager, crewManager: CrewManager) {
        self.name = name
        self.cannonsCount = cannonsCount
        self.cargoManager = CargoManager()
        self.crewManager = CrewManager()
    }
    
    func addCargo(_ cargo: String) {
        cargoManager.addCargo(cargo)
    }
    
    func removeCargo(_ cargo: String) {
        cargoManager.removeCargo(cargo)
    }
    
    func addCrew(_ crewMember: String) {
        crewManager.addCrew(crewMember)
    }
    
    func removeCrew(_ crewMember: String) {
        crewManager.removeCrew(crewMember)
    }
    
    func listCrew() -> [String] {
        return crewManager.listCrew()
    }
    
    func listCargo() -> [String] {
        return cargoManager.listCargo()
    }
    
    func fireCannon(count: Int) {
        if cannonsCount > count {
            print("Cannons have fired, bang bux babax")
        } else 
        {
          print("Aye Captain, we ain't got that much cannons")
        }
    }
}

protocol CargoManaging {
    func addCargo(_ cargo: String)
    func removeCargo(_ cargo: String)
    func listCargo() -> [String]
}

protocol CrewManaging {
    func addCrew(_ crewMember: String)
    func removeCrew(_ crewMember: String)
    func listCrew() -> [String]
}

protocol Cannons {
    func fireCannon(count: Int)
}



class CargoManager: CargoManaging {
    private var cargo: [String] = []
    
    func addCargo(_ cargo: String) {
        self.cargo.append(cargo)
    }
    
    func removeCargo(_ cargo: String) {
        self.cargo.removeAll { $0 == cargo }
    }
    
    func listCargo() -> [String] {
        return cargo
    }
}

class CrewManager: CrewManaging {
    private var crew: [String] = []
    
    func addCrew(_ crewMember: String) {
        self.crew.append(crewMember)
    }
    
    func removeCrew(_ crewMember: String) {
        self.crew.removeAll { $0 == crewMember }
    }
    
    func listCrew() -> [String] {
        return crew
    }
}


class Frigate: PirateShip {
    init(name: String) {
        super.init(name: name, cannonsCount: 80,cargoManager: CargoManager(), crewManager: CrewManager())
    }
}

class Galleon: PirateShip {
    init(name: String) {
        super.init(name: name, cannonsCount: 10,cargoManager: CargoManager(), crewManager: CrewManager())
        
    }
}

class TreasureMap {
    let x: Double
    let y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    func hintToTreasure(x1: Double, y1: Double) {   //აქ ძაან ვცადე რომ Keep it Simple, stupid, მაგრამ მგონი ვერ :დდდ
        let missedX = x1 - x
        let missedY = y1 - y
        var hints: [String] = []
        
        if missedX == 0 && missedY == 0 {
            print("You have found the treasure!")
        }
        else
        {
            if missedX > 0 {
                hints.append("Go West")
            } else if missedX < 0 {
                hints.append("Go East")
            }
        }
        if missedY > 0 {
            hints.append("Go South")
        } else if missedY < 0 {
            hints.append ("Go North")
        }
        print(hints.joined(separator: ", "))
        
    }
    
}


class SeaAdventure {
    let adventureType: String
    
    init(adventureType: String) {
        self.adventureType = adventureType
    }
    
    func encounter() {
        print(adventureType)
    }
}

class PirateCode {
    private func discussTerms(term: String) {
        print("Negotiations have begun: \(term)")
    }
    
    func parley(term: String) {
        discussTerms(term: term)
        print("Parley: We will make an agreement for \(term)!")
    }
    
    func mutiny(term: String) {
        discussTerms(term: term)
        print("Mutiny: We will not agree for \(term)!")
    }
}


let royalFortune = Frigate(name: "Royal Fortune")
let treasureMap = TreasureMap(x: 14, y: 9)
let pirateCode = PirateCode()
let adventure = SeaAdventure(adventureType: "Encounter with Flying Dutchman, what will you do?")



royalFortune.addCargo("Rum")
royalFortune.addCargo("Gold")
royalFortune.addCrew("Blackbeard")
royalFortune.addCrew("Goldy Hunter")
print(royalFortune.listCrew())
print(royalFortune.listCargo())

treasureMap.hintToTreasure(x1: 0, y1: 0)
treasureMap.hintToTreasure(x1: 10, y1: 10)
treasureMap.hintToTreasure(x1: 14, y1: 9)

print(adventure.adventureType)
pirateCode.mutiny(term: "Surrender")

royalFortune.fireCannon(count: 100)

print("To be continued...")



