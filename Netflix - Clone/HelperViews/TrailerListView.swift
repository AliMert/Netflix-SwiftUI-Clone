//
//  TrailerListView.swift
//  Netflix - Clone
//
//  Created by Ali Mert Özhayta on 13.05.2021.
//

import SwiftUI

struct TrailerListView: View {
    
    var trailers : [Trailer]
    
    var screen = UIScreen.main.bounds
    var maxWidth : CGFloat {
        if screen.width > 450 {
            return 450
        }
        return screen.width
    }
    
    var body: some View {
        
        VStack {
            ForEach(trailers) { trailer in
                VStack(alignment: .leading) {
                  
                    VideoPreviewImageView(imageURL: trailer.thumbnailImageURL, videoURL: trailer.videoURL)
                        .frame(maxWidth: maxWidth)
                        .cornerRadius(7.0)
                    
                    
                    Text(trailer.name)
                        .font(.headline)
                }
                .padding(.bottom, 10)
                
            }
        }
        
        .foregroundColor(.white)
        
    }
}

struct TrailerListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            TrailerListView(trailers: exampleTrailers)
        }
    }
}
