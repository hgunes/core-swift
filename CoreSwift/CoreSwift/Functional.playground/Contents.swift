//: # Functional Programming
//: ## Declarative Programming
//: * No mutability, no change in state / no explicit state management
//: * Modularity
//: * Fewer lines of code
//: * Conventional communication
//: ### Closures
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

//: ### Lazy init with closures

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

//: When creating an object by closures inside of an object use `lazy` keyword to make sure it is not created until it's called
//  //A Human object created by closure
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
// // indirectly passing
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

//let closureBlock: (Int) -> [Int] = { num in
//    var numArray = [Int]()
//    for i in 0...num {
//        numArray.append(i)
//    }
//    return numArray
//}
//
//func numSequence(_ number: Int, closure: (Int) -> [Int]) {
//    var numberArray = closure(number)
//
//    print(numberArray)
//
//    let squaredArray = numberArray.map({ $0 * $0 })
//
//    print(squaredArray)
//}
//
//numSequence(5, closure: closureBlock)

//var customBlock: (String) -> [String.Element] = { name in
//    return name.map({ $0 })
//}

//func nameArrayConvert(_ name: String, conversion: (String) -> [String.Element]) {
//    let uppercasedName = name.uppercased()
//
//    let nameArray = conversion(uppercasedName)
//
//    print(nameArray)
//}
//
//nameArrayConvert("Harun") { name in
//    name.map { $0 }
//}
//: ### Completion handlers
//let downloadHandlerBlock: (Bool) -> Void = {
//    if $0 {
//        print("Downloaded!")
//    }
//}
//
////downloadHandlerBlock(true)
//
//func downloandImage(completion: (Bool) -> Void) {
//    for _ in 1...100 {
//        print("Downloading")
//    }
//    completion(true)
//}
//
//downloandImage(completion: downloadHandlerBlock)


//: ## Built - In Functions
//: ### Filter

//var isGradeA: (String) -> Bool = { grade in
//    return grade == "A"
//}
//
///// Filter function is actually nothing more than the below function
//func gradeFilter<T>(grades: [T], completion: (T) -> Bool) -> [T] {
//    var array: [T] = []
//
//    for item in grades {
//        if completion(item) {
//            array.append(item)
//        }
//    }
//
//    return array
//}
//
//let sampleArray = ["A", "A", "B", "C"]
//
//print(gradeFilter(grades: sampleArray, completion: isGradeA))
//print(gradeFilter(grades: sampleArray) { $0 == "A"})

//extension Array {
//    func myFilter(_ operation: (Element) -> Bool) -> [Element] {
//        var filteredValues = [Element]()
//
//        for item in self {
//            if operation(item) {
//                filteredValues.append(item)
//            }
//        }
//
//        return filteredValues
//    }
//
//}
//
//let lowGrades = sampleArray.myFilter { $0 != "A" }
//
//print(lowGrades)
//let highGrades = gradeFilter(grades: Array(0...100)) {
//    $0 > 93 && $0 <= 100
//}

//print(highGrades)

//let evenNumbers = Array(0...100).filter { $0 % 2 == 0  && $0 > 50 }
//print(evenNumbers)

//: ### Map
//: > Built-in function
/// Imperative / non-functional way
//var squaredNumbers: [Double] = []
//
//var nums: [Double] = [1, 2, 3, 4, 5, 6, 7]
//
//for num in nums {
//    squaredNumbers.append(num * num)
//}

//print(squaredNumbers)

/// Declarative / functional
//var squared: (Double) -> Double = { num in
//    return num * num
//}
//
//func transformValue<T>(_ array: [T], operation: (T) -> T) -> [T] {
//    var transformedArray: [T] = []
//
//    for value in array {
//        transformedArray.append(operation(value))
//    }
//
//    return transformedArray
//}
//
//let squaredNums = transformValue(nums, operation: squared)
//
//print(squaredNums)
//
//extension Array {
//    func myMap<U>(_ operation: (Element) -> U) -> [U] {
//        var transformedValues: [U] = []
//
//        for item in self {
//            transformedValues.append(operation(item))
//        }
//
//        return transformedValues
//    }
//}
//
//var upperCase: (String) -> String = { name in
//    name.uppercased()
//}
//
//let names = ["Harun", "Shady", "Emine", "Sheena"]
//
//let uppercasedNames = names.myMap({ $0.uppercased() })
//print(uppercasedNames)
//var stringed: (Int) -> String = { num1 in
//    "\(num1)"
//}
//
//let numberList = nums.myMap({ "\($0)" })
//
//print(numberList)

//: ### Reduce
//func myReduce(_ seed: Int, array: [Int], operation: (Int, Int) -> Int) -> [Int] {
//    var reducedItems: [Int] = []
//    var current = seed
//
//    for num in array {
//        reducedItems.append(operation(current, num))
//    }
//
//    return reducedItems
//}
//
//let numberList = [15, 54, 65, 87, 3]
//
//let reducedNumberList = myReduce(8, array: numberList, operation: { $1 - $0 })
//
//print(reducedNumberList)
//
//extension Array {
//    func reduceIt(_ seed: Element, operation: (Element, Element) -> Element) -> [Element] {
//        var reducedElements: [Element] = []
//        var current = seed
//
//        for element in self {
//            reducedElements.append(operation(current, element))
//        }
//
//        return reducedElements
//    }
//}
//
//let genericReducedArray = reducedNumberList.reduceIt(10) { $0 + $1 }
//print(genericReducedArray)

