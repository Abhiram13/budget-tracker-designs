import UIKit
import SwiftUI

class ViewController: UIViewController {
    let container: UIView = UIView();
    let mainLabel: UILabel = UILabel();
    let secondHeader: UILabel = UILabel();
    let scheduleView: UIView = UIView();
    let scheduleStack: UIStackView = UIStackView();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.addSubview(container);
        self.view.backgroundColor = .white;
        
        self.containerConstraints();
        self.mainLabelConstrainsts();
    }
        
    private func containerConstraints() -> Void {
        let customView: UIView = SchedularView();
        let revenueView: UIView = RevenueView();
        
        container.translatesAutoresizingMaskIntoConstraints = false;
        container.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true;
        container.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.5).isActive = true;
        container.backgroundColor = .LightWhite;
        container.layer.cornerRadius = 10;
        container.addSubview(mainLabel);
        container.addSubview(secondHeader);
        container.addSubview(customView);
        container.addSubview(revenueView);
        
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            container.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            customView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            customView.topAnchor.constraint(equalTo: container.topAnchor, constant: 75),
            revenueView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            revenueView.topAnchor.constraint(equalTo: container.topAnchor, constant: 235),
        ])
    }
        
    private func mainLabelConstrainsts() -> Void {
        mainLabel.text = "Start in 5 minutes";
        mainLabel.translatesAutoresizingMaskIntoConstraints = false;
        mainLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold);
        
        secondHeader.text = "Revenue";
        secondHeader.translatesAutoresizingMaskIntoConstraints = false;
        secondHeader.font = UIFont.systemFont(ofSize: 20, weight: .semibold);
        
        NSLayoutConstraint.activate([
            mainLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            mainLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 30),
            secondHeader.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            secondHeader.topAnchor.constraint(equalTo: container.topAnchor, constant: 190)
        ])
    }
}

