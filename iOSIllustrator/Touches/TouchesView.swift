//
//  TouchesView.swift
//  iOSIllustrator
//
//  Created by yuxiao on 2019/12/23.
//  Copyright © 2019 Yulong Xiao. All rights reserved.
//

import UIKit

class TouchesView: UIView {
    
    private var paths = [UITouch: UIBezierPath]()
    
    private let clearButton = UIButton()
    
    private let textView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isMultipleTouchEnabled = true
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(clearButton)
        addSubview(textView)
        NSLayoutConstraint.activate([
            clearButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            clearButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            clearButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            clearButton.heightAnchor.constraint(equalToConstant: 40),
            textView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            textView.topAnchor.constraint(equalTo: clearButton.bottomAnchor, constant: 10),
            textView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        clearButton.setTitle("button", for: .normal)
        clearButton.setTitleColor(.darkText, for: .normal)
        clearButton.backgroundColor = .lightGray
        clearButton.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super .layoutSubviews()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.text = textView.text + "\ntouch Began: touch count: \(touches.count)"
        for touch in touches {
            let path = UIBezierPath()
            paths[touch] = path
            path.move(to: touch.location(in: self))
        }
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.text = textView.text + "\ntouches Moved: touch count: \(touches.count)"
        for touch in touches {
            if let path = paths[touch] {
                path.addLine(to: touch.location(in: self))
            }
        }
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.text = textView.text + "\ntouches Ended: touch count: \(touches.count)"
        setNeedsDisplay()
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.text = textView.text + "\ntouches Cancelled: touch count: \(touches.count)"
        setNeedsDisplay()
    }
    
     @objc private func buttonTapped(button: UIButton) {
        textView.text = nil
        paths.removeAll()
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        UIColor.red.setStroke()
        for path in paths.values {
            path.stroke()
        }
    }
}
