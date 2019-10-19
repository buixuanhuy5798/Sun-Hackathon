//
//  ProfileController.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

class ProfileController: UIViewController, BindableType {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var viewModel: ProfileViewModel!
    
    override func viewDidLayoutSubviews() {
        avatarImageView.toRoundImage()
    }
    
    override func viewDidLoad() {
        config()
    }
    
    func config() {
        tableView.do {
            $0.register(cellType: InfoAccountCell.self)
            $0.rowHeight = view.height / 9.5
        }
    }
    
    func bindViewModel() {
        let input = ProfileViewModel.Input(inputTrigger: Driver.just(()))
        let output = viewModel.transform(input)
        output.infomation
            .drive(tableView.rx.items) { tableview, index, text in
                let indexPath = IndexPath(item: index, section: 0)
                let cell: InfoAccountCell = self.tableView.dequeueReusableCell(for: indexPath)
                switch indexPath.row {
                case 0:
                    cell.setUpContentCell(icon: "phone", info: text)
                default:
                    cell.setUpContentCell(icon: "address", info: text)
                }
                
                return cell
            }
            .disposed(by: rx.disposeBag)
    }
}

extension ProfileController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.profile
}
