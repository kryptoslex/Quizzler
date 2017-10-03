//
//  Rounded.swift
//  Quizzler
//
//  Created by Michael Jay Abalos on 03/10/2017.
//  Copyright © 2017 Michael Jay Abalos. All rights reserved.
//

import UIKit

class Rounded: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.size.width*4/self.frame.size.height
        self.clipsToBounds = true
    }

}
