//
//  ProfileVC.swift
//  Game On
//
//  Created by AFFIXUS IMAC1 on 2/6/18.
//  Copyright © 2018 AFFIXUS IMAC1. All rights reserved.
//

import UIKit
import KCFloatingActionButton

class ProfileVC: UIViewController {

    @IBOutlet weak var btBack: UIButton!
    @IBOutlet weak var btMore: UIButton!
    
    @IBOutlet weak var btPendingInvites: UIButton!
    @IBOutlet weak var btMyUpcomingMatch: UIButton!
    @IBOutlet weak var btMyGameResults: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let FAB = KCFloatingActionButton()
        FAB.addItem("Change Name", icon: UIImage(named: "icon_back")!)
        FAB.addItem("Change profile pic", icon: UIImage(named: "icon_back")!)
        FAB.addItem("Invite App", icon: UIImage(named: "icon_back")!)
        FAB.addItem("Sports Preference", icon: UIImage(named: "icon_back")!)
        self.view.addSubview(FAB)

        self.tintButtonImage(button: btBack, image: (btBack.imageView?.image)!, color: .white)
        self.tintButtonImage(button: btMore, image: (btMore.imageView?.image)!, color: .white)
        
        btPendingInvites.titleLabel?.textAlignment = .center
        btMyUpcomingMatch.titleLabel?.textAlignment = .center
        btMyGameResults.titleLabel?.textAlignment = .center
    }
    
    @IBAction func btBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func moreTapped(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "My QR Code", style: .default, handler: self.myQRCode))
        alertController.addAction(UIAlertAction(title: "Scan QR Code", style: .default, handler: self.scanQRCode))
        self.present(alertController, animated: true, completion:  nil)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    }
    
    func myQRCode (alert: UIAlertAction) {
        
    }
    
    func scanQRCode (alert: UIAlertAction) {
        
    }
    
    func tintButtonImage(button:UIButton,image:UIImage,color:UIColor) {
        let tintedImage = image.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = color
    }

}
