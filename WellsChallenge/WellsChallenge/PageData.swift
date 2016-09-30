//
//  PageData.swift
//  WellsChallenge
//
//  Created by Adrian Roe on 9/29/16.
//  Copyright © 2016 AdrianRoe. All rights reserved.
//

import Foundation


//Basic info around the pages on the main store view
class PageData {
    var Title : String
    var Description : String
    var JumpText : String
    var BackgroundImage : String
    
    init(title : String, desc : String, jumpText : String, background : String){
        self.Title = title
        self.Description = desc
        self.JumpText = jumpText
        self.BackgroundImage = background
    }
}