//
//  SmallVerticalButton.swift
//  Netflix - Clone
//
//  Created by Ali Mert Özhayta on 10.05.2021.
//

import SwiftUI

struct SmallVerticalButton: View {
    
    var text : String
    var isOnImage : String
    var isOffImage : String
    var isOn : Bool
    var textSize : CGFloat = 12
    var textColor : Color = .white

    var imageName : String {
        isOn ? isOnImage : isOffImage
    }
    
    var action : () -> Void
    
    var body: some View {
        
        Button(action: action, label: {
            VStack(spacing: 5) {
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                Text(text)
                    .foregroundColor(textColor)
                    .font(.system(size: textSize))
                    .bold()
            }
        })
        
    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            SmallVerticalButton(text: "My  List", isOnImage: "checkmark", isOffImage: "plus", isOn: false) {
                print("tapped")
            }
        }
    }
}
