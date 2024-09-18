//
//  StatistisViewModel.swift
//  App837
//
//  Created by IGOR on 31/08/2024.
//

import SwiftUI

final class StatistisViewModel: ObservableObject {
    
    @Published var po1: String = String(format: "%.f", Double(.random(in: 1...9)))
    @Published var po2: String = String(format: "%.f", Double(.random(in: 1...9)))
    @Published var po3: String = String(format: "%.f", Double(.random(in: 1...9)))
    @Published var po4: String = String(format: "%.f", Double(.random(in: 1...9)))
    @Published var po5: String = String(format: "%.f", Double(.random(in: 1...9)))
    
    @Published var rr1: String = String(format: "%.f", Double(.random(in: 1...9)))
    @Published var rr2: String = String(format: "%.f", Double(.random(in: 1...9)))
    @Published var rr3: String = String(format: "%.f", Double(.random(in: 1...9)))
    @Published var rr4: String = String(format: "%.f", Double(.random(in: 1...9)))
    @Published var rr5: String = String(format: "%.f", Double(.random(in: 1...9)))
    @Published var rr6: String = String(format: "%.f", Double(.random(in: 1...9)))
    
    @AppStorage("kda1") var kda1: Int = 0
    @AppStorage("kda2") var kda2: Int = 0
    @AppStorage("kda3") var kda3: Int = 0
    @AppStorage("sumKda") var sumKda: Int = 0
    
    @AppStorage("games") var games: Int = 0
    @AppStorage("victories") var victories: Int = 0
    @AppStorage("defeats") var defeats: Int = 0
    
    @Published var categories: [String] = ["Rating", "Normal"]
    @Published var currentCat = "Rating"
    
    @Published var results: [String] = ["Victory", "Dafeat"]
    @Published var currentRes = "Victory"
    
    @Published var photoHeroes: [String] = ["Aatrox", "Ahri", "Akali", "Akshan", "Alistar", "Amumu", "Anivia", "Annie", "Alphelios"]
    @Published var currentHerPhoto = ""
    @Published var currentHerForAdd = ""
    @AppStorage("curHer") var curHer: [String] = []
}
