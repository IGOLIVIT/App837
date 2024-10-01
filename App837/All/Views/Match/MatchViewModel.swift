//
//  MatchViewModel.swift
//  App837
//
//  Created by IGOR on 31/08/2024.
//

import SwiftUI
import CoreData

final class MatchViewModel: ObservableObject {
    

    
    @Published var selectedMatch: MatchModel?
    @Published var selectedMatch2: MatchModel?
    
    @Published var po1: String = String(format: "%.f", Double(.random(in: 1...9)))
    @Published var po2: String = String(format: "%.f", Double(.random(in: 1...9)))
    @Published var po3: String = String(format: "%.f", Double(.random(in: 1...9)))
    @Published var po4: String = String(format: "%.f", Double(.random(in: 1...9)))
    @Published var po5: String = String(format: "%.f", Double(.random(in: 1...9)))

    @AppStorage("matchAmount") var matchAmount: Int = 0
    @AppStorage("statForOpen2") var statForOpen2: Int = 0
    
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

    @Published var isAddHero: Bool = false
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isMatchesEmpty: Bool = false
    @Published var isComprasion: Bool = false
    @Published var isStat: Bool = false
    
    @Published var mCat: String = ""
    @Published var mDate: Date = Date()
    @Published var mKDA1: String = ""
    @Published var mKDA2: String = ""
    @Published var mKDA3: String = ""
    @Published var mRes: String = ""
    @Published var mHero: String = ""

    @Published var matches: [MatchModel] = []

    func addMatch() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "MatchModel", into: context) as! MatchModel

        loan.mCat = mCat
        loan.mDate = mDate
        loan.mKDA1 = mKDA1
        loan.mKDA2 = mKDA2
        loan.mKDA3 = mKDA3
        loan.mRes = mRes
        loan.mHero = mHero

        CoreDataStack.shared.saveContext()
    }

    func fetchMatches() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MatchModel>(entityName: "MatchModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.matches = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.matches = []
        }
    }
}
