//
//  TodoItem.swift
//  ToDoList
//
//  Created by Василий Буланов on 20.05.2022.
//

import Foundation

struct TodoItem {
    enum Importance: String {
        case important
        case ordinary
        case unimportant
    }

    let id: String
    let importance: Importance
    let text: String
    let deadline: Date?

    init(id: String = UUID().uuidString, importance: Importance, text: String, deadline: Date?) {
        self.id = id
        self.importance = importance
        self.text = text
        self.deadline = deadline
    }
}

extension TodoItem {
    static func parse(json: Any) -> TodoItem? {
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        guard let data = json as? Data else {
            return nil
        }
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: String] {
                guard let text = json["text"] else {
                    return nil
                }
                var item: TodoItem?
                switch (json["id"], json["importance"], text, json["deadline"]) {
                case (let id?, let importance?, let text, let deadline?):
                    item = TodoItem(id: id,
                                    importance: Importance(rawValue: importance) ?? .ordinary,
                                    text: text,
                                    deadline: fmt.date(from: deadline))
                case (let id?, _, let text, let deadline?):
                    item = TodoItem(id: id,
                                    importance: .ordinary,
                                    text: text,
                                    deadline: fmt.date(from: deadline))
                case (let id?, let importance?, let text, _):
                    item = TodoItem(id: id,
                                    importance: Importance(rawValue: importance) ?? .ordinary,
                                    text: text,
                                    deadline: nil)
                case (let id?, _, let text, _):
                    item = TodoItem(id: id,
                                    importance: .ordinary,
                                    text: text,
                                    deadline: nil)
                default:
                    item = nil
                }
                return item
            }
        } catch {
            return nil
        }
        return nil
    }

    var json: Any {
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        var json: Any
        var jsonMap = [String: String]()
        do {
            jsonMap["id"] = self.id
            jsonMap["text"] = self.text
            if let deadline = self.deadline {
                jsonMap["deadline"] =  fmt.string(from: deadline)
            }
            if self.importance != .ordinary {
                jsonMap["importance"] = self.importance.rawValue
            }
            json = try JSONSerialization.data(withJSONObject: jsonMap, options: []) as Any
            return json
        } catch {
            print("error")
            return Data()
        }
    }
}
