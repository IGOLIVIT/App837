//
//  MatchView.swift
//  App837
//
//  Created by IGOR on 31/08/2024.
//

import SwiftUI

struct MatchView: View {
    
    @StateObject var viewModel = MatchViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Match")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .bold))
                        .padding(.bottom, 25)
                    
                    HStack {
                        
                        Spacer()
                        
                        if viewModel.games < 2 {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isMatchesEmpty = true
                                    
                                }
                                
                            }, label: {
                                
                                Image(systemName: "arrow.left.arrow.right.square.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .medium))
                                
                            })
                            
                        } else {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isComprasion = true
                                }
                                
                            }, label: {
                                
                                Image(systemName: "arrow.left.arrow.right.square.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .medium))
                                
                            })
                            
                        }
                    }
                }
                
                HStack {
                    
                    ForEach(viewModel.categories, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currentCat = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 25)
                                .background(RoundedRectangle(cornerRadius: 3).fill(Color("prim").opacity(viewModel.currentCat == index ? 1 : 0)))
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 25)
                .background(RoundedRectangle(cornerRadius: 3).fill(.white.opacity(0.05)))
                
                if viewModel.matches.isEmpty {
                    
                    VStack {
                        
                        Image("line")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Text("You have no played matches yet. Add the first one.")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .medium))
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 25)
                        
                        Image("line")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 8) {
                            
                            ForEach(viewModel.matches.filter{($0.mCat ?? "") == viewModel.currentCat}, id: \.self) { index in
                            
                               Button(action: {
                                   
                                   viewModel.selectedMatch = index
                                   
                                   withAnimation(.spring()) {
                                       
                                       viewModel.isDetail = true
                                   }
                                   
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
                               })
                            }
                        }
                    }
                }
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Text("Add match")
                        .foregroundColor(Color("prim2"))
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 7).fill(Color("prim")))
                })
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchMatches()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddMatch(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            MatchDetail(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isMatchesEmpty ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isMatchesEmpty = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isMatchesEmpty = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isMatchesEmpty = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isMatchesEmpty = false
                            }
                            
                        }, label: {
                            
                            Text("Close")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isMatchesEmpty ? 0 : UIScreen.main.bounds.height)
            }
        )
        .sheet(isPresented: $viewModel.isComprasion, content: {
            
            ComparisonView(viewModel: viewModel)
        })
    }
}

#Preview {
    MatchView()
}
