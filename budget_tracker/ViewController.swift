import UIKit
import SwiftUI

class SchedularView: UIView {
    let scheduleStack: UIStackView = UIStackView();
    let dateField: UIView = UIView();
    let infoField: UIView = UIView();
    let dateLabel: UILabel = UILabel();
    let infoLabel: UILabel = UILabel();
    let controller: ViewController = ViewController();
    
    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    required init() {
        super.init(frame: .zero);
        self.initialize();
    }
    
    private func initialize() -> Void {
        translatesAutoresizingMaskIntoConstraints = false;
        widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50).isActive = true;
        heightAnchor.constraint(equalToConstant: 100).isActive = true;
        backgroundColor = .red;
        layer.cornerRadius = 20;
        addSubview(scheduleStack);
        
        self.scheduleStackConstraints();
    }
    
    private func scheduleStackConstraints() -> Void {
        scheduleStack.translatesAutoresizingMaskIntoConstraints = false;
        scheduleStack.axis = .horizontal;
        scheduleStack.isLayoutMarginsRelativeArrangement = true;
        scheduleStack.widthAnchor.constraint(equalTo: widthAnchor, constant: 0).isActive = true;
        scheduleStack.heightAnchor.constraint(equalTo: heightAnchor, constant: 0).isActive = true;
        scheduleStack.addArrangedSubview(dateField);
        scheduleStack.addArrangedSubview(infoField);
        
        dateField.addSubview(dateLabel);
        dateField.widthAnchor.constraint(equalToConstant: 100).isActive = true;
        dateField.backgroundColor = .cyan;
        dateField.layer.cornerRadius = 20;
        dateField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner];
        
        infoField.addSubview(infoLabel)
        infoField.widthAnchor.constraint(equalToConstant: 160).isActive = true;
        infoField.backgroundColor = .magenta;
        infoField.layer.cornerRadius = 20;
        infoField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner];
        
        self.dateFieldConstraints();
    }
    
    private func dateFieldConstraints() -> Void {
        dateLabel.text = "09:45";
        dateLabel.translatesAutoresizingMaskIntoConstraints = false;
        
        infoLabel.text = "Resume Consultation";
        infoLabel.translatesAutoresizingMaskIntoConstraints = false;
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: dateField.leadingAnchor, constant: 10),
            dateLabel.topAnchor.constraint(equalTo: dateField.topAnchor, constant: 10),
            infoLabel.leadingAnchor.constraint(equalTo: infoField.leadingAnchor, constant: 10),
            infoLabel.topAnchor.constraint(equalTo: infoField.topAnchor, constant: 10)
        ]);
    }
}

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
    }
        
    private func containerConstraints() -> Void {
        let customView: UIView = SchedularView();
        
        container.translatesAutoresizingMaskIntoConstraints = false;
        container.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true;
        container.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.5).isActive = true;
        container.backgroundColor = .blue;
        container.layer.cornerRadius = 10;
        container.addSubview(mainLabel);
        container.addSubview(customView);
        
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            container.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            customView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            customView.topAnchor.constraint(equalTo: container.topAnchor, constant: 75),
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
}

