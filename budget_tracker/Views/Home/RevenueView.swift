import Foundation;
import UIKit;

struct StackColumnType {
    let topLabel: UILabel;
    let middleLabel: UILabel;
    let bottomLabel: UILabel?;
}

struct StackColumn {
    let leading: StackColumnType;
    let trailing: StackColumnType;
}

class RevenueStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    required init() {
        super.init(frame: .zero);
        self.initialize();
    }
    
    private func AmountBoldLabel(content: String) -> UILabel {
        let label: UILabel = UILabel();
        label.text = content;
        label.textAlignment = .center;
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold);
        label.translatesAutoresizingMaskIntoConstraints = false;
        
        return label;
    }
    
    private func DurationTypeLabel(content: String) -> UILabel {
        let label: UILabel = UILabel();
        label.text = content;
        label.textAlignment = .center;
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular);
        label.translatesAutoresizingMaskIntoConstraints = false;
        
        return label;
    }
    
    private func initialize() -> Void {
        let firstStackChild: UIView = UIView();
        let secondStackChild: UIView = UIView();
        let firstStackChildtopLabel: UILabel = DurationTypeLabel(content: "THIS MONTH");
        let firstStackChildMiddleLabel: UILabel = AmountBoldLabel(content: "$15,000");
        let firstStackChildBottomLabel: UILabel = UILabel();
        let secondStackChildTopLabel: UILabel = DurationTypeLabel(content: "THIS YEAR");
        let secondStackChildBottomLabel: UILabel = AmountBoldLabel(content: "$72,000");
        
        let stacks: StackColumn = StackColumn(
            leading: StackColumnType(
                topLabel: firstStackChildtopLabel,
                middleLabel: firstStackChildMiddleLabel,
                bottomLabel: firstStackChildBottomLabel
            ),
            trailing: StackColumnType(
                topLabel: secondStackChildTopLabel,
                middleLabel: secondStackChildBottomLabel,
                bottomLabel: nil
            )
        );
        
        let leadingTopLabel: UILabel = stacks.leading.topLabel;
        let leadingMiddleLabel: UILabel = stacks.leading.middleLabel;
        let leadingBottomLabel: UILabel? = stacks.leading.bottomLabel;
        
        let trailingTopLabel: UILabel = stacks.trailing.topLabel;
        let trailingMiddleLabel: UILabel = stacks.trailing.middleLabel;
        let trailingBottomLabel: UILabel? = stacks.trailing.bottomLabel;
        
        addArrangedSubview(firstStackChild);
        addArrangedSubview(secondStackChild);
        axis = .horizontal;
        translatesAutoresizingMaskIntoConstraints = false;
        
        firstStackChild.translatesAutoresizingMaskIntoConstraints = false;
        secondStackChild.translatesAutoresizingMaskIntoConstraints = false;
        
//        firstStackChild.addSubview(firstStackChildtopLabel);
//        firstStackChild.addSubview(firstStackChildMiddleLabel);
//        firstStackChild.addSubview(firstStackChildBottomLabel);
        
        firstStackChild.addSubview(leadingTopLabel);
        firstStackChild.addSubview(leadingMiddleLabel);
        if leadingBottomLabel != nil {
            firstStackChild.addSubview(leadingBottomLabel!);
        }
        
        secondStackChild.addSubview(trailingTopLabel);
        secondStackChild.addSubview(trailingMiddleLabel);
        if trailingBottomLabel != nil {
            secondStackChild.addSubview(trailingBottomLabel!);
        }
        
//        secondStackChild.addSubview(secondStackChildTopLabel);
//        secondStackChild.addSubview(secondStackChildBottomLabel);
        
//        firstStackChildBottomLabel.text = "$13K LAST MONTH";
//        firstStackChildBottomLabel.textAlignment = .center;
//        firstStackChildBottomLabel.textColor = .ThemeGreen;
//        firstStackChildBottomLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold);
//        firstStackChildBottomLabel.translatesAutoresizingMaskIntoConstraints = false;
        
        NSLayoutConstraint.activate([
            firstStackChild.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            firstStackChild.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            firstStackChild.widthAnchor.constraint(equalTo: widthAnchor, constant: -160),
            firstStackChild.heightAnchor.constraint(equalTo: heightAnchor, constant: 0),
            secondStackChild.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            secondStackChild.widthAnchor.constraint(equalTo: widthAnchor, constant: -160),
            secondStackChild.heightAnchor.constraint(equalTo: heightAnchor, constant: 0),
//            firstStackChildtopLabel.topAnchor.constraint(equalTo: firstStackChild.topAnchor, constant: 15),
//            firstStackChildtopLabel.widthAnchor.constraint(equalTo: firstStackChild.widthAnchor, constant: 0),
//            firstStackChildMiddleLabel.topAnchor.constraint(equalTo: firstStackChild.topAnchor, constant: 32),
//            firstStackChildMiddleLabel.widthAnchor.constraint(equalTo: firstStackChild.widthAnchor, constant: 0),
//            firstStackChildBottomLabel.topAnchor.constraint(equalTo: firstStackChild.topAnchor, constant: 70),
//            firstStackChildBottomLabel.widthAnchor.constraint(equalTo: firstStackChild.widthAnchor, constant: 0),
//            secondStackChildTopLabel.topAnchor.constraint(equalTo: secondStackChild.topAnchor, constant: 15),
//            secondStackChildTopLabel.widthAnchor.constraint(equalTo: secondStackChild.widthAnchor, constant: 0),
//            secondStackChildBottomLabel.topAnchor.constraint(equalTo: secondStackChild.topAnchor, constant: 32),
//            secondStackChildBottomLabel.widthAnchor.constraint(equalTo: secondStackChild.widthAnchor, constant: 0),
            leadingTopLabel.topAnchor.constraint(equalTo: firstStackChild.topAnchor, constant: 15),
            leadingTopLabel.widthAnchor.constraint(equalTo: firstStackChild.widthAnchor, constant: 0),
            leadingMiddleLabel.topAnchor.constraint(equalTo: firstStackChild.topAnchor, constant: 32),
            leadingMiddleLabel.widthAnchor.constraint(equalTo: firstStackChild.widthAnchor, constant: 0),
            leadingBottomLabel!.topAnchor.constraint(equalTo: firstStackChild.topAnchor, constant: 70),
            leadingBottomLabel!.widthAnchor.constraint(equalTo: firstStackChild.widthAnchor, constant: 0),
            trailingTopLabel.topAnchor.constraint(equalTo: secondStackChild.topAnchor, constant: 15),
            trailingTopLabel.widthAnchor.constraint(equalTo: secondStackChild.widthAnchor, constant: 0),
            trailingMiddleLabel.topAnchor.constraint(equalTo: secondStackChild.topAnchor, constant: 32),
            trailingMiddleLabel.widthAnchor.constraint(equalTo: secondStackChild.widthAnchor, constant: 0),
        ]);
    }
}

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
        let upperStack: UIStackView = RevenueStackView();
        
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
