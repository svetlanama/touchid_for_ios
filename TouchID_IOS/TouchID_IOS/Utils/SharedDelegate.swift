//
//  SharedDelegate.swift
//  Created by Svitlana Moiseyenko on 10/4/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation
import LocalAuthentication
import Security


let TOUCH_USERNAME =  "touch_username"
let TOUCH_PASS =  "touch_password"
let TOUCH_KEY = "touch_key"

final class SharedDelegate {
    
    static let sharedInstance = SharedDelegate()
    private var defaults: UserDefaults? {
        get {
            return UserDefaults.standard
        }
    }

    
    func resetTouchIDKey() {
        defaults?.removeObject(forKey: "hasTouchIDKey")
        defaults?.removeObject(forKey: "username")
  
//        let myKeychainWrapper = KeychainWrapper()
//        myKeychainWrapper.setNilValueForKey(kSecValueData as String)
//        myKeychainWrapper.writeToKeychain()
         defaults?.synchronize()
    }
    
    func isGetTouchIDKey() -> Bool {
        let hasLoginKey = defaults?.bool(forKey: TOUCH_KEY)
        return hasLoginKey!
    }
    
    func setTouchIDKey(username: String, password: String) {
        resetTouchIDKey()
         defaults?.setValue(username, forKey: "username")
//        let myKeychainWrapper = KeychainWrapper()
//        myKeychainWrapper.mySetObject(password, forKey:kSecValueData)
//        myKeychainWrapper.writeToKeychain()
         defaults?.set(true, forKey: TOUCH_KEY)
         defaults?.synchronize()
    }
    
    func getTouchIDData() -> [String: String]? {
        let hasLoginKey =  defaults?.bool(forKey: TOUCH_KEY)
        if hasLoginKey == false {
            return nil
        }

        let username =  defaults?.value(forKey: "username") as! String
//        let myKeychainWrapper = KeychainWrapper()
        let password = "TODO"//myKeychainWrapper.myObjectForKey("v_Data") as! String
        return [TOUCH_USERNAME : username, TOUCH_PASS: password]
    }
    
}
