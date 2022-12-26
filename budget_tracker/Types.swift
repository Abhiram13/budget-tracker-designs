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
