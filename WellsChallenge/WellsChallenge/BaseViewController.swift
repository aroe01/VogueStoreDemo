//
//  BaseViewController.swift
//  WellsChallenge
//
//  Created by Adrian Roe on 9/29/16.
//  Copyright © 2016 AdrianRoe. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    //should work by setting in plist, but failing for some reason
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
