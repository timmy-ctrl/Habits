import UIKit

final class CalendatCell: UICollectionViewCell, CalendarCellConfigurable {
    
    static let identify = "CalendatCell"
    
    private let dayLabel: UILabel = {
        let dayLabel = UILabel()
        return dayLabel
    }()
    
    private let highlightView: UIView = {
        let highlightView = UIView()
        return highlightView
    }()
    
    private let iconView: UIView = {
        let iconView = UIView()
        return iconView
    }()
    
    override init(frame: CGRect) {
          super.init(frame: frame)
          setupViews()
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(day: CalendarDay) {
        let formatter = DateFormatter()
              formatter.dateFormat = "d"
              dayLabel.text = formatter.string(from: day.date)

              highlightView.isHidden = !day.isHighlighted
              iconView.isHidden = !day.hasIcon
    }
}

//MARK: - Setup UI
extension CalendatCell {
    private func setupViews() {
        self.addSubviews(dayLabel,iconView,highlightView)
        NSLayoutConstraint.activate([
            highlightView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            highlightView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            highlightView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            highlightView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            iconView.heightAnchor.constraint(equalToConstant: 2),
            iconView.widthAnchor.constraint(equalToConstant: 2),
            iconView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            iconView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            dayLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        highlightView.layer.cornerRadius = 8
             highlightView.isHidden = true
             highlightView.backgroundColor = .orange

             iconView.layer.cornerRadius = 4
             iconView.isHidden = true
             iconView.backgroundColor = .blue

             dayLabel.font = .systemFont(ofSize: 16)
             dayLabel.textAlignment = .center
    }
}
