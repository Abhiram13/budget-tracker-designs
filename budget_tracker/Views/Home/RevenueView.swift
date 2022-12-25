import Foundation;
import UIKit;

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