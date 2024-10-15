import UIKit

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, subViews: [UIView] ) {
        self.init(arrangedSubviews: subViews)
        self.axis = axis
        self.distribution = distribution
        self.spacing = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UILabel {
    convenience init(text: String, textAlignment: NSTextAlignment) {
        self.init()
        self.text = text
        self.textAlignment = textAlignment
        self.font = .systemFont(ofSize: 30, weight: .light)
        self.textColor = .white
        self.lineBreakMode = .byWordWrapping
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIButton {
    convenience init(text: String) {
        self.init(type: .system)
        
        self.backgroundColor  =  UIColor(named: "backgroundColor")
        self.tintColor = .white
        
        self.layer.cornerRadius = 20
        self.layer.borderColor = UIColor(named: "buttonBorder")?.cgColor
        self.layer.borderWidth = 5
        self.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        self.setTitle(text, for: .normal)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
