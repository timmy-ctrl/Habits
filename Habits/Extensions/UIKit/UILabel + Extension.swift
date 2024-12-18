import UIKit

extension UILabel {
    func textUppercased(text: String) {
        self.text = text.uppercased()
    }
    func alignmentCenter() {
        self.textAlignment = .center
    }
    func bigFont() {
        self.font = .systemFont(ofSize: 30, weight: .bold)
    }
    func middleFont() {
        self.font = .systemFont(ofSize: 16, weight: .bold)
    }
    func smallFont() {
        self.font = .systemFont(ofSize: 12, weight: .regular)
    }
    func introductionFontBold(text: String) {
        self.text = text.uppercased()
        self.font = .systemFont(ofSize: 23, weight: .bold)
    }
    func collectionCellFont() {
        self.font = .systemFont(ofSize: 20, weight: .bold)
    }
}
