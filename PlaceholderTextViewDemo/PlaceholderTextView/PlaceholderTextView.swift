//
//  PlaceholderTextView.swift
//  PlaceholderTextViewDemo
//
//  Created by Kalpesh on 19/04/25.
//

import UIKit

@IBDesignable
class PlaceholderTextView: UITextView {
    
    // MARK: - Placeholder Label
    private let placeholderLabel = UILabel()
    
    // MARK: - Inspectable Properties
    
    @IBInspectable var placeholder: String = "" {
        didSet {
            placeholderLabel.text = placeholder
        }
    }
    
    @IBInspectable var placeholderColor: UIColor = .lightGray {
        didSet {
            placeholderLabel.textColor = placeholderColor
        }
    }
    
    @IBInspectable var borderColor: UIColor = .lightGray {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 8.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = true
        }
    }
    
    @IBInspectable var cursorColor: UIColor = .systemBlue {
        didSet {
            tintColor = cursorColor
        }
    }
    
    @IBInspectable var paddingTop: CGFloat = 16 {
        didSet { updateTextInsets() }
    }
    
    @IBInspectable var paddingLeft: CGFloat = 16 {
        didSet { updateTextInsets() }
    }
    
    @IBInspectable var paddingBottom: CGFloat = 16 {
        didSet { updateTextInsets() }
    }
    
    @IBInspectable var paddingRight: CGFloat = 16 {
        didSet { updateTextInsets() }
    }
    
    // MARK: - Font Customizations
    @IBInspectable var fontFamily: String = "Helvetica" {
        didSet {
            updateFont()
        }
    }
    
    @IBInspectable var fontSize: CGFloat = 14 {
        didSet {
            updateFont()
        }
    }
    
    private var customTextColor: UIColor = .black {
        didSet {
            super.textColor = customTextColor
        }
    }
    
    // MARK: - Init Methods
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - Common Init
    private func commonInit() {
        // Scroll indicator
        showsVerticalScrollIndicator = true
        alwaysBounceVertical = true // optional: allows scroll even with small content
        
        // Flash scroll bar briefly (can be removed if not needed)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.flashScrollIndicators()
        }
        
        // Cursor tint
        tintColor = cursorColor
        
        // Insets
        updateTextInsets()
        
        // Placeholder setup
        placeholderLabel.textColor = placeholderColor
        placeholderLabel.numberOfLines = 0
        placeholderLabel.font = self.font ?? UIFont.systemFont(ofSize: 14)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(placeholderLabel)
        
        NSLayoutConstraint.activate([
            placeholderLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: paddingTop),
            placeholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: paddingLeft),
            placeholderLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -paddingRight)
        ])
        
        // Styling
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        
        // Text change observer
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(textDidChangeNotification),
            name: UITextView.textDidChangeNotification,
            object: self
        )
        
        placeholderLabel.isHidden = !text.isEmpty
        
        // Set initial font
        updateFont()
    }
    
    // MARK: - Text Changed
    @objc private func textDidChangeNotification() {
        placeholderLabel.isHidden = !text.isEmpty
    }
    
    // MARK: - Update Insets
    private func updateTextInsets() {
        textContainerInset = UIEdgeInsets(top: paddingTop, left: paddingLeft, bottom: paddingBottom, right: paddingRight)
        textContainer.lineFragmentPadding = 0
    }
    
    // MARK: - Update Font
    private func updateFont() {
        if let font = UIFont(name: fontFamily, size: fontSize) {
            self.font = font
            placeholderLabel.font = font
        } else {
            self.font = UIFont.systemFont(ofSize: fontSize)
            placeholderLabel.font = UIFont.systemFont(ofSize: fontSize)
        }
    }
    
    // MARK: - Deinit
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        placeholderLabel.font = self.font
    }
}
