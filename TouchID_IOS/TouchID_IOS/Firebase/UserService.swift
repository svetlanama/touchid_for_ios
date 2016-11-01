//
//  UserGateway.swift
//  
//
//  Created by Svitlana Moiseyenko on 3/12/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation
import Firebase

final class UserService {
  
  class private var firManager: FIRManager? {
    get {
      return FIRManager.sharedInstance.initialize()
    }
  }
    
  class func login(email: String, pass: String, completion: @escaping (_ error: String?) -> Void) {
    FIRAuth.auth()?.signIn(withEmail: email, password: pass, completion: {
      firuser, error in
      
      if error != nil {
        print("login failed:")
        completion(error!.localizedDescription)
      } else {
        completion(nil)
      }
    })
  }
  
  class func logout() {
    do {
      try FIRAuth.auth()?.signOut()
    } catch {
      print("Sign Out error")
    }
  }
  
  
}
