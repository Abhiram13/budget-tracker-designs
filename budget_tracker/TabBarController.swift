import Foundation;
import UIKit;

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let homeViewController: ViewController = ViewController();
        let calenderViewController: CalenderViewController = CalenderViewController();
        
        homeViewController.title = "Home";
        calenderViewController.title = "Calender";
        
        self.setViewControllers([homeViewController, calenderViewController], animated: false);
    }
}
