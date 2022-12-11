import UIKit;

class DatewiseViewController: UIViewController {
    
    let button = UIButton();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        view.addSubview(button)
        
//        self.view.backgroundColor = UIColor.green;
        button.configuration = .filled()
        button.configuration?.title = "Text";
        button.configuration?.baseBackgroundColor = .systemCyan;
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
