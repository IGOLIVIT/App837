//
//  AddHeroes.swift
//  App837
//
//  Created by IGOR on 01/09/2024.
//

import SwiftUI

struct AddHeroes: View {
    
    @StateObject var viewModel: HeroesViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("All heroes")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], content: {
                        
                        ForEach(viewModel.photoHeroes, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentHerPhoto = index
                                
                            }, label: {
                                
                                VStack(spacing: 8) {
                                    
                                    Image(index)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100)
                                        .padding(3)
                                        .background(Circle().fill(Color("prim2").opacity(viewModel.currentHerPhoto == index ? 1 : 0)))
                                    
                                    Text(index)
                                        .foregroundColor(viewModel.currentHerPhoto == index ? Color("prim2") : .white)
                                        .font(.system(size: 15, weight: .medium))
                                }
                            })
                        }
                    })
                }
                
                Button(action: {
                    
                    viewModel.curHer.append(viewModel.currentHerPhoto)
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAddHero = false
                    }
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(Color("bg"))
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 7).fill(Color("prim2")))
                })
            }
            .padding()
        }
    }
}

#Preview {
    AddHeroes(viewModel: HeroesViewModel())
}
