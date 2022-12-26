import Foundation;
import UIKit;

class RevenueStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    required init(stacks: StackColumn) {
        super.init(frame: .zero);
        self.initialize(stacks: stacks);
    }
    
    private func initialize(stacks: StackColumn) -> Void {
        let firstStackChild: UIView = UIView();
        let secondStackChild: UIView = UIView();
        
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
        
        firstStackChild.addSubview(leadingTopLabel);
        firstStackChild.addSubview(leadingMiddleLabel);
        if leadingBottomLabel != nil {
            firstStackChild.addSubview(leadingBottomLabel!);
            leadingBottomLabel!.topAnchor.constraint(equalTo: firstStackChild.topAnchor, constant: 70).isActive = true;
            leadingBottomLabel!.widthAnchor.constraint(equalTo: firstStackChild.widthAnchor, constant: 0).isActive = true;
        }
        
        secondStackChild.addSubview(trailingTopLabel);
        secondStackChild.addSubview(trailingMiddleLabel);
        if trailingBottomLabel != nil {
            secondStackChild.addSubview(trailingBottomLabel!);
            trailingBottomLabel!.topAnchor.constraint(equalTo: secondStackChild.topAnchor, constant: 70).isActive = true;
            trailingBottomLabel!.widthAnchor.constraint(equalTo: secondStackChild.widthAnchor, constant: 0).isActive = true;
        }
        
        NSLayoutConstraint.activate([
            firstStackChild.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            firstStackChild.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            firstStackChild.widthAnchor.constraint(equalTo: widthAnchor, constant: -160),
            firstStackChild.heightAnchor.constraint(equalTo: heightAnchor, constant: 0),
            secondStackChild.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            secondStackChild.widthAnchor.constraint(equalTo: widthAnchor, constant: -160),
            secondStackChild.heightAnchor.constraint(equalTo: heightAnchor, constant: 0),
            leadingTopLabel.topAnchor.constraint(equalTo: firstStackChild.topAnchor, constant: 15),
            leadingTopLabel.widthAnchor.constraint(equalTo: firstStackChild.widthAnchor, constant: 0),
            leadingMiddleLabel.topAnchor.constraint(equalTo: firstStackChild.topAnchor, constant: 32),
            leadingMiddleLabel.widthAnchor.constraint(equalTo: firstStackChild.widthAnchor, constant: 0),
            trailingTopLabel.topAnchor.constraint(equalTo: secondStackChild.topAnchor, constant: 15),
            trailingTopLabel.widthAnchor.constraint(equalTo: secondStackChild.widthAnchor, constant: 0),
            trailingMiddleLabel.topAnchor.constraint(equalTo: secondStackChild.topAnchor, constant: 32),
            trailingMiddleLabel.widthAnchor.constraint(equalTo: secondStackChild.widthAnchor, constant: 0),
        ]);
    }
}
