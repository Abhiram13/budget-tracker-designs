import UIKit;
import AVFoundation;

class CalenderViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
        let navBar: UINavigationBar = (self.navigationController?.navigationBar)!;
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.blue;
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]; // for large title
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]; // for small title
        
        view.backgroundColor = .white;
        
        navBar.barTintColor = .blue;
        navBar.topItem?.title = "Calender";
        navBar.prefersLargeTitles = true;
        navBar.standardAppearance = appearance;
        
        initialize();
    }
    
    private func initialize() -> Void {
        let scroller = UIScrollView();
        view.addSubview(scroller);
        
        scroller.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 2000)
        scroller.translatesAutoresizingMaskIntoConstraints = false;
        scroller.topAnchor.constraint(equalTo: view.topAnchor).isActive = true;
        scroller.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scroller.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scroller.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height - 50).isActive = true;
    }
}
