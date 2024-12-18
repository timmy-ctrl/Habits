import UIKit

final class AlarmSwitchView: UIView {
    
    private let switchBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 18
        return view
    }()
    
    private let toggleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 16
        return button
    }()
    
    private let onLabel: UILabel = {
        let onLabel = UILabel()
        onLabel.text = "On"
        onLabel.smallFont()
        onLabel.textColor = UIColor.whiteColor
        onLabel.alignmentCenter()
        return onLabel
    }()
    
    private let offLabel: UILabel = {
        let offLabel = UILabel()
        offLabel.text = "Off"
        offLabel.smallFont()
        offLabel.textColor = UIColor.whiteColor
        offLabel.alignmentCenter()
        return offLabel
    }()
    
    public var isOn = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setup UI
extension AlarmSwitchView {
    private func setupView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.addSubviews(switchBackgroundView,onLabel,offLabel,toggleButton)
        NSLayoutConstraint.activate([
            switchBackgroundView.widthAnchor.constraint(equalToConstant: 60),
            switchBackgroundView.heightAnchor.constraint(equalToConstant: 36),
            
            onLabel.leadingAnchor.constraint(equalTo: switchBackgroundView.leadingAnchor, constant: 8),
            onLabel.centerYAnchor.constraint(equalTo: switchBackgroundView.centerYAnchor),
            
            offLabel.trailingAnchor.constraint(equalTo: switchBackgroundView.trailingAnchor, constant: -8),
            offLabel.centerYAnchor.constraint(equalTo: switchBackgroundView.centerYAnchor),
            
            toggleButton.widthAnchor.constraint(equalToConstant: 32),
            toggleButton.heightAnchor.constraint(equalToConstant: 32),
            toggleButton.centerYAnchor.constraint(equalTo: switchBackgroundView.centerYAnchor),
            toggleButton.leadingAnchor.constraint(equalTo: switchBackgroundView.leadingAnchor, constant: 2)
        ])
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleSwitch))
        switchBackgroundView.addGestureRecognizer(tapGesture)
        updateSwitchAppearance()
    }
}

//MARK: - Animation
extension AlarmSwitchView {
    public func updateSwitchAppearance() {
        if isOn {
            UIView.animate(withDuration: 0.25) {
                self.toggleButton.frame.origin.x = self.switchBackgroundView.frame.width - self.toggleButton.frame.width - 2
                self.switchBackgroundView.backgroundColor = .purple
                self.onLabel.alpha = 1
                self.offLabel.alpha = 0
            }
        } else {
            UIView.animate(withDuration: 0.25) {
                self.toggleButton.frame.origin.x = 2
                self.switchBackgroundView.backgroundColor = .lightGray
                self.onLabel.alpha = 0
                self.offLabel.alpha = 1
            }
        }
    }
    @objc private func toggleSwitch() {
        isOn.toggle()
        updateSwitchAppearance()
    }
}


