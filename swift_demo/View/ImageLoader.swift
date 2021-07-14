//
//  ImageLoader.swift
//  swift_demo
//
//  Created by mac on 07/07/21.
//

import Foundation
import SwiftUI

class ImageLoader: ObservableObject{
    
    @Published var dounloadedData: Data?
    
    func downloadImage(url: String){
        guard let imageURL = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL){data, _, error in
            guard let data = data, error == nil else{
                return
            }
            DispatchQueue.main.async {
                self.dounloadedData = data
            }
            
        }.resume()
    }
}

struct UrlImage: View{
    let url: String
    let placeholder:String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder"){
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View{
        if let data = self.imageLoader.dounloadedData{
            return Image(uiImage: UIImage(data: data)!).resizable()
        } else {
            return Image(systemName:placeholder).resizable()
        }
    }
}
