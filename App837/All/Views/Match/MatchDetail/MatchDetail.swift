//
//  MatchDetail.swift
//  App837
//
//  Created by IGOR on 02/09/2024.
//

import SwiftUI

struct MatchDetail: View {

    @StateObject var viewModel: MatchViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.selectedMatch?.mRes ?? "")
                        .foregroundColor(Color("prim2"))
                        .font(.system(size: 26, weight: .bold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            Text("Match")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom, 25)
                
                Image("line")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 17) {
                        
                        Text("\((viewModel.selectedMatch?.mDate ?? Date()).convertDate(format: "dd.MM.YY"))")
                            .foregroundColor(Color("prim2"))
                            .font(.system(size: 18, weight: .medium))
                            .frame(height: 42)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                        
                        VStack(spacing: 17) {
                            
                            Image(viewModel.selectedMatch?.mHero ?? "")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120)
                                .overlay(
                                
                                    VStack {
                                        
                                        Spacer()
                                        
                                        Text(viewModel.selectedMatch?.mHero ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .medium))
                                            .padding(8)
                                    }
                                )
                            
                            HStack {
                                
                                VStack(spacing: 6) {
                                    
                                    Text("Position")
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .medium))
                                    
                                    Text("Middle")
                                        .foregroundColor(Color("prim2"))
                                        .font(.system(size: 16, weight: .medium))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg")))
                                
                                VStack(spacing: 6) {
                                    
                                    Text("Role")
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .medium))
                                    
                                    Text("Assasin")
                                        .foregroundColor(Color("prim2"))
                                        .font(.system(size: 16, weight: .medium))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg")))
                            }
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                        
                        
                        HStack {
                            
                            Text("KDA")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                            
                            Spacer()
                            
                            Text(viewModel.selectedMatch?.mKDA1 ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                            
                            Image(systemName: "diamond.fill")
                                .foregroundColor(Color("prim2"))
                                .font(.system(size: 10, weight: .regular))
                            
                            Text(viewModel.selectedMatch?.mKDA2 ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                            
                            Image(systemName: "diamond.fill")
                                .foregroundColor(Color("prim2"))
                                .font(.system(size: 10, weight: .regular))
                            
                            Text(viewModel.selectedMatch?.mKDA3 ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                            
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                        
                        Image("herdet2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    MatchDetail(viewModel: MatchViewModel())
}
