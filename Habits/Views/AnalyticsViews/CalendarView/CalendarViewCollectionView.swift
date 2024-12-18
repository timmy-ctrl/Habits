import UIKit

final class CalendarViewCollectionView: UIView {
    
    private let habitFrequencyCollectionView: HabitFrequencyCollectionView
    
    override init(frame: CGRect) {
        self.habitFrequencyCollectionView = HabitFrequencyCollectionView()
        super.init(frame: frame)
        setupDelegatesCollectionView() 
        configureHabitFrequencyCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDelegatesCollectionView() {
        habitFrequencyCollectionView.delegate = self
        habitFrequencyCollectionView.dataSource = self
    }
    
    
    private func configureHabitFrequencyCollectionView() {
        self.addSubviews(habitFrequencyCollectionView)
        NSLayoutConstraint.activate([
            self.habitFrequencyCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            self.habitFrequencyCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.habitFrequencyCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.habitFrequencyCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }
}

extension CalendarViewCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = habitFrequencyCollectionView.dequeueReusableCell(withReuseIdentifier: CalendarViewCell.identify, for: indexPath) as? CalendarViewCell else {
            fatalError()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing: CGFloat = 2 * 2 + 17 * 2
        let itemWidth = (collectionView.bounds.width - totalSpacing) / 7
        return CGSize(width: itemWidth, height: itemWidth * 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
}
