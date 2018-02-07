//
//  NotificationsViewController.swift
//  Game On
//
//  Created by AFFIXUS IMAC1 on 2/6/18.
//  Copyright © 2018 AFFIXUS IMAC1. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {

    @IBOutlet weak var btBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tintButtonImage(button: btBack, image: (btBack.imageView?.image)!, color: .white)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tintButtonImage(button:UIButton,image:UIImage,color:UIColor) {
        let tintedImage = image.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = color
    }
}
