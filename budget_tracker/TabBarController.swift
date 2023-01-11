import Foundation;
import UIKit;

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let homeViewController: ViewController = ViewController();
        let calenderViewController: CalenderViewController = CalenderViewController();
        
        homeViewController.title = "Home";
        calenderViewController.title = "Calender";
        
        self.tabBar.backgroundColor = .white;
        self.tabBar.layer.shadowColor = UIColor.gray.cgColor;
        self.tabBar.layer.shadowOpacity = 0.5
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -1)
        self.tabBar.layer.shadowRadius = 5        
        
        self.setViewControllers([homeViewController, calenderViewController], animated: false);
    }
}
