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
      make.top.left.right.equalToSuperview().inset(UIEdgeInsets(top: 16, left: 24, bottom: 0, right: 24))
    }

    userNameLabel.snp.makeConstraints { (make) in
      make.left.right.equalToSuperview().inset(UIEdgeInsets(top: 24, left: 24, bottom: 0, right: 24))
      make.top.equalTo(nameLabel.snp.bottom).offset(4)
    }

    descriptionLabel.snp.makeConstraints { (make) in
      make.left.right.equalToSuperview().inset(UIEdgeInsets(top: 24, left: 24, bottom: 0, right: 24))
      make.top.equalTo(userNameLabel.snp.bottom).offset(16)
    }

    commentsImageView.snp.makeConstraints { (make) in
      make.left.bottom.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 24, bottom: 12, right: 24))
      make.top.equalTo(descriptionLabel.snp.bottom).offset(12)
      make.height.width.equalTo(24)
    }

    commentsCountLabel.snp.makeConstraints { (make) in
      make.left.equalTo(commentsImageView.snp.right).offset(8)
      make.centerY.equalTo(commentsImageView)
    }

    favouritesImageView.snp.makeConstraints { (make) in
      make.left.equalTo(commentsCountLabel.snp.right).offset(8)
      make.centerY.equalTo(commentsImageView)
    }

    favouritesCountLabel.snp.makeConstraints { (make) in
      make.left.equalTo(favouritesImageView.snp.right).offset(8)
      make.centerY.equalTo(commentsImageView)
    }
  }
}
