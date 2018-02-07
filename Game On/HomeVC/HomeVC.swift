//
//  HomeVC.swift
//  Game On
//
//  Created by AFFIXUS IMAC1 on 2/3/18.
//  Copyright © 2018 AFFIXUS IMAC1. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class HomeVC: ButtonBarPagerTabStripViewController {
    
    let custombackgroundColor = UIColor(red:255, green:82, blue:82, alpha:0.0)
    let customPurpleColor = UIColor(red:255, green:255, blue:255, alpha:0.0)
    
    @IBOutlet weak var btMenu: UIButton!
    @IBOutlet weak var btNotification: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStatusBarBackgroundColor(color: UIColor(hex:"ff5252"))
        
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarMinimumInteritemSpacing = 0.0
        settings.style.buttonBarItemBackgroundColor = custombackgroundColor
        //settings.style.selectedBarBackgroundColor = .white
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
        
        self.tintButtonImage(button: btMenu, image: (btMenu.imageView?.image)!, color: .white)
        self.tintButtonImage(button: btNotification, image: (btNotification.imageView?.image)!, color: .white)
        
    }
    
    @IBAction func moreClicked(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Feedback", style: .default, handler: self.feedbackHandler))
        alertController.addAction(UIAlertAction(title: "App Assistance", style: .default, handler: self.appAssisstanceHandler))
        alertController.addAction(UIAlertAction(title: "About", style: .default, handler: self.aboutHandler))
        self.present(alertController, animated: true, completion:  nil)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        }
    
    func feedbackHandler(alert: UIAlertAction) {
        let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "feedback") as! FeedbackVC
        self.present(viewController, animated: false, completion: nil)
        }
    
    func appAssisstanceHandler(alert: UIAlertAction) {
        let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "appAssistance") as! AppAssistanceVC
        self.present(viewController, animated: false, completion: nil)
    }
    
    func aboutHandler(alert: UIAlertAction) {
        let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "about") as! AboutVC
        self.present(viewController, animated: false, completion: nil)
    }
    
    @IBAction func btNotificationTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "notifications", sender: self)
    }
    
    @IBAction func btProfileTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "profile", sender: self)
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let News = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "news")
        let Results = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "results")
        let Upcoming = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "upcoming")
        let Live = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "live")
        return [News, Results, Upcoming, Live]
    }
    
    func tintButtonImage(button:UIButton,image:UIImage,color:UIColor) {
        let tintedImage = image.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = color
    }
}

