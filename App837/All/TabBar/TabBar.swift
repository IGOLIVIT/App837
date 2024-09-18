//
//  TabBar.swift
//  App837
//
//  Created by IGOR on 31/08/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("prim2") : Color.gray)
                            .frame(width: 13, height: 13)

//                        Text(index.rawValue)
//                            .foregroundColor(selectedTab == index ? Color("prim2") : Color.gray.opacity(0.4))
//                            .font(.system(size: 8, weight: .regular))

                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 38)
        .background(RoundedRectangle(cornerRadius: 0).fill(Color("bg")))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Profile = "Profile"
    
    case Statistic = "Statistic"
    
    case Match = "Match"
    
    case Heroes = "Heroes"
            
}
