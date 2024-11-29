//
//  SplashView.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 12/11/2024.
//

import SwiftUI

struct SplashView: View {
    @State var imageName: ImageName = .benfica5
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .foregroundStyle(LinearGradient(colors: [.black, .gray], startPoint: .bottomLeading, endPoint: .topTrailing))
            VStack {
                Image(name: imageName)
                    .resizable()
                    .imageScale(.small)
                    .scaledToFit()
                    .frame(height: 120)
                
                ProgressView()
                    .controlSize(.extraLarge)
                    .padding(.top, 32)
            }
            .padding([.leading, .trailing], 48)
        }
        .compositingGroup()
        .onAppear(perform: {
          
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.easeInOut) {
                    self.imageName = .benfica4
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeInOut) {
                    self.imageName = .benfica3
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.easeInOut) {
                    self.imageName = .benfica2
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation(.easeInOut) {
                    self.imageName = .benfica1
                }
            }
        
        })
    }
    
    
}



