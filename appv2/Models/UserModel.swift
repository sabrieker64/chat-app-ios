//
//  UserModel.swift
//  appv2
//
//  Created by Sabri Samed Eker on 05.02.23.
//

import Foundation



//User Creation Object to the DB


struct UserSaveDBModel: Identifiable, Codable {
    let id: String
    let firstname: String
    let lastname: String
        
    
}
