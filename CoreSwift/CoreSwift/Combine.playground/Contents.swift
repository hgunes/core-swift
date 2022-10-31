

//: # Combine
//: ### Notification Center
import UIKit
import Combine

enum Status {
    case failed
    case passed
}

class Exam {
    var grade: Int
    
    var status: Status {
        
        if self.grade < 65 {
            return .failed
        } else {
            return .passed
        }
    }
    
    init(grade: Int) {
        self.grade = grade
        
        evaluateStatus()
    }
    
    func evaluateStatus() {
        let notification = Notification.Name("Pass")
        
        
        let publisher = NotificationCenter.default.publisher(for: notification)
        
        let subscriber = publisher.sink { _ in
            self.getRewarded()
        }
        
        if self.status == .passed {
            NotificationCenter.default.post(name: notification, object: nil)
        } else {
            self.failed()
        }
    }
    
    func getRewarded() {
        print("Congrats, you passed! I bought a car for you!")
    }
    
    func failed() {
        print("You didn't study enough!")
    }
    
}

let exam = Exam(grade: 65)

