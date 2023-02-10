//
//  DatabaseManager.swift
//  appv2
//
//  Created by Sabri Samed Eker on 06.02.23.
//

import Foundation
import FirebaseDatabase


final class DatabaseManger {
    
    static let shared = DatabaseManger()
    
    private let database = Database.database().reference()
    
}
// MARK: - Account Mgmt

extension DatabaseManger {
    
    public func userWithEmailExists(with email: String, completion: @escaping((Bool) -> Void)){
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
    
        database.child(safeEmail).observeSingleEvent(of: .value, with: {snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            completion(true)
        })
    }
    
    /// Insert new User to Database with ChatAppUser Object
    public func insertUser(with user: ChatAppUser) {
        database.child(user.safeEmail).setValue([
            "first_name" : user.firstName,
            "last_name" : user.lastName
        ])
    }
}



struct ChatAppUser {
    let firstName: String
    let lastName: String
    let email: String
    var safeEmail: String {
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
    
    //let profielPictureUrl: String
}

