//
//  ProfileViewModel.swift
//  App837
//
//  Created by IGOR on 31/08/2024.
//

import SwiftUI
import CoreData

final class ProfileViewModel: ObservableObject {

    @Published var ProfPhotos: [String] = ["h1", "h2"]

    @AppStorage("PPhoto") var PPhoto: String = ""
    @AppStorage("PName") var PName: String = "Name"
    @AppStorage("rang") var rang: String = ""

    @Published var currentProfPhoto = ""
    @Published var addName = ""
    @Published var addRang = ""
    
    @Published var isProfile: Bool = false


}
