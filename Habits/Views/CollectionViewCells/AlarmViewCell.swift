import UIKit

final class AlarmViewCell: UICollectionViewCell {
    
    static let identify = "AlarmViewCell"
    
    private var alarmSwitch: AlarmSwitchView
    
    private lazy var alarmStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, alarmSwitch])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.collectionCellFont()
        label.textColor = UIColor.lightOrangeColor
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(frame: CGRect) {
        self.alarmSwitch = AlarmSwitchView()
        super.init(frame: frame)
        configureCell()
        configureStackView()
        setupSwitchConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(label: String) {
        titleLabel.text = label
    }
}

//MARK: - Setup UI
extension AlarmViewCell {
    private func configureCell() {
        self.backgroundColor = UIColor.lightYellowColor
        self.layer.cornerRadius = 12
    }
    
    private func configureStackView() {
        contentView.addSubviews(alarmStackView)
        NSLayoutConstraint.activate([
            alarmStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            alarmStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            alarmStackView.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 10),
            alarmStackView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    
    private func setupSwitchConstraints() {
        NSLayoutConstraint.activate([
            alarmSwitch.widthAnchor.constraint(equalToConstant: 60),
            alarmSwitch.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
}
