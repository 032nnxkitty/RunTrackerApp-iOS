//
//  HistoryViewController.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import UIKit

final class HistoryViewController: UIViewController {
    private var viewModel: HistoryViewModel!
    
    // MARK: - UI Elements
    private lazy var historyTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(HistoryCell.self, forCellReuseIdentifier: HistoryCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        configureHistoryTableView()
    }
    
    // MARK: - Public Methods
    func setViewModel(_ viewModel: HistoryViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: - Private Methods
private extension HistoryViewController {
    func configureAppearance() {
        view.backgroundColor = .systemBackground
        title = "History"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureHistoryTableView() {
        view.addSubview(historyTableView)
        NSLayoutConstraint.activate([
            historyTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            historyTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            historyTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            historyTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource
extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRuns
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryCell.identifier, for: indexPath) as! HistoryCell
        var content = cell.defaultContentConfiguration()
        content.text = "history"
        content.secondaryText = "secondary"
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


