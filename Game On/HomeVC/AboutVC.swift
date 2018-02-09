//
//  AboutVC.swift
//  Game On
//
//  Created by AFFIXUS IMAC1 on 2/6/18.
//  Copyright © 2018 AFFIXUS IMAC1. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {


    @IBOutlet weak var arrowIcon: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tintButtonImage(button: arrowIcon, image: (arrowIcon.imageView?.image)!, color: UIColor(hex: "ff5252"))
    }

    @IBAction func btCancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tintButtonImage(button:UIButton,image:UIImage,color:UIColor) {
        let tintedImage = image.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = color
    }

}


