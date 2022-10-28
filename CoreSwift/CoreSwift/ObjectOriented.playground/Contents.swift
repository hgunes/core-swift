//: # Object Oriented Programming

import UIKit

//: ### Convenience init
//: > Secondary initializer

//extension UIColor {
//    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
//        self.init(displayP3Red: r/255, green: g/255, blue: b/255, alpha: 1)
//    }
//}

//class Person {
//    var fullName: String
//
//    init(name: String) {
//        fullName = name
//    }
//}
//
//extension Person {
//
//    convenience init(firstName: String, lastName: String) {
//        self.init(name: "\(firstName) \(lastName)")
//    }
//}
//
//let person1 = Person(firstName: "Harun", lastName: "Gunes")
//let person2 = Person(name: "Sheena Naidu")
//
//print(person1.fullName)
//print(person2.fullName)

//: ### Computed properties

//var radius: Double = 10
//
//var diameter: Double {
//    get {
//        return radius * 2
//    }
//
//    set {
//        radius = newValue / 2
//    }
//}
//
//diameter = 45
//radius
//
//var side: Double = 45
//
//var area: Double {
//    get {
//        return side * side
//    }
//
//    set(newArea) {
//        side = sqrt(newArea)
//    }
//}
//
//area = 225
//side

//var firstName = "Harun"
//var lastName = "Gunes"
//
//var fullname: String {
//    get {
//        return "\(firstName) \(lastName)"
//
//    }
//
//    set(newName) {
//        let nameArray = newName.components(separatedBy: " ")
//        firstName = nameArray[0]
//        lastName = nameArray[1]
//    }
//
//}
//
//print(fullname)
//
//fullname = "Sheena Naidu"
//
//print(firstName)
//print(lastName)

//: ### Property observers

//var text: String = "Hello" {
//    willSet(newValue) {
//        print("New text assigning! \(newValue)")
//    }
//
//    didSet {
//        print("New text assigned!")
//    }
//}

//text = "Hi!"

//var percentage: Int = 10 {
      /// willSet has access only to newValue
//    willSet {
//        print("The final growth ia %\(newValue)")
//    }
//
      /// didSet has access only to oldValue
//    didSet {
//        print("Previous growth: %\(oldValue)")
//    }
//}
//
//percentage = 78

//: ### Failable init

//enum NoName: Error {
//    case noName
//}
//
//class Blog {
//    let name: String
//
//    init?(name: String) throws {
//        if !name.isEmpty {
//            self.name = name
//        } else {
//            throw NoName.noName
//        }
//
//
//    }
//}
//
//do {
//    let newBlog = try Blog(name: "")
//    print(newBlog!.name)
//} catch NoName.noName {
//    print("Please enter your name")
//}

//class Company {
//
//    var growth: Double
//
//
//    init?(growth: Double) throws {
//        if String(growth).isEmpty {
//            throw NoName.noName
//        } else {
//            self.name = name
//        }
//    }
//
//}
//
//do {
//    let company = try Company
//    print(company!.growth)
//} catch NoName.noName {
//    print("Company has no growth")
//}

//: ### Override method, init, property

//class Vehicle {
//
//    var description: String {
//        return "I am moving by 100 km/h"
//    }
//
//    func warning() {
//        print("Be careful, I am pretty fast!")
//    }
//}
//
//class ToyCar: Vehicle {
//    override var description: String {
//        return "\(super.description), I should slow down."
//    }
//
//    override func warning() {
//        print("I am a toy car")
//        super.warning()
//    }
//}
//
//let toyCar = ToyCar()
//
//toyCar.description
//toyCar.warning()

//class Human {
//    var origin: String
//
//    init(enterOrigin: String) {
//        origin = enterOrigin
//    }
//}
//
//class Turkish: Human {
//    var city: String
//
//    init(enterCity: String) {
//        city = enterCity
//        super.init(enterOrigin: "Turkish")
//    }
//}

//let turk = Turkish(enterCity: "Erzurum")
//print(turk.city)
//print(turk.origin)

//class CustomHuman: Human {
//
//    var name: String
//    var city: String
//
//    init(name: String, city: String) {
//        self.name = name
//        self.city = city
//        super.init(enterOrigin: "Custom place")
//    }
//
//    init(name: String, city: String, enterOrigin country: String) {
//        self.name = name
//        self.city = city
//        super.init(enterOrigin: country)
//    }
//}
//
//let customHuman = CustomHuman(name: "Harun", city: "Lodz")
//
//print(customHuman.city)
//print(customHuman.name)
//print(customHuman.origin)
//
//let customHuman2 = CustomHuman(name: "Harun", city: "Lodz, Poland", enterOrigin: "Erzurum, Turkey")
//
//print(customHuman2.city)
//print(customHuman2.name)
//print(customHuman2.origin)

//enum Breed {
//    case stray
//    case rottweiler
//    case pitbull
//}
//
//class Dog {
//
//    var breed = Breed.pitbull
//    var name = "Maggie"
//
//    var age: Int {
//        return 5
//    }
//
//    func run() {
//        print("Running")
//    }
//}
//
//class Shady: Dog {
//
    // Cannot override a stored property
//    override var breed: Breed = .rottweiler
//    override var name: String = "Shady"
//
//    override var age: Int {
//        return 2
//    }
//
//    override func run() {
//        print("Running and barking")
//    }
//}
//
//let shady = Shady()
//shady.age
//shady.run()

//class Planet {
//
//    var diameter: Double
//
//    init(diameter: Double) {
//        self.diameter = diameter
//    }
//}
//
//class Earth: Planet {
//
//    var mainElement: String
//
//    init(mainElement: String) {
//        self.mainElement = mainElement
//        super.init(diameter: 5000)
//    }
//
//    init(mainElement: String, diameter: Double) {
//        self.mainElement = mainElement
//        super.init(diameter: diameter)
//    }
//}
//
//let earth = Earth(mainElement: "Water")
//let earth2 = Earth(mainElement: "Su", diameter: 1500)
//
//print(earth.diameter)
//print(earth2.mainElement)
//print(earth2.diameter)

//: ### Two-phase init

//struct NuclearRocket {
//    var meters: Double
//    var liters: Double
//
//    /// init for Turkiye
//    init(meters: Double, liters: Double) {
//        self.meters = meters
//        self.liters = liters
//    }
//
//    /// init for USA
//    init(ft: Double, gallon: Double) {
//        let convertedMeters = ft / 3.28
//        let convertedLiters = gallon * 3.78
//
//        self.init(meters: convertedMeters, liters: convertedLiters)
//    }
//}
//
//let turk = NuclearRocket(meters: 200, liters: 500)
//
//turk.meters
//
//let american = NuclearRocket(ft: 150, gallon: 350)
//
//american.meters

//struct Distance {
//
//    var cm: Double
//    var meter: Double
//
//    init(cm: Double, meter: Double) {
//        self.cm = cm
//        self.meter = meter
//    }
//
//    init(inch: Double, feet: Double) {
//        let convertedCm = inch / 0.39
//        let convertedMeter = feet / 3.28
//
//      /// self initialization is possible with structs
//      /// and convenience init for classes
//        self.init(cm: convertedCm, meter: convertedMeter)
//    }
//}
//
//let distanceToHome = Distance(cm: 25, meter: 30)
//let dissHome = Distance(inch: 3.93, feet: 98.43)
//
//print(dissHome.meter)
//print(dissHome.cm)

//: ### Type property and method
//: > static cannot be overriden; class can be

//struct SomeStruct {
//    static var someText = "this is statict"
//
//    static func sayHello() -> String {
//        return "Hello!"
//    }
//}
//
//SomeStruct.someText
//SomeStruct.sayHello()

//class SomeClass {
//    static var age = 32
//
//    static func printAge() {
//        print(age)
//    }
//
//    class func printingAge() {
//        print(age)
//    }
//
//}
//
//class NewClass: SomeClass {
//    override class func printingAge() {
//        print("I am \(age) yr old.")
//    }
//}
//
//SomeClass.age = 15
//SomeClass.printAge()
//
//NewClass.age = 56
//NewClass.printingAge()

//class SomeInfo {
//
//    static var name = "Harun"
//
//    class func age() {
//        print("31")
//    }
//
//    static func locate() {
//        print("Lodz")
//    }
//}
//
//class Information: SomeInfo {
//    override class func age() {
//        print("32")
//    }
//}
//
//Information.locate()
//print(Information.name)
//Information.age()

//: ### Singleton

//class SomethingSingleton {
//
//    static let shared = SomethingSingleton()
//
//    var name = "Something singleton"
//
//    private init() {}
//}
//
//SomethingSingleton.shared.name

//: ### Classes vs Structs


/// Default initializer sets up fields
/// Function must be mutating to change struct values
//struct AnimalStruct {
//
//    let name: String
//    var pos: Int
//    let maxSpeed: Int
//
//    mutating func run() {
//        self.pos += self.maxSpeed
//    }
//
//    func makeNoise() {
//        print("Some animal noise")
//    }
//
//}

/// Must create custom initializer
//class AnimalClass {
//
//    let name: String
//    var pos: Int
//    let maxSpeed: Int
//
//    init(name: String, pos: Int, maxSpeed: Int) {
//        self.name = name
//        self.pos = pos
//        self.maxSpeed = maxSpeed
//    }
//
//    func run() {
//        self.pos += self.maxSpeed
//    }
//
//    func makeNoise() {
//        print("Some animal noise")
//    }
//
//}

//: > By value vs by reference
//var dog = AnimalStruct(name: "Dog", pos: 10, maxSpeed: 4)
//var husky = dog
//dog.pos = 5
//dog.pos
//husky.pos
//
//var cat = AnimalClass(name: "Cat", pos: 3, maxSpeed: 3)
//var tabby = cat
//cat.pos = 10
//cat.pos
//tabby.pos
//
//: > Only classes can be subclassed
//class DogClass: AnimalClass {
//
//    override func makeNoise() {
//        print("Woof!")
//    }
//
//}
//
//// Compilation error
////struct DogStruct: AnimalStruct {
////
////}
//
//: > Cannot change a constant struct but can change a constant class
//let tortoise = AnimalClass(name: "Tortoise", pos: 5, maxSpeed: 1)
//tortoise.pos = 10
//tortoise.pos
//
//let hare = AnimalStruct(name: "Hare", pos: 0, maxSpeed: 5)
// Compilation error
//hare.pos = 5

//: ### ViewModel

//class Car {
//
//    var year: Int
//    var make: String
//    var color: UIColor
//    var doors: Int
//
//    init(year: Int, make: String, color: UIColor, doors: Int) {
//        self.year = year
//        self.make = make
//        self.color = color
//        self.doors = doors
//    }
//}
//
//struct CarViewModel {
//    let car: Car
//
//    var year: Int {
//        return car.year
//    }
//
//    var make: String {
//        return car.make
//    }
//
//    var color: UIColor {
//        return car.color
//    }
//
//    var doors: Int {
//        return car.doors
//    }
//}
//
//let car = Car(year: 1970, make: "Mustang", color: .black, doors: 2)

//print(car)

//let carViewModel = CarViewModel(car: car)

//print(carViewModel.year)

//: ### Build a user

enum UserType {
    case free
    case premium
}

class User {
    var username: String
    var password: String
    var email: String
    var didPay: Bool = false
    let platforms = PlatformGenerator.shared.platforms
    var ownedPlatforms: [String] = []
    var accessPermition: [Platform] = []
    var userOption: Bool?
    
    var userType: UserType {
        if didPay {
            return .premium
        } else {
            return .free
        }
    }
    
    init(username: String, password: String, email: String, userOption: Bool = false) {
        self.username = username
        self.password = password
        self.email = email
        if !userOption {
            self.access()
        }
    }
    
    convenience init(username: String, password: String, email: String, premiumSignup: Bool) {
        if premiumSignup {
            self.init(username: username, password: password, email: email, userOption: true)
            self.purchase()
        } else {
            self.init(username: username, password: password, email: email, userOption: false)
        }
    }
    
    func access() {
        
        switch userType {
        case .free:
            accessPermition = platforms.filter({ $0.isTrialOn == true })
        case .premium:
            accessPermition = platforms
        }
        
        ownedPlatforms = accessPermition.map({ $0.name })
        
        
        print(ownedPlatforms)
    }
    
    func purchase() {
        didPay.toggle()
        access()
    }
    
    func cancelMembership() {
        guard didPay else {
            print("You aren't a member.")
            return
        }
        
        didPay.toggle()
        access()
    }
}

struct Platform {
    
    var name: String
    
    var duration: Int // monthly
    
    var price: Double
    
    var isTrialOn: Bool
}

struct PlatformGenerator {
    
    static let shared = PlatformGenerator()
    
    private init() {}
    
    let platforms = [Platform(name: "News", duration: 12, price: 29.99, isTrialOn: false),
                                    Platform(name: "Weather", duration: 12, price: 29.99, isTrialOn: true),
                                    Platform(name: "Currency", duration: 12, price: 29.99, isTrialOn: true),
                                    Platform(name: "Sports", duration: 12, price: 29.99, isTrialOn: false),
                                    Platform(name: "Films", duration: 12, price: 29.99, isTrialOn: false)
                                    ]
    
}

let user = User(username: "Harun", password: "123", email: "h@h.com")
//
//user.purchase()
//
//user.cancelMembership()

//print(user)

let premiumUser = User(username: "Harun", password: "123", email: "dsf", premiumSignup: true)


