//
//  SaveUserModel.swift
//  appv2
//
//  Created by Sabri Samed Eker on 05.02.23.
//

import Foundation
import FirebaseDatabase



final class CreateUserModel: ObservableObject {
    
    @Published var users: [UserSaveDBModel] = []
    
    
    private lazy var databasePath: DatabaseReference? = {
        let ref = Database.database().reference().child("users")
        return ref
    }()
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    
    func listentoRealtimeDatabase() {
          guard let databasePath = databasePath else {
              return
          }
        
        let userData = try JSONSerialization.data(withJSONObject: json)
        let user = try self.decoder.decode(UserSaveDBModel.self, from:
        userData)
        self.user.append(user)
        
        databasePath.childByAutoId().setValue(self.encoder.encode(UserSaveDBModel.self, from: userData))
          databasePath
            .observe(.childAdded) { [weak self] snapshot, arg in
                  guard
                      let self = self,
                      var json = snapshot.value as? [String: Any]
                  else {
                      return
                  }
                  json["id"] = snapshot.key
                  do {
                      let userData = try JSONSerialization.data(withJSONObject: json)
                      let user = try self.decoder.decode(UserSaveDBModel.self, from:
                      userData)
                      self.user.append(user)
                  } catch {
                      print("an error occurred", error)
                  }
              }
      }
      
      func stopListening() {
          databasePath?.removeAllObservers()
      }
    
    
    
}
