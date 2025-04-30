import XCTest
@testable import FileDB

final class FileDBTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest
        let db = SimpleFileDB(baseDirectory: "TestDB")

        db.createFile(named: "test.txt", contents: "Hello World")
        print(db.readFile(named: "test.txt") ?? "Nothing")
        db.appendToFile(named: "test.txt", text: "\nSecond Line")
        print(db.readFile(named: "test.txt") ?? "Nothing")
        print(db.listFiles())
        print(db.showPath(forFile: "test.txt"))
        db.deleteFile(named: "test.txt")
        db.clearPath()

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
    
    func testCsv() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest
        let db = SimpleFileDB(baseDirectory: "TestDB")

        db.createFile(named: "test.csv", contents: "Index, Name")
        print(db.readFile(named: "test.csv") ?? "Nothing")
        db.appendToFile(named: "test.csv", text: "\n1, Person1")
        db.appendToFile(named: "test.csv", text: "\n2, Person2")
        db.appendToFile(named: "test.csv", text: "\n3, Person3")
        print(db.readFile(named: "test.csv") ?? "Nothing")
        print(db.listFiles())
        print(db.showPath(forFile: "test.csv"))
        db.deleteFile(named: "test.csv")
        db.clearPath()


        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }

}
