//
//  VideoPreviewImageView.swift
//  Netflix - Clone
//
//  Created by Ali Mert Özhayta on 13.05.2021.
//

import SwiftUI
import Kingfisher

struct VideoPreviewImageView: View {
    
    var imageURL: URL
    var videoURL: URL
    
    @State private var showingVideoPlayer = false
    
    var body: some View {
        ZStack {
            KFImage(imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Button(action: {
                showingVideoPlayer = true
            }, label: {
                Image(systemName: "play.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 45))
            })
            .background(Color.black.opacity(0.25))
            .cornerRadius(30)
            .sheet(isPresented: $showingVideoPlayer, content: {
                VideoPlayerView(url: videoURL)
            })
        }
    }
}

struct VideoPreviewImageView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPreviewImageView(imageURL: exampleImageURL1, videoURL: exampleVideoURL)
    }
}
