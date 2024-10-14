//
//  AddMatch.swift
//  App837
//
//  Created by IGOR on 01/09/2024.
//

import SwiftUI

struct AddMatch: View {
    
    @StateObject var viewModel: MatchViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Match")
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
                    
                    VStack(spacing: 20) {
                        
                        Text("Category")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
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
                        
                        Text("Date")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                        DatePicker("", selection: $viewModel.mDate, displayedComponents: .date)
                            .labelsHidden()
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        Text("KDA")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                        HStack {
                            
                            ZStack(content: {
                                
                                Text("0")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))
                                    .opacity(viewModel.mKDA1.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.mKDA1)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                            
                            ZStack(content: {
                                
                                Text("0")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))
                                    .opacity(viewModel.mKDA2.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.mKDA2)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                            
                            ZStack(content: {
                                
                                Text("0")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))
                                    .opacity(viewModel.mKDA3.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.mKDA3)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        }
                        
                        Text("Result")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                        HStack {
                            
                            ForEach(viewModel.results, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentRes = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(viewModel.currentRes == index ? Color("bg") : Color("prim2"))
                                        .font(.system(size: 14, weight: .medium))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 30)
                                        .background(RoundedRectangle(cornerRadius: 3).fill(Color("prim2").opacity(viewModel.currentRes == index ? 1 : 0)))
                                })
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 30)
                        .background(RoundedRectangle(cornerRadius: 3).fill(.white.opacity(0.05)))
                        
                        Text("Hero")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                        if viewModel.currentHerForAdd.isEmpty {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddHero = true
                                }
                                
                            }, label: {
                                
                                Text("Select")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 7).fill(Color("prim")))
                            })
                            
                        } else {
                            
                            Image(viewModel.currentHerForAdd)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                                .padding(3)
                            
                            
                            Text(viewModel.currentHerForAdd)
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                        }
                    }
                }
                
                Button(action: {
                    
                    viewModel.games += 1
                    
                    if viewModel.currentRes == "Victory" {
                        
                        viewModel.victories += 1
                        
                    } else if viewModel.currentRes == "Defeat" {
                        
                        viewModel.defeats += 1

                    }
                    
                    viewModel.kda1 += Int(viewModel.mKDA1) ?? 0
                    viewModel.kda2 += Int(viewModel.mKDA2) ?? 0
                    viewModel.kda3 += Int(viewModel.mKDA3) ?? 0
                    
                    viewModel.mCat = viewModel.currentCat
                    viewModel.mRes = viewModel.currentRes
                    viewModel.mHero = viewModel.currentHerForAdd
                    
                    viewModel.addMatch()
                    
                    viewModel.mKDA1 = ""
                    viewModel.mKDA2 = ""
                    viewModel.mKDA3 = ""
                    viewModel.currentRes = ""
                    
                    viewModel.currentHerForAdd = ""
                    
                    viewModel.fetchMatches()
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = false
                    }
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(Color("prim2"))
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 7).fill(Color("prim")))
                })
                .opacity(viewModel.currentCat.isEmpty || viewModel.currentRes.isEmpty || viewModel.mKDA1.isEmpty || viewModel.mKDA2.isEmpty || viewModel.mKDA3.isEmpty ? 0.5 : 1)
                .disabled(viewModel.currentCat.isEmpty || viewModel.currentRes.isEmpty || viewModel.mKDA1.isEmpty || viewModel.mKDA2.isEmpty || viewModel.mKDA3.isEmpty ? true : false)
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAddHero, content: {
            
            HerForAdd(viewModel: viewModel)
        })
    }
}

#Preview {
    AddMatch(viewModel: MatchViewModel())
}
