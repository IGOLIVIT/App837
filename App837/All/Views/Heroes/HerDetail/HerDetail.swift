//
//  HerDetail.swift
//  App837
//
//  Created by IGOR on 01/09/2024.
//

import SwiftUI

struct HerDetail: View {

    @StateObject var viewModel: HeroesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Hero")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .bold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Image(viewModel.selectedHero)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                    
                    Text(viewModel.selectedHero)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    Image("herdet")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    HerDetail(viewModel: HeroesViewModel())
}
