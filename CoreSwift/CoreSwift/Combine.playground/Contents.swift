

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
let myArray = ["A", "B", "C", "D"]
//
//myArray.publisher.collect(1).sink {
//    print($0)
//}

//: ### 2) Map
myArray.publisher.map {
    print($0.lowercased())
}
