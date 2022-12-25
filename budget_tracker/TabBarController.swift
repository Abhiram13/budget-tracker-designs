import Foundation;
import UIKit;

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let homeViewController: ViewController = ViewController();
        let dateWiseController: DatewiseViewController = DatewiseViewController();
        
        homeViewController.title = "Home";
        dateWiseController.title = "Date Wise";
        
        self.setViewControllers([homeViewController, dateWiseController], animated: false);
    }
}
