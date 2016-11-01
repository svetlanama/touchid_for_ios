//
//  AlertUtils.swift
//
//  Created by Alexander on 1/27/16.
//
//

import UIKit

final class AlertUtil {
    
    typealias ButtonConfigure = (action: ((UIAlertAction) -> Void)?, style: UIAlertActionStyle)
    typealias AlertButtons = [String: ButtonConfigure]
    
    class func showAlert(targetVC: UIViewController?, title: String?, message: String?, buttons: [String: ((UIAlertAction) -> Void)?]) {

        var dict = AlertButtons()
        buttons.forEach { (key, value) in
            dict[key] = ButtonConfigure(value, style: .default)
        }
        
        showAlert(targetVC: targetVC, title: title, message: message, buttons: dict)
    }

    class func showAlert(targetVC: UIViewController?, title: String?, message: String?, buttons: AlertButtons) {

        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.alert)
        
        for (title, handler) in buttons {
            let alertButton = UIAlertAction(
                title: title,
                style: handler.style,
                handler: handler.action)
            
            alert.addAction(alertButton)
        }
    
        if (targetVC == nil) {
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        } else {
            targetVC!.present(alert, animated: true, completion: nil)
        }
    }
}
