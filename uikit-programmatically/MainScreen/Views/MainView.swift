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
        backgroundColor = .white
    }

    private func setupViews() {
        addSubview(imageView)
        addSubview(textView)
    }

    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false


        sharedConstraints.append(contentsOf: addSharedConstraints())
        regularConstraints.append(contentsOf: addRegularConstraints())
        compactConstraints.append(contentsOf: addCompactConstraints())
    }

    // MARK: Constraints

    private func addSharedConstraints() -> [NSLayoutConstraint] {
        return [
            textView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
        ]
    }

    private func addCompactConstraints() -> [NSLayoutConstraint] {
        return [
            //imageView
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            //textView
            textView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            textView.widthAnchor.constraint(equalToConstant: 350),
        ]
    }

    private func addRegularConstraints() -> [NSLayoutConstraint] {
        return [
            //imageView
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 400),
            imageView.heightAnchor.constraint(equalToConstant: 400),
            //textView
            textView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            textView.widthAnchor.constraint(equalToConstant: 700),
        ]
    }

    // MARK: Views
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "su")
        return imageView
    }()

    let textView: UILabel = {
        let textView = UILabel()
        textView.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        textView.textColor = .black
        print(textView.calculateMaxLines())
        textView.numberOfLines = 12
        textView.lineBreakMode = .byWordWrapping
        return textView
    }()
}
