import UIKit
import SwiftUI

class ViewController: UIViewController {
    let container: UIView = UIView();
    let mainLabel: UILabel = UILabel();
    let scheduleView: UIView = UIView();
    let scheduleStack: UIStackView = UIStackView();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.addSubview(container);
        self.view.backgroundColor = .green;
        
        self.containerConstraints();
        self.mainLabelConstrainsts();
        self.scheduleViewConstrainsts();
    }
    
    private func containerConstraints() -> Void {
        container.translatesAutoresizingMaskIntoConstraints = false;
        container.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true;
        container.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.5).isActive = true;
        container.backgroundColor = .blue;
        container.layer.cornerRadius = 10;
        container.addSubview(mainLabel);
        container.addSubview(scheduleView);
        
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            container.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
        ])
    }
    
    private func mainLabelConstrainsts() -> Void {
        mainLabel.text = "Start in 5 minutes";
        mainLabel.translatesAutoresizingMaskIntoConstraints = false;
        
        NSLayoutConstraint.activate([
            mainLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            mainLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 30)
        ])
    }
    
    private func scheduleViewConstrainsts() -> Void {
        scheduleView.translatesAutoresizingMaskIntoConstraints = false;
        scheduleView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50).isActive = true;
        scheduleView.heightAnchor.constraint(equalToConstant: 100).isActive = true;
        scheduleView.backgroundColor = .red;
        scheduleView.layer.cornerRadius = 20;
        scheduleView.addSubview(scheduleStack);
        
        NSLayoutConstraint.activate([
            scheduleView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            scheduleView.topAnchor.constraint(equalTo: container.topAnchor, constant: 75),
        ]);
        
        self.scheduleStackConstraints();
    }
    
    private func scheduleStackConstraints() -> Void {
        let dateField: UIView = UIView();
        let infoField: UIView = UIView();
        
        scheduleStack.translatesAutoresizingMaskIntoConstraints = false;
        scheduleStack.axis = .horizontal;
        scheduleStack.isLayoutMarginsRelativeArrangement = true;
        scheduleStack.widthAnchor.constraint(equalTo: scheduleView.widthAnchor, constant: 0).isActive = true;
        scheduleStack.heightAnchor.constraint(equalTo: scheduleView.heightAnchor, constant: 0).isActive = true;
        scheduleStack.addArrangedSubview(dateField);
        scheduleStack.addArrangedSubview(infoField);
        
        dateField.widthAnchor.constraint(equalTo: scheduleStack.widthAnchor, constant: 50).isActive = true;
        dateField.heightAnchor.constraint(equalToConstant: 100).isActive = true;
        dateField.backgroundColor = .cyan;
        
        infoField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 250).isActive = true;
        infoField.heightAnchor.constraint(equalToConstant: 100).isActive = true;
        infoField.backgroundColor = .magenta;
        
        
    }
}

