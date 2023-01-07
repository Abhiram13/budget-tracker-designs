import UIKit
import SwiftUI

struct ChartLabelwithColor {
    let label: String;
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
    
    override func viewDidLoad() {
        let labelStack = UIStackView();
        let labels: [ChartLabelwithColor] = [
            .init(label: "Salary", color: .blue),
            .init(label: "Medicine", color: .red),
            .init(label: "Restarunt", color: .orange),
            .init(label: "Cloth", color: .purple),
            .init(label: "Fuel", color: .green)
        ]
        super.viewDidLoad();
        view.backgroundColor = .white;
        view.addSubview(scroll);
        view.addSubview(chartContainer);
        scroll.delegate = self;
        scroll.addSubview(stack);
        
        chartContainer.translatesAutoresizingMaskIntoConstraints = false;
        chartContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true;
        chartContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true;
        chartContainer.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true;
        chartContainer.heightAnchor.constraint(equalToConstant: 200).isActive = true;
        chartContainer.backgroundColor = .white;
        chartContainer.layer.cornerRadius = 20;
        chartContainer.addSubview(labelStack);
        
        labelStack.axis = .vertical;
        labelStack.translatesAutoresizingMaskIntoConstraints = false;
        
        for label in labels {
            let stackLabel = ChartLabels(color: label.color, label: label.label);
            labelStack.addArrangedSubview(stackLabel);
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
        backgroundColor = .blue;
        topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: parent.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: parent.rightAnchor).isActive = true
        bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -200).isActive = true
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
//        layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0);
        isLayoutMarginsRelativeArrangement = true;
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0)
        backgroundColor = .brown;
        
        circle.backgroundColor = .clear;
        circle.translatesAutoresizingMaskIntoConstraints = false;
        circle.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true;
        circle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true;
        
        label.text = chartLabel;
        label.textColor = .black;
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true;
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true;
    }
}

