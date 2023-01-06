import UIKit
import SwiftUI

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

class TextView: UILabel {
    private var parent: UIView = UIView();
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    required init() {
        super.init(frame: .zero);
        print("Super view is \(self.superview)");
    }
    
    override func didMoveToSuperview() {
        parent = self.superview!;
        print("Super view is now \(parent)");
        self.initilise();
    }
    
    private func initilise() -> Void {
        self.text = "Hello world";
        self.textColor = .black;
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.topAnchor.constraint(equalTo: parent.topAnchor, constant: 100).isActive = true;
    }
}

class ViewController: UIViewController, UIScrollViewDelegate {
    let scroll = UIScrollView();
    let stack = UIStackView();
    let pieChartView = PieChartView();
    let text = TextView();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = .white;
        view.addSubview(scroll);
        scroll.delegate = self;
        scroll.contentSize = CGSize(width: 100, height: 100)
        scroll.addSubview(stack);
        scroll.translatesAutoresizingMaskIntoConstraints = false;
        scroll.backgroundColor = .blue;
        scroll.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scroll.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scroll.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        scroll.addSubview(text);
                
        stack.translatesAutoresizingMaskIntoConstraints = false;
        stack.isLayoutMarginsRelativeArrangement = true;
        stack.topAnchor.constraint(equalTo: scroll.topAnchor).isActive = true
        stack.leftAnchor.constraint(equalTo: scroll.leftAnchor).isActive = true
        stack.rightAnchor.constraint(equalTo: scroll.rightAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: scroll.bottomAnchor).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stack.backgroundColor = .green;
        stack.axis = .horizontal;
        
//        view.addSubview(pieChartView);
//        pieChartView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 400)
//        pieChartView.segments = [
//            Segment(color: .red, value: 57),
//            Segment(color: .blue, value: 30),
//            Segment(color: .green, value: 25),
//            Segment(color: .yellow, value: 40)
//        ];
        
        for i in 1...10 {
            let label = UILabel();
            label.text = "Hello \(i)";
            label.textColor = .black;
            stack.addArrangedSubview(label);
            label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        }
    }
}

