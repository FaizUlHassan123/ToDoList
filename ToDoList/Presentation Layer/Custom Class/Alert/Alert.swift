//
//  Alert.swift
//  ToDoList
//
//  Created by Faiz Ul Hassan on 8/1/21.
//

import Foundation
import UIKit

class Alert {
    
    public static func showAlert(vc: UIViewController, title:  String, message: String, actionTitle : String = "OK", handler: ((UIAlertAction) -> ())? = nil ) {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let alertActionOK = UIAlertAction.init(title: actionTitle, style: UIAlertAction.Style.default, handler: handler)
        alertController.addAction(alertActionOK)
        vc.present(alertController, animated: true, completion: nil)
    }
    
    public static func showConfirmationAlert(vc: UIViewController, title:  String, message: String, actionTitle1 : String = "Yes", actionTitle2 : String = "Cancel", handler1: ((UIAlertAction) -> ())? = nil, handler2: ((UIAlertAction) -> ())? = nil ) {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: UIDevice.current.userInterfaceIdiom == .phone ? .actionSheet : .alert)
        let alertActionYes = UIAlertAction.init(title: actionTitle1, style: UIAlertAction.Style.destructive, handler: handler1)
        let alertActionNo = UIAlertAction.init(title: actionTitle2, style: UIAlertAction.Style.cancel, handler: handler2)
        alertController.addAction(alertActionYes)
        alertController.addAction(alertActionNo)
        vc.present(alertController, animated: true, completion: nil)
    }
    
    
    public static func showNoInternetAlert(vc:UIViewController, handler: ((UIAlertAction) -> ())? = nil) {
        let alertController = UIAlertController.init(title: "No Internet!", message: "Sorry! No internet \n connection found.", preferredStyle: UIAlertController.Style.alert)
        let alertActionYes = UIAlertAction.init(title: "Dismiss", style: UIAlertAction.Style.destructive, handler: nil)
        let alertActionNo = UIAlertAction.init(title: "Retry", style: UIAlertAction.Style.default, handler: handler)
        alertController.addAction(alertActionYes)
        alertController.addAction(alertActionNo)
        vc.present(alertController, animated: true, completion: nil)
        
    }
    
    public static func showNoInternetAlert1(vc: UIViewController){
        self.showAlert(vc: vc, title: "No Internet!", message: "Sorry! No internet connection found.")
    }
    
}
