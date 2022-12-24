import UIKit
import SwiftUI

class ViewController: UIViewController {
    let container: UIView = UIView();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.addSubview(container);
        self.view.backgroundColor = .green;
        
        self.containerConstraints()
    }
    
    private func containerConstraints() -> Void {
        container.translatesAutoresizingMaskIntoConstraints = false;
        container.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true;
        container.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.5).isActive = true;
        container.backgroundColor = .blue;
        container.layer.cornerRadius = 10;
        
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            container.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
        ])
    }
}

