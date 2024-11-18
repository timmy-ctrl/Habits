import UIKit

enum AssetImages: String {
    case background
    case facebook
    case google
    case letter
    case lock
    case loupe
    case billboardImage
    case homePageBackground
    case plus
    case addhabit
    case arrow
    case facebillboard
    case completed
    case addhabitplus
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
}
