//
//  TournamentVC.swift
//  Game On
//
//  Created by AFFIXUS IMAC1 on 2/3/18.
//  Copyright © 2018 AFFIXUS IMAC1. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TournamentVC: ButtonBarPagerTabStripViewController {
    
    @IBOutlet weak var btMore: UIButton!
    
    let custombackgroundColor = UIColor(red:255, green:82, blue:82, alpha:0.0)
    let customPurpleColor = UIColor(red:255, green:255, blue:255, alpha:0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarMinimumInteritemSpacing = 0.0
        settings.style.buttonBarItemBackgroundColor = custombackgroundColor
//        settings.style.selectedBarBackgroundColor = .white
        settings.style.buttonBarItemFont = UIFont.systemFont(ofSize: 12)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0.0
        settings.style.buttonBarItemTitleColor = .white
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarItemLeftRightMargin = 8
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        buttonBarView.selectedBar.backgroundColor = .white
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .white
            newCell?.label.textColor = .white
        }
        self.tintButtonImage(button: btMore, image: (btMore.imageView?.image)!, color: .white)
    }
    
    @IBAction func moreClicked(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Feedback", style: .default, handler: self.feedbackHandler))
        self.present(alertController, animated: true, completion:  nil)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    }
    
    func feedbackHandler(alert: UIAlertAction) {
        let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "feedback") as! FeedbackVC
        self.present(viewController, animated: false, completion: nil)
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let Tournament = UIStoryboard(name: "Tournament", bundle: nil).instantiateViewController(withIdentifier: "tournament")
        let MyTournament = UIStoryboard(name: "Tournament", bundle: nil).instantiateViewController(withIdentifier: "myTournament")
        let Invite = UIStoryboard(name: "Tournament", bundle: nil).instantiateViewController(withIdentifier: "invite")
        return [Tournament, MyTournament, Invite]
    }
    func tintButtonImage(button:UIButton,image:UIImage,color:UIColor) {
        let tintedImage = image.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = color
    }
}
