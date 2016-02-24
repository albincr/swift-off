//
//  SideViewController.swift
//  Swift Off
//
//  Created by You on 2/18/16.
//  Copyright © 2016 Primer. All rights reserved.
//

import UIKit
import Material

class SideViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var menuItemText: [String] = ["Settings", "Logout"]
    var menuItemIcons: [String] = ["ic_settings", "ic_exit"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareSideMenu()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItemText.count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let mycell = tableView.dequeueReusableCellWithIdentifier("SideMenuCell", forIndexPath: indexPath) as! SideViewTableViewCell
        
        mycell.cellText.text = menuItemText[indexPath.row]
        mycell.cellImage.image = UIImage(named: menuItemIcons[indexPath.row])
        
        return mycell;
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch(indexPath.row) {
        case 0:
            //                var centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as ViewController
            //                var centerNavController = UINavigationController(rootViewController: centerViewController)
            //                var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            //                appDelegate.centerContainer!.centerViewController = centerNavController
            break;
        case 1:
            sideNavigationViewController?.toggleLeftView()
            LoginManager.sharedInstance.logoutUser()
            break;
        default:
            print("Did not find menu item.")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */

    func prepareSideMenu() {
        // Adding a menu icon for closing the menu
        let menuImg: UIImage? = UIImage(named: "ic_menu")
        let menuBtn: FlatButton = FlatButton(frame: CGRectMake(4, 10, 64, 64))
        menuBtn.pulseColor = MaterialColor.black
        menuBtn.pulseScale = false
        menuBtn.setImage(menuImg, forState: .Normal)
        menuBtn.setImage(menuImg, forState: .Highlighted)
        menuBtn.addTarget(self, action: "closeSideView:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(menuBtn)
    }
    
    func closeSideView(sender:UIButton!) {
        sideNavigationViewController?.toggleLeftView()
    }
}
