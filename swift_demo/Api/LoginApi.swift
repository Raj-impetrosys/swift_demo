//
//  Login.swift
//  swift_demo
//
//  Created by mac on 13/07/21.
//

import Foundation
import Alamofire

struct LoginDetails: Codable, Identifiable {
    public var id: Int
    public var title: String
    public var price: Double
    public var description: String
    public var category: String
    public var image: String
}


class LoginApi: ObservableObject {
  // 1.
  @Published var loginDetails = [LoginDetails]()
     
    init() {
//        let url = URL(string: "https://ensurecure.com/Webservice/login")!
//        let header: HTTPHeaders = [
//            "authkey": "Ensurecure@123"
//        ]
        // 2.
//        var request = URLRequest(url: url)
//        request.allHTTPHeaderFields = [
//            "authkey": "Ensurecure@123"
//        ]
//        request.httpMethod = "POST"//.get, .post, .put
//        request.httpBody = [
//            "email":"raj.impetrosys@gmail.com",
//            "password":"Rk@123456",
//            "devicetoken":"123213",
//            "devicetype":"android",
//            "deviceid":"21",
//        ] as Data
        let url = "https://ensurecure.com/Webservice/login"
        let headers: HTTPHeaders = ["authkey": "Ensurecure@123"]
        AF.request(url,method:.post, parameters: [
                                        "email":"raj.impetrosys@gmail.com",
                                        "password":"Rk@123456",
                                        "devicetoken":"123213",
                                        "devicetype":"android",
                                        "deviceid":"21",
        ],headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any] {
                    print(json)
                }
            case .failure(let error):
                print(error)
            }
    }
//        URLSession.shared.dataTask(with: request) {(data, response, error) in
//            do {
//                if let todoData = data {
//                    // 3.
//                    let decodedData = try JSONDecoder().decode([LoginDetails].self, from: todoData)
//                    DispatchQueue.main.async {
//                        self.loginDetails = decodedData
//                    }
//                } else {
//                    print("No data")
//                }
//            } catch {
//                print("Error")
//            }
//        }.resume()
    }
}
