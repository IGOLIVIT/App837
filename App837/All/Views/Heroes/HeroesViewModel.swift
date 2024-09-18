//
//  HeroesViewModel.swift
//  App837
//
//  Created by IGOR on 31/08/2024.
//

import SwiftUI
import CoreData

final class HeroesViewModel: ObservableObject {
    
    @AppStorage("total") var total: Int = 0
    
    @AppStorage("wishs") var wishs: Int = 0
    @AppStorage("ip") var ip: Int = 0
    
    @Published var photoHeroes: [String] = ["Aatrox", "Ahri", "Akali", "Akshan", "Alistar", "Amumu", "Anivia", "Annie", "Alphelios"]
    @Published var currentHerPhoto = ""
    @AppStorage("curHer") var curHer: [String] = []

    @Published var isAddHero: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var desName: String = ""
    @Published var desPhoto: String = ""
    @Published var desAcc: String = ""
    @Published var desCost: String = ""
    @Published var desCom: String = ""

    @Published var selectedHero = ""
}
