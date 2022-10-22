//: # Functional Programming
/// Closures are functions without name and `func` keyword
/// Quick and easy to carry around as a variable, constant or just as a parameter

import UIKit

// MARK: - Intro to Closures 1

//var addNumbers: (Int, Int) -> Int = { (x, y) in
//    return x + y
//}

//var addNumbers1 = { (x: Int, y: Int) in
//    return x + y
//}

//addNumbers1(1, 2)

//var addNumbers2: (Int, Int) -> Int = { (x, y) in
    /// without `return` keyword
//    x + y
//}

//addNumbers2(3, 7)

//var addNumbers3: (Int, Int) -> Int = { $0 + $1 }
//
//addNumbers3(7, 9)
//
//func callString() -> String {
//    return "Return string"
//}
//
//var closureString: () -> String = {
//    return "Hello string"
//}
//
//closureString

// MARK: - Intro to Closures 2

/// When there is function returning a closure
/// The closure block should be defined as return type `direct`
/// When there is a pre-defined closure and it is to be returned `indirect`

//func returningClosure() -> ((Int, Int) -> Int) { // Return closures directly
//    return { (number1, number2) in
//        number1 + number2
//    }
//}
//
//let returnedClosure = returningClosure()
//
//returnedClosure(4, 7)
//
//var addTwoNumbersClosure: (Int, Int) -> Int = { (a, b) in
//    a + b
//}
//
//func addTwoNumbers() -> ((Int, Int) -> Int) { // Return closures indirectly
//    return addTwoNumbersClosure
//}
//
//let addTwoNumbersVariable = addTwoNumbers()
//
//print(addTwoNumbersVariable(1, 1))


// MARK: - Lazy init with closures

//struct Human {
//    let name: String
//
//    init(name: String) {
//        self.name = name
//        print("\(name)")
//    }
//}
//
//let createHuman = { () -> Human in
//    let human = Human(name: "Harun")
//    return human
//}
//
//let humanInstance = createHuman
//
///// A Human object created by closure
//let human: Human = {
//    let human = Human(name: "Harun")
//    return human
//}()
//
//human

//struct CarModel {
//    var color: UIColor
//    var year: Int
//}
//
//struct Car {
//
//    lazy var car: CarModel = {
//        let carModel = CarModel(color: .black, year: 2006)
//        return carModel
//    }()
//}

//: ### Capture lists
//: > Don't reference, copy
//var a = 0
//var b = 0
//
//var closureArray: [() -> ()] = []
//var i = 0
//
//for _ in 1...5 {
//    closureArray.append {
//        print(i)
//    }
//    i += 1
//}
//
//closureArray[0]() /// `closures are reference type`
//
//
//let smartClosure: () -> () = { [a, b] in
//    print(a, b)
//}
//
//smartClosure()
//
//a = 15
//b = 15
//
//smartClosure()

//: ### Trailing closures
//: Problem: A closure is too long to pass through a function
//func trailingClosure(_ number: Int, closure: () -> Void){
//    print("\(number)")
//    closure()
//}
//
//let helloClosure = {
//    print("Hello closure!")
//}
//
//func helloFunc() -> Void {
//    print("Hello function!")
//}
//
//// directly passing
//trailingClosure(125, closure: helloClosure)
//trailingClosure(85, closure: helloFunc)
//
//// indirectly passing
//trailingClosure(78) {
//    print("Indirectly closure passing")
//}

//func trailingClosure1(_ number: Int, completion: (Int) -> Int) {
//    print(completion(number))
//}
//
//trailingClosure1(15) { num in num * num }
//trailingClosure1(98, completion: { num in num * num })
//trailingClosure1(165, completion: { $0 * $0 })

let closureBlock: (Int) -> [Int] = { num in
    var numArray = [Int]()
    for i in 0...num {
        numArray.append(i)
    }
    return numArray
}

func numSequence(_ number: Int, closure: (Int) -> [Int]) {
    var numberArray = closure(number)

    print(numberArray)

    let squaredArray = numberArray.map({ $0 * $0 })

    print(squaredArray)
}

numSequence(5, closure: closureBlock)
