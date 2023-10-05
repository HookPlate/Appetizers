//
//  RemoteImage.swift
//  Appetizers
//
//  Created by robin tetley on 21/09/2023.
//
//this all goes away thanks to remote image
import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromUrlString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            //don't need to return anything in completed since we're not handling the errors we're just showing the placeholders if things go wrong.
            guard let uiImage else { return }
            //make an Image from the UIImage, becayse this triggers a UI change we want to trigger this on the main queue. You could create a code snippet called dqueue to make it faster.
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
            
        }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

//the 3rd puzzle piece is what we'll use in our appetizerListCell.
struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
        //loads the image based on the appetizer we have.
            .onAppear { imageLoader.load(fromUrlString: urlString)}
    }
}
