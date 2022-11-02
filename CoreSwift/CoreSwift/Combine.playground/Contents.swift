

//: # Combine
//: ## Basics
//: ### Publisher & Subscriber
import UIKit
import Combine

//enum Status {
//    case failed
//    case passed
//}
//
//class Exam {
//    var grade: Int
//
//    var status: Status {
//
//        if self.grade < 65 {
//            return .failed
//        } else {
//            return .passed
//        }
//    }
//
//    init(grade: Int) {
//        self.grade = grade
//
//        evaluateStatus()
//    }
//
//    func evaluateStatus() {
//        let notification = Notification.Name("Pass")
//
//
//        let publisher = NotificationCenter.default.publisher(for: notification)
//
//        let subscriber = publisher.sink { _ in
//            self.getRewarded()
//        }
//
//        if self.status == .passed {
//            NotificationCenter.default.post(name: notification, object: nil)
//        } else {
//            self.failed()
//        }
//    }
//
//    func getRewarded() {
//        print("Congrats, you passed! I bought a car for you!")
//    }
//
//    func failed() {
//        print("You didn't study enough!")
//    }
//
//}
//
//let exam = Exam(grade: 65)

//: ### Subjects

//enum MyError: Error {
//    case someError
//}
//
//class StringSubscriber: Subscriber {        // custom subscriber
//
//    func receive(subscription: Subscription) {
//        subscription.request(.max(2))
//    }
//
//    func receive(_ input: String) -> Subscribers.Demand {
//        print(input)
//        return .max(1)
//    }
//
//    func receive(completion: Subscribers.Completion<MyError>) {
//        print("Completed")
//    }
//
//    typealias Input = String
//    typealias Failure = MyError
//}
//
//let subscriber = StringSubscriber()
//let subject = PassthroughSubject<String, MyError>()
//
//subject.subscribe(subscriber)
//
//let subscription = subject.sink { completion in
//    print("Receibed Completion from sink")
//} receiveValue: { value in
//    print("Received value from sink")
//}
//
//subject.send("A")
//subscription.cancel()
//
//subject.send("B")
//subject.send("C")
//subject.send("D")

//: ## Transforming Operators
//: ### 1) Collect
//let myArray = ["A", "B", "C", "D"]
//
//myArray.publisher.collect(1).sink {
//    print($0)
//}

//: ### 2) Map
//myArray.publisher.map {
//    print($0.lowercased())
//}

//: ### 3) Map Key Path
//struct Point {
//    let x: Int
//    let y: Int
//}
//
//let publisher = PassthroughSubject<Point, Never>()
//
//publisher.map(\.x, \.y).sink { x, y in
//    print("x: \(x)\ny: \(y)")
//}
//
//publisher.send(Point(x: 5, y: 8))

//: ### 4) FlatMap
//struct School {
//    let name: String
//    let numOfStudents: CurrentValueSubject<Int, Never>
//
//    init(name: String, num: Int) {
//        self.name = name
//        self.numOfStudents = CurrentValueSubject(num)
//    }
//}
//
//let citySchool = School(name: "City School", num: 150)
//
//let school = CurrentValueSubject<School, Never>(citySchool)
//
//school.flatMap {
//    $0.numOfStudents
//}
//.sink {
//    print($0)
//}
//
//let townSchool = School(name: "Town School", num: 50)
//
//school.value = townSchool
//
//citySchool.numOfStudents.value = 48
//townSchool.numOfStudents.value += 12

//: ### 5) ReplaceNil
//["a", "b", nil, "d"].publisher.replaceNil(with: "-")
//    .map { $0! }
//    .sink {
//        print($0)
//}

//: ### 6) ReplaceEmpty
//let empty = Empty<Int, Never>()
//
//empty
//    .replaceEmpty(with: 5)
//    .sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })

//: ### 7) Scan
//let publisher = (1...10).publisher
//
//publisher.scan([]) { number, value -> [Int] in
//    number + [value]
//}
//.sink {
//    print($0)
//}

//: ## Filtering Operators
//: ### 1) Filter
//let grades = ["A", "A", "A", "B", "C", "D"].publisher
//
//grades.filter {
//    $0 == "A"
//}
//.sink {
//    print($0)
//}

//: ### 2) Remove Duplicates
//let words = "apple apple fruit apple mngo watermelon apple".components(separatedBy: " ").publisher
//
//words
//    .removeDuplicates() // it only removes the duplicates in a sequence. After a new value, it may appear again.
//    .sink {
//        print($0)
//    }

//: ### 3) Compact Map
//let strings = ["a", "1.3", "4", "b"].publisher
//
//strings
//    .compactMap {
//        Float($0)
//}
//    .sink {
//        print($0)
//    }

//: ### 4) First & Last

/*:
 > ---
 
 * .first finds where it first appears based on the filter
 
 * .last finds where it last appears based on the filter
*/
//let numbers = (1...10).publisher
//
//numbers
//    .last(where: { $0 % 3 == 0})
//    .sink {
//        print($0)
//    }


//: ### 5) Drop First
//let nums = (1...20).publisher
//
//nums
//    .dropFirst(12)
//    .sink {
//        print($0)
//    }

// MARK: - Filtering practice

let numbers = (1...100).publisher

numbers
    .dropFirst(50)
    .prefix(20)
    .filter {
        $0 % 2 == 0
    }
    .sink {
        print($0)
    }
