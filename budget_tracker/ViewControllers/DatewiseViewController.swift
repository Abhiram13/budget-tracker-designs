import UIKit;

class DatewiseViewController: UIViewController {
    
//    let button = UIButton();
    let label = UILabel();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
//        view.addSubview(button);
        view.addSubview(label);
        
//        self.view.backgroundColor = UIColor.green;
//        button.configuration = .filled()
//        button.configuration?.title = "Text";
//        button.configuration?.baseBackgroundColor = .systemCyan;
//        button.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "This is just a sample text";
        label.textColor = .systemCyan;
        label.translatesAutoresizingMaskIntoConstraints = false;
        
        NSLayoutConstraint.activate([
//            button.widthAnchor.constraint(equalToConstant: 100),
//            button.heightAnchor.constraint(equalToConstant: 50),
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 100),
            label.heightAnchor.constraint(equalToConstant: 50),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
