//
//  StatisticView.swift
//  App837
//
//  Created by IGOR on 31/08/2024.
//

import SwiftUI

struct StatisticView: View {
    
    @StateObject var viewModel = StatistisViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Statstic")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .padding(.bottom, 25)
                
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
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 17) {
                        
                        HStack {
                            
                            VStack(spacing: 7) {
                                
                                Text("Victories")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 14, weight: .medium))
                                
                                Text("\(viewModel.victories)")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 14, weight: .medium))
                                
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack(spacing: 12) {
                                
                                Text("Games")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .medium))
                                
                                Text("\(viewModel.victories)")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 18, weight: .medium))
                                
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack(spacing: 7) {
                                
                                Text("Defeats")
                                    .foregroundColor(Color("prim2").opacity(0.7))
                                    .font(.system(size: 14, weight: .medium))
                                
                                Text("\(viewModel.defeats)")
                                    .foregroundColor(Color("prim2").opacity(0.7))
                                    .font(.system(size: 14, weight: .medium))
                                
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding(.horizontal, 40)
                        
                        HStack {
                            
                            Text("KDA")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Spacer()
                            
                            Text("\(viewModel.kda1)")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                                .padding(.horizontal, 4)
                            
                            Text("\(viewModel.kda2)")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                                .padding(.horizontal, 4)
                            
                            Text("\(viewModel.kda3)")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                                .padding(.horizontal, 4)
                            
                            Spacer()
                            
                            Text("\((viewModel.kda1 + viewModel.kda3)/100)")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 7).fill(Color("bg2")))
                        
                        Text("Position")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        if viewModel.currentCat == "Rating" {
                            
                            HStack {
                                
                                VStack {
                                    
                                    Image("pp1")
                                    
                                    Text("\(viewModel.po1)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 80)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                                
                                VStack {
                                    
                                    Image("pp2")
                                    
                                    Text("\(viewModel.po2)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 80)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                                
                                VStack {
                                    
                                    Image("pp3")
                                    
                                    Text("\(viewModel.po3)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 80)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                                
                                VStack {
                                    
                                    Image("pp4")
                                    
                                    Text("\(viewModel.po4)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 80)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                                
                                VStack {
                                    
                                    Image("pp5")
                                    
                                    Text("\(viewModel.po5)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 80)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                            }
                            
                        } else {
                            
                            HStack {
                                
                                VStack {
                                    
                                    Image("pp1")
                                    
                                    Text("\(viewModel.po5)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 80)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                                
                                VStack {
                                    
                                    Image("pp2")
                                    
                                    Text("\(viewModel.po4)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 80)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                                
                                VStack {
                                    
                                    Image("pp3")
                                    
                                    Text("\(viewModel.po3)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 80)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                                
                                VStack {
                                    
                                    Image("pp4")
                                    
                                    Text("\(viewModel.po1)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 80)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                                
                                VStack {
                                    
                                    Image("pp5")
                                    
                                    Text("\(viewModel.po2)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 80)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                            }
                            
                        }
                        
                        Text("Top heroes")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            Image("rect")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                                .overlay(
                                    
                                    VStack {
                                        
                                        if viewModel.currentCat == "Rating" {
                                            
                                            Image("Annie")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                            
                                            Text("Annie")
                                                .foregroundColor(.white)
                                                .font(.system(size: 12, weight: .regular))
                                            
                                        } else {
                                            
                                            Image("Alphelios")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                            
                                            Text("Alphelios")
                                                .foregroundColor(.white)
                                                .font(.system(size: 12, weight: .regular))
                                        }
                                        
                                        Spacer()
                                        
                                        Text("3")
                                            .foregroundColor(Color("prim2"))
                                            .font(.system(size: 18, weight: .semibold))
                                        
                                    }
                                        .padding()
                                )
                            
                            Image("rectw")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                                .overlay(
                                    
                                    VStack {
                                        
                                        if viewModel.currentCat == "Rating" {
                                            
                                            Image("Amumu")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                            
                                            Text("Amumu")
                                                .foregroundColor(.white)
                                                .font(.system(size: 12, weight: .regular))
                                            
                                        } else {
                                            
                                            Image("Alistar")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                            
                                            Text("Alistar")
                                                .foregroundColor(.white)
                                                .font(.system(size: 12, weight: .regular))
                                        }
                                        
                                        Spacer()
                                        
                                        Text("1")
                                            .foregroundColor(Color("prim2"))
                                            .font(.system(size: 18, weight: .semibold))
                                        
                                    }
                                        .padding()
                                )
                            
                            Image("rect")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                                .overlay(
                                    
                                    VStack {
                                        
                                        if viewModel.currentCat == "Rating" {
                                            
                                            Image("Akali")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                            
                                            Text("Akali")
                                                .foregroundColor(.white)
                                                .font(.system(size: 12, weight: .regular))
                                            
                                        } else {
                                            
                                            Image("Anivia")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                            
                                            Text("Anivia")
                                                .foregroundColor(.white)
                                                .font(.system(size: 12, weight: .regular))
                                        }
                                        
                                        Spacer()
                                        
                                        Text("2")
                                            .foregroundColor(Color("prim2"))
                                            .font(.system(size: 18, weight: .semibold))
                                        
                                    }
                                        .padding()
                                )
                        }
                        
                        Text("Role")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        if viewModel.currentCat == "Rating" {
                        
                        HStack {
                            
                            VStack {
                                
                                Image("rr1")
                                
                                Text("\(viewModel.rr1)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                            
                            VStack {
                                
                                Image("rr2")
                                
                                Text("\(viewModel.rr2)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                            
                            VStack {
                                
                                Image("rr3")
                                
                                Text("\(viewModel.rr3)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                        }
                        
                        HStack {
                            
                            VStack {
                                
                                Image("rr4")
                                
                                Text("\(viewModel.rr4)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                            
                            VStack {
                                
                                Image("rr5")
                                
                                Text("\(viewModel.rr5)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                            
                            VStack {
                                
                                Image("rr6")
                                
                                Text("\(viewModel.rr6)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                        }
                        
                    } else {
                        
                        HStack {
                            
                            VStack {
                                
                                Image("rr1")
                                
                                Text("\(viewModel.rr6)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                            
                            VStack {
                                
                                Image("rr2")
                                
                                Text("\(viewModel.rr5)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                            
                            VStack {
                                
                                Image("rr3")
                                
                                Text("\(viewModel.rr4)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                        }
                        
                        HStack {
                            
                            VStack {
                                
                                Image("rr4")
                                
                                Text("\(viewModel.rr3)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                            
                            VStack {
                                
                                Image("rr5")
                                
                                Text("\(viewModel.rr2)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                            
                            VStack {
                                
                                Image("rr6")
                                
                                Text("\(viewModel.rr1)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                        }
                    }
                    }
                }

            }
            .padding()
        }
    }
}

#Preview {
    StatisticView()
}
