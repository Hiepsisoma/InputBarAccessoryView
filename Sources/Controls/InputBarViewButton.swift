//
//  File.swift
//  InputBarAccessoryView
//
//  Created by DEV IOS on 14/2/25.
//

import UIKit

open class InputBarViewButton: InputBarButtonItem {
    
    public convenience init() {
        self.init(frame: .zero)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    
    open override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    open var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        return view
    }()
    
    open var customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemBlue
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    open var customLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.isUserInteractionEnabled = false
        return label
    }()
    
    private func setupViews() {
        addSubview(contentView)
        customImageView.tintColor = .systemBlue
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        contentView.addSubview(customImageView)
        contentView.addSubview(customLabel)
        NSLayoutConstraint.activate([
            customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            customImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            customImageView.widthAnchor.constraint(equalToConstant: 20),
            customImageView.heightAnchor.constraint(equalToConstant: 20),
            customLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            customLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 8),
            customLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            customLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6)
        ])
    }
    
    open override var intrinsicContentSize: CGSize {
        // Tính toán chiều rộng:
        // = left padding (12) + image width (20) + spacing (8) + label intrinsic width + right padding (12)
        let labelWidth = customLabel.intrinsicContentSize.width
        let totalWidth = 12 + 20 + 8 + labelWidth + 12
        
        // Tính toán chiều cao:
        // customImageView có kích thước cố định là 20,
        // customLabel có chiều cao intrinsic + top padding (6) + bottom padding (6)
        let labelHeight = customLabel.intrinsicContentSize.height + 6 + 6
        let totalHeight = max(20, labelHeight)
        
        return CGSize(width: totalWidth, height: totalHeight)
    }
}
