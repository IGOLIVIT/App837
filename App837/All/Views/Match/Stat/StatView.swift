//
//  StatView.swift
//  App837
//
//  Created by IGOR on 30/09/2024.
//

import SwiftUI

struct StatView: View {
    
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
                            
                            viewModel.statForOpen2 = 0
                            viewModel.selectedMatch = nil
                            viewModel.selectedMatch2 = nil
                            viewModel.isStat = false
                            
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
                    
                    Text("Result")
                        .foregroundColor(Color("prim2"))
                        .font(.system(size: 24, weight: .bold))
                    
                    VStack(spacing: 17) {
                        
                        HStack {
                            
                            ZStack {
                                
                                VStack {
                                    
                                    Text("\(String(format: "%.f", Double(calculatePercentage())))%")
                                        .foregroundColor(Color("prim2"))
                                        .font(.system(size: 24, weight: .bold))
                                    
                                }
                                
                                Circle()
                                    .trim(from: 0, to: CGFloat(calculatePercentage() / 100))
                                    .stroke(Color("prim2"), lineWidth: 8)
                                    .frame(width: 130, height: 130)
                                    .rotationEffect(.degrees(-90))
                                
                            }
                            .padding(.trailing)
                            
                            VStack(alignment: .leading, spacing: 14) {
                                
                                Text("Best support")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 18, weight: .semibold))
                                
                                Text(viewModel.selectedMatch?.mKDA2 ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                                
                                Image("line")
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 5)
                                
                                Text("Least deaths")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 18, weight: .semibold))
                                
                                Text(viewModel.selectedMatch2?.mKDA3 ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            
                        }
                        
                    }
                    .padding(20)
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
                    
                    VStack(spacing: 17) {
                        
                        Image(viewModel.selectedMatch2?.mHero ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120)
                            .overlay(
                                
                                VStack {
                                    
                                    Spacer()
                                    
                                    Text(viewModel.selectedMatch2?.mHero ?? "")
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
                        
                        Text(viewModel.selectedMatch2?.mKDA1 ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                        
                        Image(systemName: "diamond.fill")
                            .foregroundColor(Color("prim2"))
                            .font(.system(size: 10, weight: .regular))
                        
                        Text(viewModel.selectedMatch2?.mKDA2 ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                        
                        Image(systemName: "diamond.fill")
                            .foregroundColor(Color("prim2"))
                            .font(.system(size: 10, weight: .regular))
                        
                        Text(viewModel.selectedMatch2?.mKDA3 ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                        
                        Spacer()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                    
                }

            }
            .padding()
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.statForOpen2 = 0
                    viewModel.selectedMatch = nil
                    viewModel.selectedMatch2 = nil
                    viewModel.isStat = false
                    
                }, label: {
                    
                    Text("Compare")
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
    
    func calculatePercentage() -> Double {
        
        let value = Int(viewModel.selectedMatch?.mKDA1 ?? "") ?? 0
        let maxValue = Int(viewModel.selectedMatch2?.mKDA1 ?? "") ?? 0
        
        let percentCircle = Double(value) / Double(maxValue) * 100
        
        return percentCircle
    }
}

#Preview {
    StatView(viewModel: MatchViewModel())
}
