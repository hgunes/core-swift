//: # Protocol Oriented Programming
//: > Protocols tell you what to do and do not tell how
import UIKit

//protocol Humanable {
//    var name: String { get set } // { get set } only applies to computed properties
//    var race: String { get set }
//
//    func sayHi()
//}
//
//struct Turkish: Humanable {
//
//    var name = "Harun"
//    var race = "Turk"
//
//    func sayHi() {
//        print("Hi, I'm \(name)")
//    }
//}

/// protocols inherit
//protocol SuperHumanable: Humanable {
//    var canFly: Bool { get }
//
//    func punch()
//}
//
//
//struct SuperHuman: SuperHumanable {
//    var name = "Harun"
//    var race = "Turk"
//
//    func sayHi() {
//        print("Hi, I'm \(name). A super human!")
//    }
//
//    var canFly: Bool = true
//
//    func punch() {
//        print("I can punch!")
//    }
//}
//
//var superHuman = SuperHuman()
//superHuman.name
//superHuman.race
//superHuman.canFly = false
//print(superHuman.canFly)
//superHuman.sayHi()
//superHuman.punch()


/// `{ get set }`
//protocol Breathable {
//    var isBreathing: Bool { get set }
//    var isLiving: Bool { get }
//}
//
//struct BreathingHuman: Breathable {
//    var isBreathing: Bool {
//        get { return true }
//        set {} // set is a must here
//    }
//
//    var isLiving: Bool {
//        get { return true }
//        set {} // set is optional here
//    }
//}
//
//let human = BreathingHuman()
//human.isLiving

//: #### Protocol extensions

//protocol PersonalInfo {
//    var name: String { get set }
//
//    func speak()
//}
//
//extension PersonalInfo {
//    var name: String {
//        get { return "Harun" }
//        set {}
//    }
//
//    func speak() {
//        print("Hello, I'm \(name)")
//    }
//}
//
//struct User: PersonalInfo {
//    var name = "Shady" // overriding
//}
//
//var user = User()
//
//print(user.name)
//user.speak()

//protocol FindAreable {
//    func calculateArea(side: Double, lenght: Double) -> Double
//}
//
//extension FindAreable {
//    func calculateArea(side: Double, lenght: Double) -> Double {
//        side * lenght
//    }
//}
//
//struct Square: FindAreable {}
//
//Square.init().calculateArea(side: 4, lenght: 10)

//: ### Protocol as type
//protocol EastAsianable {
//    var useChopstics: Bool { get }
//    var origin: String { get }
//}
//
//extension EastAsianable {
//    var useChopstics: Bool {
//        return true
//    }
//}
//
//struct Korean: EastAsianable {
//    var origin: String = "Korea"
//}
//
//struct Japanese: EastAsianable {
//    var origin: String = "Japan"
//}
//
//struct Chinese: EastAsianable {
//    var origin: String = "China"
//}
//
//let eastAsians: [EastAsianable] = [Korean(), Japanese(), Chinese()]
//
////for eastAsian in eastAsians {
////    print("\(eastAsian.origin)")
////}
//
//func east(asians: [EastAsianable]) {
//    print(asians)
//}
//
//east(asians: eastAsians)

//: ### Delegate pattern

protocol SchoolFacility {
    func clean()
    func secure()
}

protocol WorkFacility {
    func employ()
    func pay()
    func fire()
}

class Government {
    
    var schoolFacilityDelegate: SchoolFacility?
    var workFacilityDelegate: WorkFacility?
    
    func manageSchool() {
        schoolFacilityDelegate?.clean()
        schoolFacilityDelegate?.secure()
    }
    
    func manageWork() {
        workFacilityDelegate?.employ()
        workFacilityDelegate?.pay()
        workFacilityDelegate?.fire()
    }
}

struct School: SchoolFacility {
    
    init(assigning: Government) {
        assigning.schoolFacilityDelegate = self
    }
    
    func clean() {
        print("We do da clening!")
    }
    
    func secure() {
        print("We secure!")
    }
}

class Work: WorkFacility {
    
    init(assigning: Government) {
        assigning.workFacilityDelegate = self
    }
    
    func employ() {
        print("We give people job!")
    }
    
    func pay() {
        print("We pay our employees")
    }
    
    func fire() {
        print("We can fire them!")
    }
}

class HRDepartment: Work {
    func train() {
        print("We provide training!")
    }
}

let government = Government()
let school = School(assigning: government)
let work = Work(assigning: government)

//school.clean()
//school.secure()
//
//work.employ()
//work.pay()
//work.fire()

let hrDepartment = HRDepartment(assigning: government)
hrDepartment.employ()
hrDepartment.train()
hrDepartment.fire()
