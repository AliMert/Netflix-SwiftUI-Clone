//
//  OpaquePickerView.swift
//  Netflix - Clone
//
//  Created by Ali Mert Özhayta on 16.05.2021.
//

import SwiftUI


struct OpaquePickerView: View {
    @Binding var selectedIndex: Int
    @Binding var blurAmount: CGFloat
    var picker: [String]?
    @Binding var showPicker: Bool
    
    
    var action: ((_ season: Int)->Void)?=nil
    var cancelAction: (()->Void)?=nil
    
    var body: some View {
        Group {
            Color.black.opacity(0.35)
                .onAppear {
                    blurAmount = 50
                }
            
            VStack() {
                Spacer()
                ZStack(alignment: .bottom) {
                    
                    GeometryReader { geometry in
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 40) {
                                Spacer()
                                Spacer()
                                Spacer()
                                ForEach(0..<(picker?.count ?? 0)) { pickedIndex in
                                    Button(action: {
                                        self.selectedIndex = pickedIndex
                                        self.showPicker = false
                                        self.blurAmount = 0
                                        action?(pickedIndex)
                                    }, label: {
                                        if let picked = picker?[pickedIndex] {
                                            Text(picked)
                                                .bold()
                                                .font(selectedIndex == pickedIndex  ? .title : .title3)
                                                .foregroundColor(selectedIndex == pickedIndex ? .white : .gray)
                                        }
                                    })
                                    
                                }
                                Spacer()
                                Spacer()
                                Spacer()
                            }
                            .frame(width: geometry.size.width)
                            .frame(minHeight: geometry.size.height)
                        }
                    }
                    
                    Text("")
                        .frame(width: UIScreen.main.bounds.width,height: 100)
                        .background(LinearGradient.blackOpacityGradient)
                        .edgesIgnoringSafeArea(.all)
                    
                    Group {
                        Button(action: {
                            self.showPicker = false
                            blurAmount = 0
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        })
                        .foregroundColor(.white)
                    }
                    .padding(.bottom, 40)
                    
                }
            }
            .background(LinearGradient.blackOpacityGradientFromCenter)
            
        }
        .edgesIgnoringSafeArea(.top)
        
    }
}

struct OpaquePickerView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            HomeView()
                .blur(radius: 60)
            OpaquePickerView(selectedIndex: .constant(0), blurAmount: .constant(50), picker: HomeGenre.toArray(), showPicker: .constant(true))
            
        }
        }
    }
}
