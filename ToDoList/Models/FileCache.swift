//
//  FileCache.swift
//  ToDoList
//
//  Created by Василий Буланов on 20.05.2022.
//

import Foundation

class FileCache {
    let jsonItemsArrayName: String

    private(set) var items: [TodoItem]

    func add(item itm: TodoItem) {
        items.append(itm)
    }

    func delete(item itm: TodoItem) {
        guard let index = (items.firstIndex { $0.id == itm.id }) else {
            return
        }
        items.remove(at: index)
    }

    func export(to fileName: String, only flag: TodoItem.Importance? = nil) {
        guard var path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return
        }
        path.appendPathComponent(fileName)
        print(path)

        var allData = [String: [[String: String]]]()
        allData[self.jsonItemsArrayName] = [[String: String]]()

        for item in items {
            do {
                guard let data = item.json as? Data else {
                    continue
                }
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: String] {
                    if flag != nil && json["importance"] == flag!.rawValue {
                        allData[self.jsonItemsArrayName]?.append(json)
                    }
                }
                let dat = try JSONSerialization.data(withJSONObject: allData, options: [.sortedKeys, .prettyPrinted])
                FileManager.default.createFile(atPath: path.path, contents: dat)
            } catch {
                print(error)
            }
        }
    }

    init(jsonItemsArrayName arrayName: String = "Items") {
        items = [TodoItem]()
        self.jsonItemsArrayName = arrayName
    }
}
