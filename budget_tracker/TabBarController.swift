import Foundation;
import UIKit;

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let calenderNavController = UINavigationController(rootViewController: CalenderViewController());
        let homeViewController: ViewController = ViewController();
        
        homeViewController.title = "Home";
        calenderNavController.title = "Calender";
        
        self.tabBar.backgroundColor = .white;
        self.tabBar.layer.shadowColor = UIColor.gray.cgColor;
        self.tabBar.layer.shadowOpacity = 0.5
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -1)
        self.tabBar.layer.shadowRadius = 5
        
        self.setViewControllers([homeViewController, calenderNavController], animated: false);
    }
}
