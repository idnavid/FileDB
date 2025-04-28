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

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
}
