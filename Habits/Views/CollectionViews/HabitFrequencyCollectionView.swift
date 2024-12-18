import UIKit

final class HabitFrequencyCollectionView: UICollectionView {
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCollectionView() {
        self.register(HabitFrequencyCell.self, forCellWithReuseIdentifier: HabitFrequencyCell.identify)
        self.register(CalendarViewCell.self, forCellWithReuseIdentifier: CalendarViewCell.identify)
        self.isScrollEnabled = false
        self.backgroundColor = .white
    }
}
