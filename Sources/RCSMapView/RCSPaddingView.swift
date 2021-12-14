//
//  RCSPaddingView.swift
//  Lunch
//
//  Created by Ryan Spring on 12/5/21.
//

import UIKit

final class RCSPaddingView: UIView {
    let containedView: UIView
    
    init?(containedView: UIView?) {
        guard let containedView = containedView else {
            return nil 
        }

        self.containedView = containedView
        super.init(frame: .zero)
        
        addSubview(containedView)
        bindEdges()
    }
    
    private func bindEdges() {
        containedView.translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: containedView.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: containedView.rightAnchor).isActive = true
        topAnchor.constraint(equalTo: containedView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: containedView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return containedView.intrinsicContentSize
    }
    
    override var lastBaselineAnchor: NSLayoutYAxisAnchor {
        return containedView.bottomAnchor
    }
}
