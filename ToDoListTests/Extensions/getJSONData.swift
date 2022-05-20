//
//  detJSONData.swift
//  ToDoListTests
//
//  Created by Василий Буланов on 21.05.2022.
//

import Foundation
import XCTest

extension XCTestCase {
    enum TestError: Error {
        case fileNotFound
    }

    func getDate(fromJSON fileName: String) throws -> Data {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            XCTFail("Missing File \(fileName).json")
            throw TestError.fileNotFound
        }
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            throw error
        }
    }
}
