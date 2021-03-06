//
//  LoginViewController.swift
//  WellsChallenge
//
//  Created by Adrian Roe on 9/28/16.
//  Copyright © 2016 AdrianRoe. All rights reserved.
//

import UIKit
import LocalAuthentication
import ionicons

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var AuthOverlayView : UIView!
    @IBOutlet weak var IphoneImage : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.IphoneImage.image = IonIcons.imageWithIcon(ion_iphone, size: 100, color: UIColor.whiteColor())
    }    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLoginButton(){
        self.AuthOverlayView.hidden = false
        self.authUser()
    }
    
    
    //Request auth by touch
    func authUser(){
        
        var error:NSError?
        let authenticationContext = LAContext()

        guard authenticationContext.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, error: &error) else {
            
            self.showAlertViewIfNoBiometricSensorHasBeenDetected()
            return
            
        }
        
        authenticationContext.evaluatePolicy(
            .DeviceOwnerAuthenticationWithBiometrics,
            localizedReason: "Verify your identity",
            reply: { [unowned self] (success, error) -> Void in
                
                if( success ) {
                    
                    // Go to view controller
                    self.navigateToAuthenticatedViewController()
                    
                }else {
                    if(error!.code == LAError.UserFallback.rawValue){
                        print("Fallback")
                        //TODO implement alternate login
                    }else{
                        self.showAlertWithTitle("Failure to Authenticate", message: "Please try again")
                    }
                    
                    //hide auth overlay
                    dispatch_async(dispatch_get_main_queue()) { () -> Void in
                        self.AuthOverlayView.hidden = true
                    }
                }
                
            })
    }
   
    func navigateToAuthenticatedViewController(){
        // Fingerprint recognized, trigger server updates
        ServerManager.Instance.postLogin()
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.performSegueWithIdentifier("segueToShopView", sender: self)
        }
    }
    
    
    func showAlertViewIfNoBiometricSensorHasBeenDetected(){
        //allows for devices that have no touchID, likely not for production but allows for quick testing in SIM
        self.navigateToAuthenticatedViewController()
        //showAlertWithTitle("Error", message: "This device does not have a TouchID sensor.")
        
    }
    
    func showAlertWithTitle( title:String, message:String ) {
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alertVC.addAction(okAction)
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            
            self.presentViewController(alertVC, animated: true, completion: nil)
            
        }
        
    }
    
   }

