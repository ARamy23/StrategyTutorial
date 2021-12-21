//
//  LabeledTextField.swift
//  StrategyTutorial
//
//  Created by Ahmed Ramy on 21/12/2021.
//

import Foundation
import UIKit

final class LabeledTextField: UIView {
    let textField: MainTextField = .init()
    private let errorLabel: UILabel = .init().then {
        $0.textColor = .red
    }
    
    var error: Dynamic<LocalError?> = .init(nil)
    
    lazy var stack = UIStackView(
        arrangedSubviews: [
            errorLabel,
            textField
        ],
        axis: .vertical,
        spacing: 8,
        alignment: .fill,
        distribution: .fill
    )
    
    init() {
        super.init(frame: .zero)
        addSubview(stack)
        stack.snp.makeConstraints { $0.directionalEdges.equalToSuperview() }
        
        error.subscribe {
            self.errorLabel.text = $0?.text
            self.errorLabel.isHidden = $0 == nil
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(stack)
        stack.snp.makeConstraints { $0.directionalEdges.equalToSuperview() }
        
        error.subscribe {
            self.errorLabel.text = $0?.text
            self.errorLabel.isHidden = $0 == nil
        }
    }
}
