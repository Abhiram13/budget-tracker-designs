import UIKit
import SwiftUI

class SchedularView: UIView {
    let scheduleStack: UIStackView = UIStackView();
    let dateField: UIView = UIView();
    let infoField: UIView = UIView();
    let dateLabel: UILabel = UILabel();
    let infoLabel: UILabel = UILabel();
    let timeLabel: UILabel = UILabel();
    let memberLabel: UILabel = UILabel();
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
        heightAnchor.constraint(equalToConstant: 90).isActive = true;
        layer.cornerRadius = 20;
        layer.borderWidth = 2;
        layer.borderColor = UIColor.ThemeBlue.cgColor;
        layer.shadowColor = UIColor.gray.cgColor;
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 5
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
        dateField.widthAnchor.constraint(equalToConstant: 90).isActive = true;
        dateField.backgroundColor = .ThemeBlue;
        dateField.layer.cornerRadius = 20;
        dateField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner];
        
        infoField.addSubview(infoLabel)
        infoField.addSubview(timeLabel);
        infoField.addSubview(memberLabel);
        infoField.widthAnchor.constraint(equalToConstant: 160).isActive = true;
        infoField.backgroundColor = .white;
        infoField.layer.cornerRadius = 20;
        infoField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner];
        infoField.layoutMargins = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0);
        
        self.dateFieldConstraints();
    }
    
    private func dateFieldConstraints() -> Void {
        dateLabel.text = "09:45    Join";
        dateLabel.lineBreakMode = .byWordWrapping;
        dateLabel.numberOfLines = 0;
        dateLabel.textColor = .white;
        dateLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false;
        dateLabel.widthAnchor.constraint(equalTo: dateField.widthAnchor, constant: 0).isActive = true;
        
        infoLabel.text = "Resume Consultation";
        infoLabel.textColor = .black;
        infoLabel.translatesAutoresizingMaskIntoConstraints = false;
        infoLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold);
        
        timeLabel.text = "30 min";
        timeLabel.textColor = .black;
        timeLabel.translatesAutoresizingMaskIntoConstraints = false;
        timeLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium);
        
        memberLabel.text = "Aslynn Dias";
        memberLabel.textColor = .black;
        memberLabel.translatesAutoresizingMaskIntoConstraints = false;
        memberLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium);
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: dateField.leadingAnchor, constant: 20),
            dateLabel.topAnchor.constraint(equalTo: dateField.topAnchor, constant: 20),
            infoLabel.leadingAnchor.constraint(equalTo: infoField.leadingAnchor, constant: 20),
            infoLabel.topAnchor.constraint(equalTo: infoField.topAnchor, constant: 20),
            timeLabel.leadingAnchor.constraint(equalTo: infoField.leadingAnchor, constant: 20),
            timeLabel.topAnchor.constraint(equalTo: infoField.topAnchor, constant: 50),
            memberLabel.leadingAnchor.constraint(equalTo: infoField.leadingAnchor, constant: 100),
            memberLabel.topAnchor.constraint(equalTo: infoField.topAnchor, constant: 50)
        ]);
    }
}

class RevenueView: UIView {
    let firstLabel: UILabel = UILabel();
    let stack = UIStackView();
    
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
        backgroundColor = .white;
        translatesAutoresizingMaskIntoConstraints = false;
        widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50).isActive = true;
        heightAnchor.constraint(equalToConstant: 300).isActive = true;
        layer.cornerRadius = 20;
        layer.borderWidth = 2;
        layer.borderColor = UIColor.ThemeBlue.cgColor;
        layer.shadowColor = UIColor.gray.cgColor;
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 5;
        addSubview(firstLabel);
        addSubview(stack);
        
        self.firstLabelConstraint();
    }
    
    private func firstLabelConstraint() -> Void {
        firstLabel.text = "PAID TO YOU";
        firstLabel.textColor = .black;
        firstLabel.translatesAutoresizingMaskIntoConstraints = false;
        firstLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        
        NSLayoutConstraint.activate([
            firstLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            firstLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ]);
        
        self.stackViewConstraint();
    }
    
    private func stackViewConstraint() -> Void {
        let firstStackChild: UIView = UIView();
        let secondStackChild: UIView = UIView();
        
        let firstStackChildtopLabel: UILabel = UILabel();
        let firstStackChildMiddleLabel: UILabel = UILabel();
        let firstStackChildBottomLabel: UILabel = UILabel();
        
        let secondStackChildTopLabel: UILabel = UILabel();
        let secondStackChildBottomLabel: UILabel = UILabel();
        
        stack.addArrangedSubview(firstStackChild);
        stack.addArrangedSubview(secondStackChild);
        
        stack.axis = .horizontal;
        stack.translatesAutoresizingMaskIntoConstraints = false;
                
        firstStackChild.translatesAutoresizingMaskIntoConstraints = false;
        secondStackChild.translatesAutoresizingMaskIntoConstraints = false;
//        firstStackChild.layer.borderColor = UIColor.green.cgColor;
//        firstStackChild.layer.borderWidth = 2;
//        secondStackChild.layer.borderColor = UIColor.blue.cgColor;
//        secondStackChild.layer.borderWidth = 2;
        
        firstStackChild.addSubview(firstStackChildtopLabel);
        firstStackChild.addSubview(firstStackChildMiddleLabel);
        firstStackChild.addSubview(firstStackChildBottomLabel);
        
        secondStackChild.addSubview(secondStackChildTopLabel);
        secondStackChild.addSubview(secondStackChildBottomLabel);
        
        firstStackChildtopLabel.text = "THIS MONTH";
        firstStackChildtopLabel.textAlignment = .center;
        firstStackChildtopLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular);
        firstStackChildtopLabel.translatesAutoresizingMaskIntoConstraints = false;
        
        firstStackChildMiddleLabel.text = "$15,000";
        firstStackChildMiddleLabel.textAlignment = .center;
        firstStackChildMiddleLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold);
        firstStackChildMiddleLabel.translatesAutoresizingMaskIntoConstraints = false;
        
        firstStackChildBottomLabel.text = "$13K LAST MONTH";
        firstStackChildBottomLabel.textAlignment = .center;
        firstStackChildBottomLabel.textColor = .ThemeGreen;
        firstStackChildBottomLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold);
        firstStackChildBottomLabel.translatesAutoresizingMaskIntoConstraints = false;
        
        secondStackChildTopLabel.text = "THIS YEAR";
        secondStackChildTopLabel.textAlignment = .center;
        secondStackChildTopLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular);
        secondStackChildTopLabel.translatesAutoresizingMaskIntoConstraints = false;
        
        secondStackChildBottomLabel.text = "$72,000";
        secondStackChildBottomLabel.textAlignment = .center;
        secondStackChildBottomLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold);
        secondStackChildBottomLabel.translatesAutoresizingMaskIntoConstraints = false;
        
        NSLayoutConstraint.activate([
            stack.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            stack.heightAnchor.constraint(equalTo: heightAnchor, constant: -200),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            firstStackChild.topAnchor.constraint(equalTo: stack.topAnchor, constant: 0),
            firstStackChild.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 0),
            firstStackChild.widthAnchor.constraint(equalTo: stack.widthAnchor, constant: -160),
            firstStackChild.heightAnchor.constraint(equalTo: stack.heightAnchor, constant: 0),
            secondStackChild.topAnchor.constraint(equalTo: stack.topAnchor, constant: 0),
            secondStackChild.widthAnchor.constraint(equalTo: stack.widthAnchor, constant: -160),
            secondStackChild.heightAnchor.constraint(equalTo: stack.heightAnchor, constant: 0),
            firstStackChildtopLabel.topAnchor.constraint(equalTo: firstStackChild.topAnchor, constant: 15),
            firstStackChildtopLabel.widthAnchor.constraint(equalTo: firstStackChild.widthAnchor, constant: 0),
            firstStackChildMiddleLabel.topAnchor.constraint(equalTo: firstStackChild.topAnchor, constant: 32),
            firstStackChildMiddleLabel.widthAnchor.constraint(equalTo: firstStackChild.widthAnchor, constant: 0),
            firstStackChildBottomLabel.topAnchor.constraint(equalTo: firstStackChild.topAnchor, constant: 70),
            firstStackChildBottomLabel.widthAnchor.constraint(equalTo: firstStackChild.widthAnchor, constant: 0),
            secondStackChildTopLabel.topAnchor.constraint(equalTo: secondStackChild.topAnchor, constant: 15),
            secondStackChildTopLabel.widthAnchor.constraint(equalTo: secondStackChild.widthAnchor, constant: 0),
            secondStackChildBottomLabel.topAnchor.constraint(equalTo: secondStackChild.topAnchor, constant: 32),
            secondStackChildBottomLabel.widthAnchor.constraint(equalTo: secondStackChild.widthAnchor, constant: 0),
        ]);
    }
}

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

