//
//  list.swift
//  swift_demo
//
//  Created by mac on 05/07/21.
//

import Foundation
import SwiftUI

struct Todo: Codable, Identifiable {
    public var id: Int
    public var title: String
    public var completed: Bool
}


class FetchToDo: ObservableObject {
  // 1.
  @Published var todos = [Todo]()
     
    init() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        // 2.
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    // 3.
                    let decodedData = try JSONDecoder().decode([Todo].self, from: todoData)
                    DispatchQueue.main.async {
                        self.todos = decodedData
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}

struct ListView: View {
    // 1.
    @ObservedObject var fetch = FetchToDo()
    var body: some View {
        VStack {
            // 2.
            List(fetch.todos) { todo in
                VStack(alignment: .leading) {
                    // 3.
                    Text(todo.title)
                    Text("\(todo.completed.description)") // print boolean
                        .font(.system(size: 11))
                        .foregroundColor(Color.gray)
                }
            }
        }.navigationBarTitle("List",displayMode: .inline)
    }
}
