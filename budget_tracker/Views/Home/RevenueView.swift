import Foundation;
import UIKit;

class RevenueView: UIView {
    let firstLabel: UILabel = UILabel();
    let secondLabel: UILabel = UILabel();
    
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
        let stacks: StackColumn = StackColumn(
            leading: StackColumnType(
                topLabel: StackLabelDesign.DurationTypeLabel(content: "THIS MONTH"),
                middleLabel: StackLabelDesign.AmountLabel(content: "$15,000"),
                bottomLabel: StackLabelDesign.AmountStatusLabel(content: "$13K LAST MONTH", textColor: .ThemeGreen)
            ),
            trailing: StackColumnType(
                topLabel: StackLabelDesign.DurationTypeLabel(content: "THIS YEAR"),
                middleLabel: StackLabelDesign.AmountLabel(content: "$72,000"),
                bottomLabel: nil
            )
        );
        
        let upperStack: UIStackView = RevenueStackView(stacks: stacks);
        
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
        addSubview(secondLabel);
        addSubview(upperStack);
        
        NSLayoutConstraint.activate([
            upperStack.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            upperStack.heightAnchor.constraint(equalTo: heightAnchor, constant: -200),
            upperStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            upperStack.topAnchor.constraint(equalTo: topAnchor, constant: 50),
        ]);
        
        self.headingLabelConstraint();
    }
    
    private func headingLabelConstraint() -> Void {
        firstLabel.text = "PAID TO YOU";
        firstLabel.textColor = .black;
        firstLabel.translatesAutoresizingMaskIntoConstraints = false;
        firstLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        
        secondLabel.text = "OUTSTANDING PAYMENTS";
        secondLabel.textColor = .black;
        secondLabel.translatesAutoresizingMaskIntoConstraints = false;
        secondLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        
        NSLayoutConstraint.activate([
            firstLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            firstLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            secondLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 175),
            secondLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
        ]);
    }
}
