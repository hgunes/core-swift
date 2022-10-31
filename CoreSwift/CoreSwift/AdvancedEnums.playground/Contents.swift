

//: # Enumerations
//: ## Basics
import UIKit

//enum Months: String {
//    case jan, feb, mar, apr, may
//}
//
//let january = Months.jan.rawValue
//
//print(january)
//
//enum Days: Int {
//    case mon, tue, wed, thu, fri, sat, sun
//}
//
//let thursday = Days(rawValue: 3)
//
//print("\(thursday)")

//: ### Associated value
//enum Barcode {
//    case upc(Int, Int, Int, Int)
//    case qrCode(String)
//}
//
//let myUpcCode = Barcode.upc(4, 5, 6, 5)
//let myQrCode = Barcode.qrCode("ABC")
//
//let myCode = myUpcCode
//
//switch myCode {
//case let .qrCode(text):
//    print("\(text)")
//case let .upc(a, b, c, d):
//    var codeItems: [Int] = [a, b, c, d]
//
//    for _ in codeItems {
//        print(codeItems)
//    }
//}

//: ### Static and mutating methods with "self"

//enum Button: String {
//    case scale
//    case move
//    case preview
//
//    var identifier: String {
//        return self.rawValue
//    }
//}
//
//let scaleButton = Button.scale
//scaleButton.identifier
//
//func printOutButtonNames(_ sender: Button) {
//    switch sender {
//    case .scale:
//        print("Scale!!")
//    case .move:
//        print("Move!!")
//    case .preview:
//        print("Preview!!")
//    }
//}
//
//printOutButtonNames(scaleButton)

// MARK: -
//enum Meal {
//    case breakfast, lunch, dinner
//
//    mutating func nextMeal() {
//        switch self {
//        case .breakfast:
//            self = .lunch
//            print("Lunch")
//        case .lunch:
//            self = .dinner
//            print("Dinner")
//        case .dinner:
//            self = .breakfast
//            print("next morning")
//        }
//    }
//}
//
//var breakfast = Meal.breakfast
//breakfast.nextMeal()
//breakfast.nextMeal()

// MARK: -
//enum AppleDevice: String {
//    case iPhone, iPad, magicMouse, magicKeyboard, airPods, macBook
//
//    static func getProduct(_ name: String) -> AppleDevice? {
//        return AppleDevice(rawValue: name)
//    }
//
//    static func getAppleDevice(enterName: String) -> AppleDevice? {
//        switch enterName {
//        case "iPhone", "iPad", "magicMouse", "magicKeyboard", "airPods", "macBook":
//            return getProduct(enterName)
//        default:
//            return nil
//        }
//    }
//}

// MARK: -
//enum ItemCategory {
//    case small, medium, big, weird
//
//    init(number: Int) {
//        switch number {
//        case 0..<1000:
//            self = .small
//        case 1000..<1000_000:
//            self = .medium
//        case 1000_000..<1_000_000_000:
//            self = .big
//        default:
//            self = .weird
//        }
//    }
//}
//
//struct Item {
//
//    let value: Int
//    var category: ItemCategory {
//        return ItemCategory(number: value)
//    }
//
//}
//
//let item = Item(value: 1900)
//print(item.category)

// MARK: -

//enum CellType: String {
//    case ButtonValueCell
//    case uniEditCell
//    case labelCell
//    case resultLabelCell
//
//    var name: String {
//        return self.rawValue.capitalized
//    }
//}
//
//let customCell = CellType.resultLabelCell
//print(customCell.name)

// MARK: -
//enum NavigationTheme {
//    case placid
//    case warning
//    case danger
//
//    var barTintColor: UIColor {
//        switch self {
//        case .placid: return .clear
//        case .warning: return .yellow
//        case .danger: return .red
//        }
//    }
//}
//
//extension NavigationTheme {
//    init(numberOfTasks: Int) {
//        switch numberOfTasks{
//        case 0...3:
//            self = .placid
//        case 4...9:
//            self = .warning
//        default:
//            self = .danger
//        }
//    }
//}
//
//var navTheme: NavigationTheme = NavigationTheme.init(numberOfTasks: 4)
//print(navTheme.barTintColor)

//: ## Nested Enum
//enum FutureProjects {
//    enum GymApp: String {
//        case frontEnd
//        case backEnd
//
//        var description: String {
//            return self.rawValue
//        }
//    }
//
//    enum FoodApp: String {
//        case delivery
//        case purchase
//        case refund
//
//        var description: String {
//            return self.rawValue
//        }
//    }
//}
//
//print("\(FutureProjects.GymApp.backEnd.rawValue)")
//
//struct Hero {
//    enum CharacterType {
//        case warrior
//        case collector
//        case spy
//    }
//
//    enum Skill {
//        case airwalk
//        case defence
//        case offense
//    }
//
//    let type: CharacterType
//    let Skill: Skill
//}
//
//let hero = Hero(type: .warrior, Skill: .airwalk)
//
//print(hero)
//
//enum Wearable {
//    enum Weight: Int {
//        case light
//        case medium
//        case heavy
//    }
//
//    enum Price: Int {
//        case leather
//        case iron
//        case steel
//    }
//
//    case armor(weight: Weight, price: Price)
//
//    func getDescription() -> String {
//        switch self {
//        case let .armor(weight, price):
//            return "You have chosen \(weight) and \(price)"
//        }
//    }
//}
//
//let wearable = Wearable.armor(weight: .medium, price: .iron)
//print(wearable.getDescription())

//: ## Protocol Oriented Enum
/// Game design
protocol LifeSpan {
    var numberOfHearts: Int { get }
    mutating func increaseHeart() // +1
    mutating func getAttacked() // -1
}

enum Player: LifeSpan {
    
    case dead
    case alive(currentHeart: Int)
    
    var numberOfHearts: Int {
        switch self {
        case .dead: return 0
        case let .alive(hearts):
            return hearts
        }
    }
    
    mutating func increaseHeart() {
        switch self {
        case .dead:
            self = .alive(currentHeart: 1)
        case let .alive(currentHeart):
            self = .alive(currentHeart: currentHeart + 1)
        }
    }
    
    mutating func getAttacked() {
        switch self {
        case let .alive(currentHeart):
            if currentHeart == 1 {
                self = .dead
            } else {
                self = .alive(currentHeart: currentHeart - 1)
            }
        case .dead:
            break
        }
    }
}

var player = Player.dead
player.numberOfHearts
player.increaseHeart()
player.increaseHeart()
player.increaseHeart()
player.getAttacked()
player.getAttacked()
player.getAttacked()
player.getAttacked()
player.numberOfHearts
player.increaseHeart()

//: ## Recursive Enum
//indirect enum ArithmeticExpressions {
//    case number(Int)
//    case addition(ArithmeticExpressions, ArithmeticExpressions)
//    case multiplication(ArithmeticExpressions, ArithmeticExpressions)
//}
//
//let addition = ArithmeticExpressions.addition(.number(5), .number(8))
//
//func evaluate(_ expression: ArithmeticExpressions) -> Int {
//    switch expression {
//    case let .number(value):
//        return value
//    case let .addition(left, right):
//        return evaluate(left) + evaluate(right)
//    case let .multiplication(left, right):
//        return evaluate(left) * evaluate(right)
//    }
//}
//
//evaluate(addition)

//: ## Generic Enum
enum Info<T, U> {
    case name(T)
    case website(T)
    case age(U)
}

Info<String, Int>.age(25)

//: ### Custom Optional
enum MyOptional<T> {
    case none
    case some(T)
    
    init(_ value: T) {
        self = .some(value)
    }
}

let myoptional = MyOptional("123")
myoptional

//: ## Error handling with Result Type
enum HTTPError: String {
    case notFound404
    case forbidden403
}

enum ResultType<T> {
    case success(T)
    case failure(HTTPError)
}

let success = ResultType<String>.success("Success!")
let failure = ResultType<Any>.failure(.forbidden403)

func findDomain(name: String) -> ResultType<String> {
    switch name {
    case "business":
        return ResultType.failure(.notFound404)
    case "work":
        return ResultType.failure(.forbidden403)
    default:
        return.success(name)
    }
}

let result = findDomain(name: "business")

switch result {
case let .success(name):
    print(name)
case let .failure(error):
    print(error.rawValue)
}
