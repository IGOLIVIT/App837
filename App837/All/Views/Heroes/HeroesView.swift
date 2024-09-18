//
//  HeroesView.swift
//  App837
//
//  Created by IGOR on 31/08/2024.
//

import SwiftUI

struct HeroesView: View {
    
    @StateObject var viewModel = HeroesViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Heroes")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], content: {
                        
                        ForEach(viewModel.curHer, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.selectedHero = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDetail = true
                                }
                                
                            }, label: {
                                
                                VStack(spacing: 8) {
                                    
                                    Image(index)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100)
                                        .padding(3)
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                }
                            })
                        }
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddHero = true
                            }
                            
                        }, label: {
                            
                            VStack {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(Color("bg"))
                                    .font(.system(size: 16, weight: .medium))
                                    .frame(width: 30, height: 30)
                                    .background(RoundedRectangle(cornerRadius: 6).fill(Color("prim2")))
                                    .frame(width: 100, height: 110)
                                    .background(Circle().stroke(Color("prim2"), lineWidth: 5))
                                    .padding(3)
                                
                                Text("Add")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                            }
                        })
                    })
                }
                
                Spacer()
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAddHero, content: {
            
            AddHeroes(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            HerDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    HeroesView()
}
