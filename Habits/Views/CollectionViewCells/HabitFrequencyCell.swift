import UIKit

final class HabitFrequencyCell: UICollectionViewCell {
    
    static let identify = "HabitFrequencyCell"
    
    private let diagonalLineView: DiagonalLineView
    
    private lazy var habitFrequencytackStuckView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dayLabel, habitImageView])
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
    
    private var dayLabel: UILabel = {
        let label = UILabel()
        label.smallFont()
        label.textColor = UIColor.lightGray
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private var habitImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        self.diagonalLineView = DiagonalLineView()
        super.init(frame: frame)
        configureStackView()
        configureDiagonalLineView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureText(day: String ) {
        dayLabel.text = day
    }
    
    func configureImage(image: UIImage) {
        habitImageView.image = image
    }
    
    func configureLine(isLastCell: Bool) {
        diagonalLineView.isHidden = isLastCell
    }
}

//MARK: - Setup UI
extension HabitFrequencyCell {
    private func configureStackView() {
        contentView.addSubviews(habitFrequencytackStuckView)
        NSLayoutConstraint.activate([
            habitFrequencytackStuckView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            habitFrequencytackStuckView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            habitFrequencytackStuckView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            habitImageView.widthAnchor.constraint(equalToConstant: 40),
            habitImageView.heightAnchor.constraint(equalToConstant: 40)
           ])
    }
    
    private func configureDiagonalLineView() {
        contentView.addSubviews(diagonalLineView)
        NSLayoutConstraint.activate([
            diagonalLineView.centerXAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 2.5),
            diagonalLineView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -10),
            diagonalLineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20),
            diagonalLineView.widthAnchor.constraint(equalToConstant: 2)
        ])
    }
}

