import Cocoa

struct User {
    var id: Int
    var name: String
    var email: String
    var password: String
    
    init(id: Int, name: String, email: String, password: String) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
    }
}

extension User {
    func save() {
        print("User saved")
    }
    
    func delete() {
        print("User deleted")
    }
}

extension User {
    func isEmailValid() -> Bool {
        return email.contains("@")
    }
    
    func isPasswordStrong() -> Bool {
        return password.count >= 8
    }
}

protocol Displayable {
    func display() -> String
}

extension User: Displayable {
    func display() -> String {
        return "\(name) (\(email))"
    }
}

let user = User(id: 1, name: "John", email: "johnappleseed@example.com", password: "98761234")

print(user.isPasswordStrong())
print(user.display())
