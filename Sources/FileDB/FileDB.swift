// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public class SimpleFileDB {
    let baseURL: URL

    public init(baseDirectory: String) {
        let manager = FileManager.default
        let docs = manager.urls(for: .documentDirectory, in: .userDomainMask).first!
        self.baseURL = docs.appendingPathComponent(baseDirectory)

        if !manager.fileExists(atPath: baseURL.path) {
            try? manager.createDirectory(at: baseURL, withIntermediateDirectories: true)
        } else {
            print("Directory already exists at \(baseURL.path)")
        }
    }

    public func createFile(named name: String, contents: String) {
        let fileURL = baseURL.appendingPathComponent(name)
        try? contents.write(to: fileURL, atomically: true, encoding: .utf8)
    }

    public func readFile(named name: String) -> String? {
        let fileURL = baseURL.appendingPathComponent(name)
        return try? String(contentsOf: fileURL)
    }

    public func appendToFile(named name: String, text: String) {
        let fileURL = baseURL.appendingPathComponent(name)
        if FileManager.default.fileExists(atPath: fileURL.path) {
            if var contents = try? String(contentsOf: fileURL) {
                contents += text
                try? contents.write(to: fileURL, atomically: true, encoding: .utf8)
            }
        } else {
            createFile(named: name, contents: text)
        }
    }

    public func listFiles() -> [String] {
        return (try? FileManager.default.contentsOfDirectory(atPath: baseURL.path)) ?? []
    }

    public func deleteFile(named name: String) {
        let fileURL = baseURL.appendingPathComponent(name)
        try? FileManager.default.removeItem(at: fileURL)
    }
    
    public func showPath(forFile named: String) -> String {
        let fileURL = baseURL.appendingPathComponent(named)
        return fileURL.path
    }
    
    public func clearPath() {
        print("deleting \(self.baseURL.path)")
        try? FileManager.default.removeItem(at: self.baseURL)
    }
    
}
