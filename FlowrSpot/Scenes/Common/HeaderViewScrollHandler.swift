import UIKit

class HeaderViewScrollHandler {
  var headerViewHeight: CGFloat
  weak var headerView: UIView?

  init(headerViewHeight: CGFloat, headerView: UIView) {
    self.headerViewHeight = headerViewHeight
    self.headerView = headerView
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let contentOffset = -scrollView.contentOffset.y

    let percentage = 1 - (contentOffset / headerViewHeight)

    var headerViewTranslation = -percentage * headerViewHeight
    if headerViewTranslation > 0 {
      headerViewTranslation = 0 // lock headerView
    }

    headerView?.transform = CGAffineTransform.identity.translatedBy(x: 0, y: headerViewTranslation)
  }
}
