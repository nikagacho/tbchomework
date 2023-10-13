import Foundation

class StationModule {
    let moduleName: String
    var drone: Drone?
    
    init(moduleName: String, drone: Drone?) {
        self.moduleName = moduleName
        self.drone = drone
    }
    
    func giveDroneATask(task: String) {
        if let drone = drone {
            drone.task = task
        } else {print("There are no drones assigned to this module")}
    }
}



class ControlCenter: StationModule {
    private var isLockedDown: Bool
    private let securityCode: String
    
    init(isLockeddown: Bool, securityCode: String) {
        self.isLockedDown = isLockeddown
        self.securityCode = securityCode
        super.init(moduleName: "Control Center", drone: nil)
        
    }
    
    
    func lockdown(password: String) {
        if password == securityCode {
            isLockedDown = true
            print("Lockdown initialized")
        } else {
            print("ERROR, UNAUTHORIZED ACCESS!")
        }
    }
    
    func getInfoOnLockdown() {
        switch isLockedDown {
        case true:
            print("!!!Control Center is under LOCKDOWN!!!")
        case false:
            print("No lockdowns detected in the Control Center")
        }
    }
    
}


class ResearchLab: StationModule {
    private var samples: [String] = []
    
    func addSamples(sample: String) {
        samples.append(sample)
    }
}



class LifeSupportSystem: StationModule {
    private var oxygenLevel: Int
    
    init(oxygenLevel: Int) {
        self.oxygenLevel = oxygenLevel
        super.init(moduleName: "Life Support Module", drone: nil)
    }
    
    func getInfoOnOxygen() {
        print("Current Oxygen Level is \(oxygenLevel)")
    }
}




class Drone {
    var task: String?
    weak var assignedModule: StationModule?
    unowned var missionControlLink: MissionControl?
    
    init(task: String? = nil, assignedModule: StationModule? = nil, missionControlLink: MissionControl? = nil) {
        self.task = task
        self.assignedModule = assignedModule
        self.missionControlLink = missionControlLink
    }
    
    
    func getDroneStatus() {
        if task == nil {
            print("Drone is free at the moment, no tasks detected")
        } else {
            print("Drone is busy. It's \(task!)")
        }
    }
    
}


class SpaceStation {
    private let name: String
    
    let controlCenter = ControlCenter.init(isLockeddown: false, securityCode: "houstonraketa272")
    let researchLab = ResearchLab(moduleName: "Research Laboratory", drone: nil)
    let lifeSupport = LifeSupportSystem(oxygenLevel: 100)
    
    init(name: String) {
        self.name = name
    }
    
    let drone1 = Drone()
    let drone2 = Drone()
    let drone3 = Drone()
    
    func addDronesToCenters() {
        controlCenter.drone = drone1
        researchLab.drone = drone2
        lifeSupport.drone = drone3
    }
    
    
}



class MissionControl {
    var spaceStation: SpaceStation?
    
    
    func connectWithStation(station: SpaceStation) {
        spaceStation = station
    }
    func requestControlCenterStatus() {
        spaceStation?.controlCenter.getInfoOnLockdown()
    }
    
    func requestOxygenStatus() {
        spaceStation?.lifeSupport.getInfoOnOxygen()
    }
    
    func requestDroneStatus(drone: Drone) {
        drone.getDroneStatus()
    }
}


let orbitron = SpaceStation(name: "Orbitron Space Station")
let missionControl = MissionControl()
orbitron.addDronesToCenters()
missionControl.connectWithStation(station: orbitron)
missionControl.requestControlCenterStatus()
missionControl.spaceStation?.researchLab.giveDroneATask(task: "Looking for samples")
missionControl.spaceStation?.lifeSupport.giveDroneATask(task: "Maintaining Oxygen levels")
missionControl.spaceStation?.controlCenter.giveDroneATask(task: "Cleaning up the Module")
missionControl.requestOxygenStatus()
missionControl.requestDroneStatus(drone: orbitron.drone1)
missionControl.requestDroneStatus(drone: orbitron.drone2)
missionControl.requestDroneStatus(drone: orbitron.drone3)
missionControl.spaceStation?.controlCenter.lockdown(password: "15549Universe")
missionControl.spaceStation?.controlCenter.lockdown(password: "houstonraketa272")
missionControl.requestControlCenterStatus()



