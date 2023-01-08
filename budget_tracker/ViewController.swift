import UIKit
import SwiftUI

struct ChartLabelwithColor {
    let label: String;
    let color: UIColor;
}

struct TransactionDetails {
    let category: String;
    let count: Int;
    let amount: Int;
    let color: UIColor;
}

struct Segment {
    // the color of a given segment
    var color: UIColor
    
    // the value of a given segment – will be used to automatically calculate a ratio
    var value: CGFloat
}

class PieChartView: UIView {
    /// An array of structs representing the segments of the pie chart
    var segments = [Segment]() {
        didSet {
            setNeedsDisplay() // re-draw view when the values get set
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false // when overriding drawRect, you must specify this to maintain transparency.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        // get current context
        let ctx = UIGraphicsGetCurrentContext()
        
        // radius is the half the frame's width or height (whichever is smallest)
        let radius = min(frame.size.width, frame.size.height) * 0.5
        
        // center of the view
        let viewCenter = CGPoint(x: bounds.size.width * 0.5, y: bounds.size.height * 0.5)
        
        // enumerate the total value of the segments by using reduce to sum them
        let valueCount = segments.reduce(0, {$0 + $1.value})
        
        // the starting angle is -90 degrees (top of the circle, as the context is flipped). By default, 0 is the right hand side of the circle, with the positive angle being in an anti-clockwise direction (same as a unit circle in maths).
        var startAngle = -CGFloat.pi * 0.5
        
        for segment in segments { // loop through the values array
            
            // set fill color to the segment color
            ctx?.setFillColor(segment.color.cgColor)
            
            // update the end angle of the segment
            let endAngle = startAngle + 2 * .pi * (segment.value / valueCount)
            
            // move to the center of the pie chart
            ctx?.move(to: viewCenter)
            
            // add arc from the center for each segment (anticlockwise is specified for the arc, but as the view flips the context, it will produce a clockwise arc)
            ctx?.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            
            // fill segment
            ctx?.fillPath()
            
            // update starting angle of the next segment to the ending angle of this segment
            startAngle = endAngle
        }
    }
}

class ViewController: UIViewController, UIScrollViewDelegate {
    let scroll = ScrollView();
    let stack = StackView();
    let chartContainer = UIView();
    let transactionStack = UIStackView();
    let transactionScroll = UIScrollView();
    
    override func viewDidLoad() {
        let labelStack = UIStackView();
        let labels: [ChartLabelwithColor] = [
            .init(label: "Salary", color: .blue),
            .init(label: "Medicine", color: .red),
            .init(label: "Restarunt", color: .orange),
            .init(label: "Cloth", color: .purple),
            .init(label: "Fuel", color: .green)
        ];
        let transactions: [TransactionDetails] = [
            .init(category: "Salary", count: 1, amount: 5000, color: .blue),
            .init(category: "Medicine", count: 2, amount: 2680, color: .red),
            .init(category: "Restaurant", count: 2, amount: 2680, color: .orange),
            .init(category: "Cloth", count: 5, amount: 2680, color: .purple),
            .init(category: "Fuel", count: 6, amount: 3456, color: .green),
            .init(category: "Salary", count: 1, amount: 5000, color: .blue),
            .init(category: "Medicine", count: 2, amount: 2680, color: .red),
            .init(category: "Restaurant", count: 2, amount: 2680, color: .orange),
            .init(category: "Cloth", count: 5, amount: 2680, color: .purple),
            .init(category: "Fuel", count: 6, amount: 3456, color: .green),
            .init(category: "Salary", count: 1, amount: 5000, color: .blue),
            .init(category: "Medicine", count: 2, amount: 2680, color: .red),
            .init(category: "Restaurant", count: 2, amount: 2680, color: .orange),
            .init(category: "Cloth", count: 5, amount: 2680, color: .purple),
            .init(category: "Fuel", count: 6, amount: 3456, color: .green),
        ];
        
        super.viewDidLoad();
        view.backgroundColor = .LightWhite;
        view.addSubview(scroll);
        view.addSubview(transactionScroll);
        
        scroll.delegate = self;
        scroll.addSubview(stack);
        
        transactionScroll.delegate = self;
        transactionScroll.addSubview(chartContainer)
        transactionScroll.addSubview(transactionStack);
        transactionScroll.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 2000)
        transactionScroll.translatesAutoresizingMaskIntoConstraints = false;
        transactionScroll.backgroundColor = .yellow;
        transactionScroll.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        transactionScroll.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        transactionScroll.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        transactionScroll.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height - 50).isActive = true;
        
        transactionStack.layer.borderColor = UIColor.red.cgColor;
        transactionStack.layer.borderWidth = 1;
        transactionStack.axis = .vertical;
        transactionStack.alignment = .fill;
        transactionStack.translatesAutoresizingMaskIntoConstraints = false;
        transactionStack.topAnchor.constraint(equalTo: transactionScroll.topAnchor, constant: 240).isActive = true;
        transactionStack.widthAnchor.constraint(equalTo: transactionScroll.widthAnchor).isActive = true;
        transactionStack.spacing = 2;
        
        chartContainer.translatesAutoresizingMaskIntoConstraints = false;
        chartContainer.topAnchor.constraint(equalTo: transactionScroll.topAnchor, constant: 20).isActive = true;
        chartContainer.leadingAnchor.constraint(equalTo: transactionScroll.leadingAnchor, constant: 20).isActive = true;
        chartContainer.widthAnchor.constraint(equalTo: transactionScroll.widthAnchor, constant: -40).isActive = true;
        chartContainer.backgroundColor = .green;
        chartContainer.layer.cornerRadius = 20;
        chartContainer.addSubview(labelStack);
        
        labelStack.axis = .vertical;
        labelStack.translatesAutoresizingMaskIntoConstraints = false;
        labelStack.alignment = .fill;
        labelStack.heightAnchor.constraint(equalTo: chartContainer.heightAnchor, constant: -10).isActive = true;
        labelStack.spacing = 10;
        
        for label in labels {
            let stackLabel = ChartLabels(color: label.color, label: label.label);
            labelStack.addArrangedSubview(stackLabel);
        }
        
        for transaction in transactions {
            let t = TransactionBox(transaction: transaction);
            transactionStack.addArrangedSubview(t);
        }
    }
}

class ScrollView: UIScrollView {
    private var parent: UIView = UIView();
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    required init() {
        super.init(frame: .zero);
    }
    
    override func didMoveToSuperview() {
        parent = self.superview!;
        self.initlize();
    }
    
    private func initlize() -> Void {
        let stack = StackView();
        contentSize = CGSize(width: 100, height: 100)
        addSubview(stack);
        translatesAutoresizingMaskIntoConstraints = false;
        backgroundColor = .yellow;
        topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: parent.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: parent.rightAnchor).isActive = true
        heightAnchor.constraint(equalToConstant: 100).isActive = true;
    }
}

class StackView: UIStackView {
    private var parent: UIView = UIView();
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    required init() {
        super.init(frame: .zero);
    }
    
    override func didMoveToSuperview() {
        parent = self.superview!;
        self.initalise();
    }
    
    private func initalise() -> Void {
        translatesAutoresizingMaskIntoConstraints = false;
        isLayoutMarginsRelativeArrangement = true;
        topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: parent.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: parent.rightAnchor).isActive = true
        bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
        heightAnchor.constraint(equalToConstant: 100).isActive = true
        backgroundColor = .green;
        axis = .horizontal;
        
        for i in 1...10 {
            let label = UILabel();
            label.text = "Hello \(i)";
            label.textColor = .black;
            addArrangedSubview(label);
            label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        }
    }
}

class Circle: UIView {
    private var fillColor: UIColor = UIColor();
    
    required init(color: UIColor) {
        fillColor = color;
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    override func draw(_ rect: CGRect) {
        var path = UIBezierPath()
        path = UIBezierPath(ovalIn: CGRect(origin: CGPoint(), size: CGSize(width: 10, height: 10)));
        fillColor.setFill()
        path.lineWidth = 5
        path.fill()
    }
}

class ChartLabels: UIStackView {
    private var parent: UIView = UIView();
    private var fillColor = UIColor();
    private var chartLabel = "";
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    required init(color: UIColor, label: String) {
        super.init(frame: .zero);
        fillColor = color;
        chartLabel = label;
    }
    
    override func didMoveToSuperview() {
        parent = self.superview!;
        initialise();
    }
    
    private func initialise() -> Void {
        let circle = Circle(color: fillColor);
        let label = UILabel();
        
        axis = .horizontal;
        addArrangedSubview(circle);
        addArrangedSubview(label);
        translatesAutoresizingMaskIntoConstraints = false;
        leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 120).isActive = true;
        widthAnchor.constraint(equalToConstant: 120).isActive = true;
        heightAnchor.constraint(equalToConstant: 30).isActive = true;
        backgroundColor = .brown;
        layer.borderWidth = 1;
        layer.borderColor = UIColor.black.cgColor;
        
        circle.backgroundColor = .clear;
        circle.translatesAutoresizingMaskIntoConstraints = false;
        circle.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true;
        circle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true;
        
        label.text = chartLabel;
        label.textColor = .black;
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true;
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true;
    }
}

class TransactionBox: UIStackView {
    private var parent: UIView = UIView();
    var transactionDetails: TransactionDetails = .init(category: "", count: 0, amount: 0, color: .green);
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    required init(transaction: TransactionDetails) {
        super.init(frame: .zero);
        transactionDetails = transaction;
    }
    
    override func didMoveToSuperview() {
        parent = self.superview!;
        self.initlize();
    }
    
    private func initlize() {
        container();
    }
    
    private func container() -> Void {
        layer.borderColor = UIColor.black.cgColor;
        layer.borderWidth = 2;
        axis = .horizontal;
        alignment = .fill
        translatesAutoresizingMaskIntoConstraints = false;
        widthAnchor.constraint(equalTo: parent.widthAnchor, constant: -40).isActive = true;
        heightAnchor.constraint(equalToConstant: 100).isActive = true;
        leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 20).isActive = true;
        
        imageView();
    }
    
    private func imageView() -> Void {
        let imageContainerView = UIView();
        let pillImage = UIImage(named: "pill");
        let imageView = UIImageView(image: pillImage);
        imageView.frame = CGRect(x: 20, y: 20, width: 30, height: 30);
        
        addArrangedSubview(imageContainerView);
        
        imageContainerView.addSubview(imageView);
        imageContainerView.backgroundColor = transactionDetails.color;
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false;
        imageContainerView.widthAnchor.constraint(equalTo: widthAnchor, constant: -305).isActive = true;
        imageContainerView.heightAnchor.constraint(equalTo: heightAnchor, constant: -30).isActive = true;
        imageContainerView.heightAnchor.constraint(equalToConstant: 100).isActive = true;
        imageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true;
        imageContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true;
        imageContainerView.layer.cornerRadius = 30;
        
        transactionLabels();
    }
    
    private func transactionLabels() -> Void {
        let labelContainer = UIView();
        let categoryLabel = UILabel();
        let countLabel = UILabel();
        
        addArrangedSubview(labelContainer);
        
        labelContainer.translatesAutoresizingMaskIntoConstraints = false;
        labelContainer.widthAnchor.constraint(equalTo: widthAnchor, constant: -190).isActive = true;
        labelContainer.heightAnchor.constraint(equalTo: heightAnchor, constant: -45).isActive = true;
        labelContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 95).isActive = true;
        labelContainer.topAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true;
        labelContainer.addSubview(categoryLabel);
        labelContainer.addSubview(countLabel);
        
        categoryLabel.text = transactionDetails.category;
        categoryLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false;
        categoryLabel.topAnchor.constraint(equalTo: labelContainer.topAnchor, constant: 0).isActive = true;
        
        countLabel.text = "\(transactionDetails.count) Transactions";
        countLabel.textColor = .gray;
        countLabel.translatesAutoresizingMaskIntoConstraints = false;
        countLabel.topAnchor.constraint(equalTo: labelContainer.topAnchor, constant: 25).isActive = true;
        
        amountLabel();
    }
    
    private func amountLabel() -> Void {
        let amountView = UIView();
        let amount = UILabel();
        
        addArrangedSubview(amountView);
        
        amountView.translatesAutoresizingMaskIntoConstraints = false;
        amountView.widthAnchor.constraint(equalTo: widthAnchor, constant: -300).isActive = true;
        amountView.heightAnchor.constraint(equalTo: heightAnchor, constant: -40).isActive = true;
        amountView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 290).isActive = true;
        amountView.topAnchor.constraint(equalTo: topAnchor, constant: 18).isActive = true;
        amountView.addSubview(amount);
        
        amount.text = "$\(transactionDetails.amount)";
        amount.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        amount.translatesAutoresizingMaskIntoConstraints = false;
        amount.topAnchor.constraint(equalTo: amountView.topAnchor, constant: 20).isActive = true;
    }
}

