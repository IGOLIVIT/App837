//
//  R2.swift
//  App837
//
//  Created by IGOR on 31/08/2024.
//

import SwiftUI

struct R2: View {
    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("See the progress of games through statistics")
                    .foregroundColor(Color("prim2"))
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    R3()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(Color("bg"))
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim2")))
                })
                .padding()
            }
        }
    }
}

#Preview {
    R2()
}
