//
//  ComparisonView.swift
//  App837
//
//  Created by IGOR on 30/09/2024.
//

import SwiftUI

struct ComparisonView: View {
    
    @StateObject var viewModel: MatchViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Comprasion")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .bold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                            viewModel.statForOpen2 = 0
                            
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
                    
                    LazyVStack(spacing: 8) {
                        
                        Text("Select matches \(viewModel.statForOpen2)/2")
                            .foregroundColor(Color("prim2"))
                            .font(.system(size: 24, weight: .bold))
                        
                        ForEach(viewModel.matches, id: \.self) { index in
                        
                           Button(action: {
                               
                               selectOption(index)
                               
                           }, label: {
                               
                               HStack {
                                   
                                   VStack {
                                       
                                       Image(index.mHero ?? "")
                                           .resizable()
                                           .frame(width: 70, height: 70)
                                       
                                       Spacer()
                                       
                                       Text("\((index.mDate ?? Date()).convertDate(format: "dd.MM.YY"))")
                                           .foregroundColor(Color("prim2"))
                                           .font(.system(size: 14, weight: .medium))
                                           .padding(.horizontal)
                                           .frame(height: 32)
                                           .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg")))
                                   }
                                   
                                   VStack(spacing: 8) {
                                       
                                       HStack {
                                           
                                           Text(index.mHero ?? "")
                                               .foregroundColor(.white)
                                               .font(.system(size: 14, weight: .medium))
                                           
                                           Spacer()
                                           
                                       }
                                       
                                       HStack {
                                           
                                           Text("KDA")
                                               .foregroundColor(.white.opacity(0.5))
                                               .font(.system(size: 18, weight: .medium))
                                           
                                           Text(index.mKDA1 ?? "")
                                               .foregroundColor(.white)
                                               .font(.system(size: 18, weight: .medium))
                                               .padding(.leading)
                                           
                                           Text(index.mKDA2 ?? "")
                                               .foregroundColor(.white)
                                               .font(.system(size: 18, weight: .medium))
                                               .padding(.leading)
                                           
                                           Text(index.mKDA3 ?? "")
                                               .foregroundColor(.white)
                                               .font(.system(size: 18, weight: .medium))
                                               .padding(.leading)
                                           
                                           Spacer()
                                       }
                                       
                                       Spacer()
                                       
                                       Text(index.mRes ?? "")
                                           .foregroundColor(Color("prim2"))
                                           .font(.system(size: 16, weight: .semibold))
                                           .frame(maxWidth: .infinity)
                                           .frame(height: 32)
                                           .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg")))
                                   }
                               }
                               .padding()
                               .frame(maxWidth: .infinity)
                               .frame(height: 120)
                               .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                               .padding(2)
                               .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim2").opacity(viewModel.selectedMatch == index ? 1 : 0)))
                               .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim2").opacity(viewModel.selectedMatch2 == index ? 1 : 0)))

                           })
                        }
                    }
                }
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isStat = true
                    }
                    
                    viewModel.statForOpen2 = 0
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(Color("bg"))
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 7).fill(Color("prim2")))
                })
                .opacity(viewModel.statForOpen2 == 2 ? 1 : 0.5)
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchMatches()
        }
        .sheet(isPresented: $viewModel.isStat, content: {
            
            StatView(viewModel: viewModel)
        })
    }
    
    // Функция выбора переменной
      private func selectOption(_ index: MatchModel) {
          if viewModel.selectedMatch == index {
              viewModel.selectedMatch = nil // Убираем переменную A, если она уже выбрана
              viewModel.statForOpen2 -= 1
          } else if viewModel.selectedMatch2 == index {
              viewModel.selectedMatch2 = nil // Убираем переменную B, если она уже выбрана
              viewModel.statForOpen2 -= 1
          } else if viewModel.selectedMatch == nil {
              viewModel.selectedMatch = index // Назначаем переменной A
              viewModel.statForOpen2 += 1
          } else if viewModel.selectedMatch2 == nil {
              viewModel.selectedMatch2 = index // Назначаем переменной B
              viewModel.statForOpen2 += 1
          }
      }
}

#Preview {
    ComparisonView(viewModel: MatchViewModel())
}
