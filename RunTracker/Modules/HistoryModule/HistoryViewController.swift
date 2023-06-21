//
//  HistoryViewController.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import UIKit

final class HistoryViewController: UITableViewController {
    private var viewModel: HistoryViewModel!
    
    // MARK: - UI Elements
    
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
        title = "History"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureHistoryTableView() {
        tableView.register(HistoryCell.self, forCellReuseIdentifier: R.Identifiers.history)
    }
}

// MARK: - Table View Configure
extension HistoryViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRuns
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.Identifiers.history, for: indexPath) as! HistoryCell
        let cellViewModel = viewModel.getViewModelForCell(at: indexPath)
        cell.configure(with: cellViewModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var vc = Assembly.createRunSessionStatsModule()
        vc = UINavigationController(rootViewController: vc)
        present(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // ..
    }
}


