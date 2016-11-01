//
//  FIRManager.swift
// 
//
//  Created by Svitlana Moiseyenko on 5/27/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation
import Firebase

class FIRManager {
  
  var rootRef = FIRDatabaseReference.init()
  
  static let sharedInstance = FIRManager()
  
  func initialize() -> FIRManager {
    rootRef = FIRDatabase.database().reference()


    return self
  }
}
