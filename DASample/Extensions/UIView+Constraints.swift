//
//  UIView+Constraints.swift
//  tsh-ios
//
//  Created by Daniel Avram on 18/09/2019.
//  Copyright © 2019 Cobalt Sign. All rights reserved.
//

import UIKit

// MARK: - Translates Autoresizing MaskInto Constraints

extension UIView {
    func prepareForConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Constraint edges

class EdgeInsets {
    var top: CGFloat?
    var left: CGFloat?
    var bottom: CGFloat?
    var right: CGFloat?

    static var zero: EdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
    static var zeroTop: EdgeInsets = .init(top: 0)
    static var zeroLeft: EdgeInsets = .init(left: 0)
    static var zeroRight: EdgeInsets = .init(right: 0)
    static var zeroBottom: EdgeInsets = .init(bottom: 0)
    static func some(top value: CGFloat) -> EdgeInsets { return .init(top: value) }
    static func some(left value: CGFloat) -> EdgeInsets { return .init(left: value) }
    static func some(right value: CGFloat) -> EdgeInsets { return .init(right: value) }
    static func some(bottom value: CGFloat) -> EdgeInsets { return .init(bottom: value) }

    static func all(_ value: CGFloat) -> EdgeInsets {
        return EdgeInsets(
            top: value,
            left: value,
            bottom: value,
            right: value
        )
    }

    static func pairs(vertical: CGFloat? = nil, horizontal: CGFloat? = nil) -> EdgeInsets {
        let insets = EdgeInsets()
        if let vertical = vertical {
            insets.top = vertical
            insets.bottom = vertical
        }
        if let horizontal = horizontal {
            insets.left = horizontal
            insets.right = horizontal
        }
        return insets
    }

    init(
        top: CGFloat? = nil,
        left: CGFloat? = nil,
        bottom: CGFloat? = nil,
        right: CGFloat? = nil
    ) {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
    }
}

extension UIEdgeInsets {
    var edgeInsets: EdgeInsets {
        return EdgeInsets(
            top: top,
            left: left,
            bottom: bottom,
            right: right
        )
    }
}

extension UIView {
    func pinEdges(to otherView: UIView, equalTo insets: EdgeInsets) {
        activateConstraints(to: otherView, insets: insets, relation: .equal)
    }

    func pinEdges(to otherView: UIView, greaterThanOrEqualTo insets: EdgeInsets) {
        activateConstraints(to: otherView, insets: insets, relation: .greaterThanOrEqual)
    }

    func pinEdges(to otherView: UIView, lessThanOrEqualTo insets: EdgeInsets) {
        activateConstraints(to: otherView, insets: insets, relation: .lessThanOrEqual)
    }

    func pinMargins(to otherView: UIView, equalTo insets: EdgeInsets) {
        otherView.addViewIfNeeded(self)
        if let top = insets.top {
            topAnchor.constraint(equalTo: otherView.layoutMarginsGuide.topAnchor, constant: top).isActive = true
        }
        if let left = insets.left {
            leftAnchor.constraint(equalTo: otherView.layoutMarginsGuide.leftAnchor, constant: left).isActive = true
        }
        if let right = insets.right {
            rightAnchor.constraint(equalTo: otherView.layoutMarginsGuide.rightAnchor, constant: -right).isActive = true
        }
        if let bottom = insets.bottom {
            bottomAnchor.constraint(equalTo: otherView.layoutMarginsGuide.bottomAnchor, constant: -bottom).isActive = true
        }
    }

    func addViewIfNeeded(_ view: UIView) {
        if subviews.contains(view) == false {
            addSubview(view)
        }
    }

    private func activateConstraints(to otherView: UIView, insets: EdgeInsets, relation: NSLayoutConstraint.Relation) {
        otherView.addViewIfNeeded(self)
        if let top = insets.top {
            NSLayoutConstraint(
                item: self,
                attribute: .top,
                relatedBy: relation,
                toItem: otherView,
                attribute: .top,
                multiplier: 1,
                constant: top
            ).isActive = true
        }
        if let left = insets.left {
            NSLayoutConstraint(
                item: self,
                attribute: .leading,
                relatedBy: relation,
                toItem: otherView,
                attribute: .leading,
                multiplier: 1,
                constant: left
            ).isActive = true
        }
        if let bottom = insets.bottom {
            NSLayoutConstraint(
                item: otherView,
                attribute: .bottom,
                relatedBy: relation,
                toItem: self,
                attribute: .bottom,
                multiplier: 1,
                constant: bottom
            ).isActive = true
        }
        if let right = insets.right {
            NSLayoutConstraint(
                item: otherView,
                attribute: .trailing,
                relatedBy: relation,
                toItem: self,
                attribute: .trailing,
                multiplier: 1,
                constant: right
            ).isActive = true
        }
    }
}

// MARK: - Constraint sizes

class Sizes {
    var width: CGFloat?
    var height: CGFloat?

    static func all(_ size: CGFloat) -> Sizes { return Sizes(width: size, height: size) }
    static func width(_ value: CGFloat) -> Sizes { return Sizes(width: value) }
    static func height(_ value: CGFloat) -> Sizes { return Sizes(height: value) }

    init(width: CGFloat? = nil, height: CGFloat? = nil) {
        self.width = width
        self.height = height
    }
}

extension UIView {
    func constraint(sizes: Sizes, relation: NSLayoutConstraint.Relation = .equal) {
        if let width = sizes.width {
            NSLayoutConstraint(
                item: self,
                attribute: .width,
                relatedBy: relation,
                toItem: nil,
                attribute: .width,
                multiplier: 1,
                constant: width
            ).isActive = true
        }
        if let height = sizes.height {
            NSLayoutConstraint(
                item: self,
                attribute: .height,
                relatedBy: relation,
                toItem: nil,
                attribute: .height,
                multiplier: 1,
                constant: height
            ).isActive = true
        }
    }
}

// MARK: - Constraint direction

enum Direction {
    case horizontal
    case vertical
}

extension UIView {
    func chain(_ direction: Direction, to view: UIView, with constant: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal) {
        switch direction {
        case .horizontal:
            NSLayoutConstraint(
                item: self,
                attribute: .leading,
                relatedBy: relation,
                toItem: view,
                attribute: .trailing,
                multiplier: 1,
                constant: constant
            )
            .isActive = true
        case .vertical:
            NSLayoutConstraint(
                item: self,
                attribute: .top,
                relatedBy: relation,
                toItem: view,
                attribute: .bottom,
                multiplier: 1,
                constant: constant
            )
            .isActive = true
        }
    }

    func center(_ direction: Direction, in parent: UIView) {
        parent.addViewIfNeeded(self)
        switch direction {
        case .horizontal:
            NSLayoutConstraint(
                item: self,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: parent,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
            )
            .isActive = true
        case .vertical:
            NSLayoutConstraint(
                item: self,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: parent,
                attribute: .centerY,
                multiplier: 1,
                constant: 0
            )
            .isActive = true
        }
    }
}
