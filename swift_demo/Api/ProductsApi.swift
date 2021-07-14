//
//  ProductsApi.swift
//  swift_demo
//
//  Created by mac on 08/07/21.
//

import Foundation
import SwiftUI
import UIKit

struct ProductsList: Codable, Identifiable {
    public var id: Int
    public var title: String
    public var price: Double
    public var description: String
    public var category: String
    public var image: String
}


class FetchProducts: ObservableObject {
  // 1.
  @Published var productList = [ProductsList]()
     
    init() {
        let url = URL(string: "https://fakestoreapi.com/products")!
        // 2.
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    // 3.
                    let decodedData = try JSONDecoder().decode([ProductsList].self, from: todoData)
                    DispatchQueue.main.async {
                        self.productList = decodedData
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
