//
//  AddProfile.swift
//  App837
//
//  Created by IGOR on 31/08/2024.
//

import SwiftUI

struct AddProfile: View {
    
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Profile")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.PName = viewModel.addName
                            viewModel.PPhoto = viewModel.currentProfPhoto
                            viewModel.rang = viewModel.addRang
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isProfile = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(Color("prim2"))
                                .font(.system(size: 16, weight: .medium))
                        })
                    }
                }
                .padding(.bottom, 40)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 20) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.ProfPhotos, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentProfPhoto = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentProfPhoto.isEmpty {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 32, weight: .regular))
                                    .frame(width: 240, height: 120)
                                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim2")))
                                    .padding(1)
                                
                            } else {
                                
                                Image(viewModel.currentProfPhoto)
                                    .resizable()
                                    .frame(width: 240, height: 120)
                                    .cornerRadius(15)

                            }
                            
                        })
                        .padding(.bottom)
                        
                        ZStack(content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .medium))
                                .opacity(viewModel.addName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addName)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        ZStack(content: {
                            
                            Text("Rang")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .medium))
                                .opacity(viewModel.addRang.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addRang)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddProfile(viewModel: ProfileViewModel())
}
