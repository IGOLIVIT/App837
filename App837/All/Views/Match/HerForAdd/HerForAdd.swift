//
//  HerForAdd.swift
//  App837
//
//  Created by IGOR on 01/09/2024.
//

import SwiftUI

struct HerForAdd: View {

    @StateObject var viewModel: MatchViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Heroes")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .padding(.bottom, 25)
                
                if viewModel.curHer.isEmpty {
                    
                    VStack(spacing: 14) {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 32, weight: .bold))
                        
                        Text("Add Hero")
                            .foregroundColor(.gray)
                            .font(.system(size: 17, weight: .medium))
                        
                        Button(action: {
                                                        
                            withAnimation(.spring()) {
                                
                                viewModel.isPlusHero = true
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(Color("prim2"))
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 7).fill(Color("prim")))
                        })
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.curHer, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentHerForAdd = index
                                    
                                }, label: {
                                    
                                    VStack(spacing: 8) {
                                        
                                        Image(index)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100)
                                            .padding(3)
                                            .background(Circle().fill(Color("prim2").opacity(viewModel.currentHerForAdd == index ? 1 : 0)))
                                        
                                        Text(index)
                                            .foregroundColor(viewModel.currentHerForAdd == index ? Color("prim2") : .white)
                                            .font(.system(size: 15, weight: .medium))
                                    }
                                })
                            }
                        })
                    }
                                        
                    Button(action: {
                        
                        viewModel.mHero = viewModel.currentHerForAdd
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddHero = false
                        }
                        
                    }, label: {
                        
                        Text("Select")
                            .foregroundColor(Color("prim2"))
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 7).fill(Color("prim")))
                    })
                    .opacity(viewModel.currentHerForAdd.isEmpty ? 0.6 : 1)
                    .disabled(viewModel.currentHerForAdd.isEmpty ? true : false)
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isPlusHero, content: {
            
            AddHeroes(viewModel: HeroesViewModel())
        })
    }
}

#Preview {
    HerForAdd(viewModel: MatchViewModel())
}
