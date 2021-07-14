//
//  Api.swift
//  swift_demo
//
//  Created by mac on 07/07/21.
//

import Foundation
import SwiftUI
import UIKit

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
    var kind: String
    var country: String
    var isStreamable: Bool
    var trackPrice: Double?
    var artworkUrl100: String
}

struct ApiView: View {
    @State private var results = [Result]()
    
    func loadData() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        self.results = decodedResponse.results
                    }
                    
                    // everything is good, so we can exit
                    return
                }
            }
            
            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    var body: some View {
        List(results, id: \.trackId) { item in
            HStack{
                UrlImage(url: item.artworkUrl100,placeholder: "photo").frame(width:100,height:60).aspectRatio(contentMode:.fit)
                //                Image("3x")
                VStack(alignment: .leading) {
                    Text(item.trackName)
                        .font(.headline)
                    Text(item.collectionName)
                }
                Spacer()
                //            Text(item.kind)
                //                Text(String(item.isStreamable))
                //                Text(String(price))
                Text("$"+String(item.trackPrice!))
            }.padding(.vertical,5).navigationBarTitle("API",displayMode: .inline)
        }.onAppear(perform: loadData)
    }
}
