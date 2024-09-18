//
//  ProfileView.swift
//  App837
//
//  Created by IGOR on 31/08/2024.
//

import SwiftUI
import StoreKit

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 8) {
                
                ZStack {
                    
                    Text("Profile")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .semibold))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isProfile = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                        })
                    }
                }
                .padding(.bottom, 35)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 22) {
                        
                        Text(viewModel.PName)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                        
                        if viewModel.PPhoto.isEmpty {
                            
                            Image(systemName: "photo")
                                .foregroundColor(Color("prim2"))
                                .font(.system(size: 32, weight: .regular))
                                .frame(width: 240, height: 120)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim2")))
                            
                        } else {
                            
                            Image(viewModel.PPhoto)
                                .resizable()
                                .frame(width: 240, height: 120)

                        }
                        
                        HStack {
                            
                            Image("line")
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .frame(height: 9)
                            
                            Text("Rang")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                            
                            Image("line")
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .frame(height: 9)
                        }
                        
                        Text(viewModel.rang)
                            .foregroundColor(Color("bg"))
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                            .padding(.bottom, 55)
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/60caf4a5-ddb8-4772-87da-6f8ebe58f420") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            Text("Usage Policy")
                                .foregroundColor(Color("prim2"))
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))

                        })
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            Text("Rate App")
                                .foregroundColor(Color("prim2"))
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))

                        })
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isProfile, content: {
            
            AddProfile(viewModel: viewModel)
        })
    }
}

#Preview {
    ProfileView()
}
