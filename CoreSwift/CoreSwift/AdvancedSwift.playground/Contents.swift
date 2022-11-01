

//: # Advanced Swift
//: ### Key Paths
struct Developer {
    let platform: Platform
    let information: Information
}

enum Platform {
    case iOS
    case android
}

struct Information {
    var name, strengths, motivation: String
}

let info = Information(name: "Harun", strengths: "iOS", motivation: "New tech")
let dev = Developer(platform: .iOS, information: info)

let infoKeyPath = \Developer.information

let name = dev[keyPath: infoKeyPath].name

let nameKeyPath = infoKeyPath.appending(path: \.name) // Append key path

print(dev[keyPath: nameKeyPath])
