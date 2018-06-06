import ReusableDataSource
import UIKit

class SightingTableViewCell: UITableViewCell {
  private lazy var nameLabel: UILabel = {
    let label = UILabel.autolayoutView()

    label.font = .custom(type: .regular, size: 15)
    label.textColor = .flowrDarkGray
    label.numberOfLines = 1
    label.minimumScaleFactor = 0.7

    return label
  }()

  private lazy var userNameLabel: UILabel = {
    let label = UILabel.autolayoutView()

    label.font = .custom(type: .italic, size: 12)
    label.textColor = .flowrGray
    label.numberOfLines = 1
    label.minimumScaleFactor = 0.7

    return label
  }()

  private lazy var descriptionLabel: UILabel = {
    let label = UILabel.autolayoutView()

    label.font = .custom(type: .italic, size: 13)
    label.textColor = .flowrGray
    label.numberOfLines = 0
    label.minimumScaleFactor = 0.7

    return label
  }()

  private lazy var commentsImageView: UIImageView = {
    let imageView = UIImageView.autolayoutView()

    imageView.contentMode = .center
    imageView.image = #imageLiteral(resourceName: "commentIcon")

    return imageView
  }()

  private lazy var commentsCountLabel: UILabel = {
    let label = UILabel.autolayoutView()

    label.font = .custom(type: .italic, size: 12)
    label.textColor = .flowrGray
    label.numberOfLines = 1
    label.minimumScaleFactor = 0.7

    return label
  }()

  private lazy var favouritesImageView: UIImageView = {
    let imageView = UIImageView.autolayoutView()

    imageView.contentMode = .center
    imageView.image = #imageLiteral(resourceName: "favoritesIcons")

    return imageView
  }()

  private lazy var favouritesCountLabel: UILabel = {
    let label = UILabel.autolayoutView()

    label.font = .custom(type: .italic, size: 12)
    label.textColor = .flowrGray
    label.numberOfLines = 1
    label.minimumScaleFactor = 0.7

    return label
  }()
}

extension SightingTableViewCell: ReusablePresenter {
  func present(viewModel: Sighting) {
    if nameLabel.superview == nil {
      setupViews()
      setupConstraints()
    }

    nameLabel.text = viewModel.name
    userNameLabel.text = "By " + viewModel.user.fullName
    descriptionLabel.text = viewModel.description

    commentsCountLabel.text = String(viewModel.commentsCount) + " Comments"
    favouritesCountLabel.text = String(viewModel.likesCount) + " Favorites"
  }
}

// MARK: - ViewLifecycle
extension SightingTableViewCell {
  private func setupViews() {
    addSubview(nameLabel)
    addSubview(userNameLabel)
    addSubview(descriptionLabel)
    addSubview(commentsImageView)
    addSubview(commentsCountLabel)
    addSubview(favouritesImageView)
    addSubview(favouritesCountLabel)
  }

  private func setupConstraints() {
    nameLabel.snp.makeConstraints { (make) in
      make.top.left.right.equalToSuperview().inset(UIEdgeInsets(top: 24, left: 24, bottom: 0, right: 24))
    }

    userNameLabel.snp.makeConstraints { (make) in
      make.left.right.equalToSuperview().inset(UIEdgeInsets(top: 24, left: 24, bottom: 0, right: 24))
      make.top.equalTo(nameLabel.snp.bottom).inset(UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0))
    }

    descriptionLabel.snp.makeConstraints { (make) in
      make.left.right.equalToSuperview().inset(UIEdgeInsets(top: 24, left: 24, bottom: 0, right: 24))
      make.top.equalTo(userNameLabel.snp.bottom).inset(UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0))
    }

    commentsImageView.snp.makeConstraints { (make) in
      make.left.bottom.equalToSuperview().inset(UIEdgeInsets(top: 24, left: 24, bottom: 0, right: 24))
      make.top.equalTo(descriptionLabel).inset(UIEdgeInsets(top: 24, left: 24, bottom: 0, right: 24))
      make.height.width.equalTo(24)
    }

    commentsCountLabel.snp.makeConstraints { (make) in
      make.left.centerY.equalTo(commentsImageView).inset(UIEdgeInsets(top: 24, left: 8, bottom: 0, right: 24))
    }

    favouritesImageView.snp.makeConstraints { (make) in
      make.centerY.equalTo(commentsImageView)
      make.left.equalTo(commentsCountLabel).inset(UIEdgeInsets(top: 24, left: 24, bottom: 0, right: 24))
    }

    favouritesCountLabel.snp.makeConstraints { (make) in
      make.left.centerY.equalTo(favouritesImageView).inset(UIEdgeInsets(top: 24, left: 8, bottom: 0, right: 24))
    }
  }
}
