namespace :borrow_history do
  desc "返却期限日を超過しているデータのステータスを更新する。"
  task overdue: :environment do
    process = BorrowHistory::OverDueProcess.new
    process.execute
  end
end
