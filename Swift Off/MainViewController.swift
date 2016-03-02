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

// Be sure to change this URL. Your app will crash otherwise.
let FIREBASE_BASE_URL = "https://swift-off.firebaseio.com"

class MainViewController: UIViewController {
    
    @IBOutlet weak var navigationBarView: NavigationBarView!

    // Tasks to run after the main view has loaded
    override func viewDidLoad() {
        super.viewDidLoad()

        // Presents the Primer Flow
        Primer.sharedInstance().appLaunchComplete()
        prepareNavigationBarViewExample()
    }

    // General tasks to prepare view to be shown.
    private func prepareView() {
        view.backgroundColor = MaterialColor.white
    }

    func prepareNavigationBarViewExample() {
        
        // Stylize.
        navigationBarView.backgroundColor = MaterialColor.indigo.darken1
        
        // To lighten the status bar add the "View controller-based status bar appearance = NO"
        // to your info.plist file and set the following property.
        navigationBarView.statusBarStyle = .LightContent
        
        // Title label.
        let titleLabel = UILabel()
        titleLabel.text = "Swift Off!"
        titleLabel.textAlignment = .Left
        titleLabel.textColor = MaterialColor.white
        titleLabel.font = RobotoFont.regularWithSize(20)
        navigationBarView.titleLabel = titleLabel
        navigationBarView.titleLabelInset.left = 64
        
        // Detail label.
        let detailLabel = UILabel()
        detailLabel.text = "Build Great Apps"
        detailLabel.textAlignment = .Left
        detailLabel.textColor = MaterialColor.white
        detailLabel.font = RobotoFont.regularWithSize(12)
        navigationBarView.detailLabel = detailLabel
        navigationBarView.detailLabelInset.left = 64
        
        // Menu button.
        let menuButtonImage = UIImage(named: "ic_menu_white")
        let menuButton: FlatButton = FlatButton()
        menuButton.pulseColor = MaterialColor.white
        menuButton.pulseScale = false
        menuButton.setImage(menuButtonImage, forState: .Normal)
        menuButton.setImage(menuButtonImage, forState: .Highlighted)
        menuButton.addTarget(self, action: "openSideView:", forControlEvents: .TouchUpInside)
        
        // Search button.
        let searchButtonImage = UIImage(named: "ic_search_white")
        let searchButton: FlatButton = FlatButton()
        searchButton.pulseColor = MaterialColor.white
        searchButton.pulseScale = false
        searchButton.setImage(searchButtonImage, forState: .Normal)
        searchButton.setImage(searchButtonImage, forState: .Highlighted)
        
        // Add buttons to left side.
        navigationBarView.leftButtons = [menuButton]
        
        // Add buttons to right side.
        navigationBarView.rightButtons = [searchButton]
        
        MaterialLayout.height(view, child: navigationBarView, height: 70)
    }
    
    func openSideView(sender:UIButton!) {
        sideNavigationViewController?.toggleLeftView()
    }


}

