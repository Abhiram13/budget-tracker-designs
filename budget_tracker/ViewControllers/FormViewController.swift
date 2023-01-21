import Foundation;
import UIKit;

class FormViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = .green;
        self.tabBarController?.tabBar.isHidden = true;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false;
    }
}
