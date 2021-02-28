//
//  View.swift
//  uikit-programmatically-example
//
//  Created by Martin Lachev on 20.02.21.
//

import UIKit

class View: UIView {
    internal var compactConstraints: [NSLayoutConstraint] = []
    internal var regularConstraints: [NSLayoutConstraint] = []
    internal var sharedConstraints: [NSLayoutConstraint] = []

    init() {
        super.init(frame: .zero)

        initialize()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        initialize()
    }

    func initialize() {
        translatesAutoresizingMaskIntoConstraints = false
        bindFrameToSuperviewBounds()
    }

    func layoutTrait(traitCollection: UITraitCollection) {
        if !sharedConstraints[0].isActive {
            NSLayoutConstraint.activate(sharedConstraints)
        }

        if traitCollection.horizontalSizeClass == .compact, traitCollection.verticalSizeClass == .regular {
            if regularConstraints.count > 0 && regularConstraints[0].isActive {
                NSLayoutConstraint.deactivate(regularConstraints)
            }

            NSLayoutConstraint.activate(compactConstraints)
        } else {
            if compactConstraints.count > 0 && compactConstraints[0].isActive {
                NSLayoutConstraint.deactivate(compactConstraints)
            }

            NSLayoutConstraint.activate(regularConstraints)
        }
    }
}
