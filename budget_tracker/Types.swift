import Foundation;
import UIKit;

struct StackColumnType {
    /**
     The top most label in the column stack. Acts as title label
     */
    let topLabel: UILabel;
    
    /**
     The middle label usually contains data 
     */
    let middleLabel: UILabel;
    
    /**
     Default contains nil. IF not contains extra details about the main data
     */
    let bottomLabel: UILabel?;
}

/**
 Type used for creating stack views which contains two columns
 */
struct StackColumn {
    let leading: StackColumnType;
    let trailing: StackColumnType;
}
