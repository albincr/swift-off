//
//  MainViewController.swift
//  Your App
//
//  Created by Swift Off Starting Template.
//  Copyright © 2016 You. All rights reserved.
//

import UIKit
import Material
import Firebase

class MainViewController: UIViewController {
    
    @IBOutlet weak var navigationBarView: NavigationBarView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Presents the Primer Flow
        Primer.sharedInstance().appLaunchComplete()
        prepareNavigationBarViewExample()
    }

    /**
     :name:	prepareView
     :description: General preparation statements.
     */
    private func prepareView() {
        view.backgroundColor = MaterialColor.white
    }
    
    /**
     :name:	prepareNavigationBarViewExample
     :description:	General usage example.
     */
    func prepareNavigationBarViewExample() {
        
        // Stylize.
        navigationBarView.backgroundColor = MaterialColor.indigo.darken1
        
        // To lighten the status bar add the "View controller-based status bar appearance = NO"
        // to your info.plist file and set the following property.
        navigationBarView.statusBarStyle = .LightContent
        
        // Title label.
        let titleLabel: UILabel = UILabel()
        titleLabel.text = "Material!"
        titleLabel.textAlignment = .Left
        titleLabel.textColor = MaterialColor.white
        titleLabel.font = RobotoFont.regularWithSize(20)
        navigationBarView.titleLabel = titleLabel
        navigationBarView.titleLabelInset.left = 64
        
        // Detail label.
        let detailLabel: UILabel = UILabel()
        detailLabel.text = "Build Beautiful Software"
        detailLabel.textAlignment = .Left
        detailLabel.textColor = MaterialColor.white
        detailLabel.font = RobotoFont.regularWithSize(12)
        navigationBarView.detailLabel = detailLabel
        navigationBarView.detailLabelInset.left = 64
        
        // Menu button.
        let img1: UIImage? = UIImage(named: "ic_menu_white")
        let btn1: FlatButton = FlatButton()
        btn1.pulseColor = MaterialColor.white
        btn1.pulseScale = false
        btn1.setImage(img1, forState: .Normal)
        btn1.setImage(img1, forState: .Highlighted)
        
        // Star button.
        let img2: UIImage? = UIImage(named: "ic_star_white")
        let btn2: FlatButton = FlatButton()
        btn2.pulseColor = MaterialColor.white
        btn2.pulseScale = false
        btn2.setImage(img2, forState: .Normal)
        btn2.setImage(img2, forState: .Highlighted)
        
        // Search button.
        let img3: UIImage? = UIImage(named: "ic_search_white")
        let btn3: FlatButton = FlatButton()
        btn3.pulseColor = MaterialColor.white
        btn3.pulseScale = false
        btn3.setImage(img3, forState: .Normal)
        btn3.setImage(img3, forState: .Highlighted)
        
        // Add buttons to left side.
        navigationBarView.leftButtons = [btn1]
        
        // Add buttons to right side.
        navigationBarView.rightButtons = [btn2, btn3]
        
        MaterialLayout.height(view, child: navigationBarView, height: 70)
    }


}

