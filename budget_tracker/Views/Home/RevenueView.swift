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
        self.viewStructure();
        self.initialize();
    }
    
    private func viewStructure() -> Void {
        backgroundColor = .white;
        translatesAutoresizingMaskIntoConstraints = false;
        widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50).isActive = true;
        heightAnchor.constraint(equalToConstant: 320).isActive = true;
        layer.cornerRadius = 20;
        layer.borderWidth = 2;
        layer.borderColor = UIColor.ThemeBlue.cgColor;
        layer.shadowColor = UIColor.gray.cgColor;
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 5;
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
        
        let lowerStacks: StackColumn = StackColumn(
            leading: StackColumnType(
                topLabel: StackLabelDesign.DurationTypeLabel(content: "PENDING PAYOUT"),
                middleLabel: StackLabelDesign.AmountLabel(content: "$6,000"),
                bottomLabel: nil
            ),
            trailing: StackColumnType(
                topLabel: StackLabelDesign.DurationTypeLabel(content: "UNPAID INVOICES"),
                middleLabel: StackLabelDesign.AmountLabel(content: "$8,000"),
                bottomLabel: StackLabelDesign.AmountStatusLabel(content: "$3K OVERDUE", textColor: .red)
            )
        );
        
        let upperStack: UIStackView = RevenueStackView(stacks: stacks);
        let lowerStack: UIStackView = RevenueStackView(stacks: lowerStacks);
        addSubview(firstLabel);
        addSubview(secondLabel);
        addSubview(upperStack);
        addSubview(lowerStack);
        
        NSLayoutConstraint.activate([
            upperStack.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            upperStack.heightAnchor.constraint(equalTo: heightAnchor, constant: -200),
            upperStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            upperStack.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            lowerStack.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            lowerStack.heightAnchor.constraint(equalTo: heightAnchor, constant: -200),
            lowerStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lowerStack.topAnchor.constraint(equalTo: topAnchor, constant: 200),
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
