//
//  ToDoListTests.swift
//  ToDoListTests
//
//  Created by Василий Буланов on 19.05.2022.
//

import XCTest
@testable import ToDoList

class ToDoListTests: XCTestCase {

    var sut: TodoItem!
    var fmt: DateFormatter!

    override func setUpWithError() throws {
        super.setUp()
        fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }

    func testFullDataTodoItem() throws {
        let data = try getDate(fromJSON: "fullDataTodoItem")
        sut = TodoItem.parse(json: data)
        XCTAssertNotNil(sut.id)
        XCTAssertEqual(sut.deadline, fmt.date(from: "2022-05-20"))
        XCTAssertEqual(sut.importance, .important)
        XCTAssertEqual(sut.text, "NOGYM")
    }

    func testNoDateTodoItem() throws {
        let data = try getDate(fromJSON: "noDateTodoItem")
        sut = TodoItem.parse(json: data)
        XCTAssertNotNil(sut.id)
        XCTAssertEqual(sut.deadline, nil)
        XCTAssertEqual(sut.importance, .important)
        XCTAssertEqual(sut.text, "NOGYM")
    }

    func testNoTextTodoItem() throws {
        let data = try getDate(fromJSON: "noTextTodoItem")
        sut = TodoItem.parse(json: data)
        XCTAssertNil(sut)
    }

    func testNoImportanceTodoItem() throws {
        let data = try getDate(fromJSON: "noImportanceTodoItem")
        sut = TodoItem.parse(json: data)
        XCTAssertNotNil(sut.id)
        XCTAssertEqual(sut.deadline, fmt.date(from: "2022-05-20"))
        XCTAssertEqual(sut.importance, .ordinary)
        XCTAssertEqual(sut.text, "NOGYM")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
