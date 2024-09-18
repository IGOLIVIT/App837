//
//  ContentView.swift
//  App837
//
//  Created by IGOR on 31/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Profile

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            if status {
            
            VStack(spacing: 0, content: {
            
                    TabView(selection: $current_tab, content: {

                        ProfileView()
                            .tag(Tab.Profile)
                        
                        StatisticView()
                            .tag(Tab.Statistic)
                        
                        MatchView()
                            .tag(Tab.Match)
                        
                        HeroesView()
                            .tag(Tab.Heroes)
                        
                    })
                    
                    TabBar(selectedTab: $current_tab)
                })
                    .ignoresSafeArea(.all, edges: .bottom)
                    .onAppear {
                        
                    }
                
            } else {
                
                R1()
            }
        }
    }
}

#Preview {
    ContentView()
}
