//
//  MainView.swift
//  uikit-programmatically-example
//
//  Created by Martin Lachev on 20.02.21.
//

import UIKit

class MainView: View {
    override func initialize() {
        setupUI()
        setupViews()
        setupConstraints()

        NSLayoutConstraint.activate(sharedConstraints)
        layoutTrait(traitCollection: UIScreen.main.traitCollection)
    }

    private func setupUI() {
        backgroundColor = .red
    }

    private func setupViews() {
        addSubview(imageView)
    }

    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false

        sharedConstraints.append(contentsOf: addImageViewSharedConstraints())

    }

    // MARK: Constraints
    private func addImageViewSharedConstraints() -> [NSLayoutConstraint] {
        return [
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalToConstant: 49),
            imageView.heightAnchor.constraint(equalToConstant: 49)
        ]
    }

    // MARK: Views
    let imageView: UIView = {
        let imageView = UIView()
        imageView.backgroundColor = .white
        return imageView
    }()
}
