//: Playground - noun: a place where people can play

import UIKit

/// INSTRUCTIONS
/// - Fix compilation errors.
/// - Assign the teacher the name "Alice" and an age of 31.
/// - Implement 'addStudents()' to add Cecilia, Ellen, and Bob to Alice's list of students.
/// - In 'printStudents()' print the student's age if it's available. Otherwise, just print the name.

protocol Person {
    var firstName: String { get set }
    var age: Int? { get set }
}

protocol Teaching {
    func printStudents()
    mutating func addStudents(_ students: [Student])
}

struct Teacher: Person, Teaching {
    private var students = [Student]()
    var firstName: String
    var age: Int?
    
    init() {
        self.firstName = ""
    }
    
    init(firstName: String, age: Int?) {
        self.firstName = firstName
        self.age = age
    }
    
    func printStudents() {
        for student in students {
            if let age = student.age {
                print("\(student.firstName) (\(age))")
            } else {
                print("\(student.firstName)")
            }
        }
        print("\(firstName) has \(students.count) students.")
    }
    
    mutating func addStudents(_ students: [Student]) {
        self.students += students
    }
}

struct Student: Person {
    var firstName: String
    var age: Int?
}

var teacher = Teacher()
teacher.firstName = "Alice"
teacher.age = 31

/// DO NOT MODIFY FROM HERE
let students = [
    Student(firstName: "Cecilia", age: 25),
    Student(firstName: "Ellen", age: nil),
    Student(firstName: "Robert", age: 30)
]

teacher.addStudents(students)
teacher.printStudents()

