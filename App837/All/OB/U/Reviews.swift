//
//  Reviews.swift
//  App837
//
//  Created by IGOR on 31/08/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("Reviews")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("Rate uor app in the AppStore")
                    .foregroundColor(Color.white)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.horizontal)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Not()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(Color.black)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim3")))
                })
                .padding()
            }
        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews()
}
