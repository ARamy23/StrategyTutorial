//
//  MainTextField.swift
//  StrategyTutorial
//
//  Created by Ahmed Ramy on 21/12/2021.
//

import UIKit.UITextField

final class MainTextField: UITextField {
    private let padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    var onUpdate: Callback<String>?
    
    init() {
        super.init(frame: .zero)
        stylize()
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        stylize()
    }
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

private extension MainTextField {
    func stylize() {
        self.layer.cornerRadius = 8
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1        
    }
    
    @objc func textDidChange() {
        onUpdate?(text ?? "")
    }
}
