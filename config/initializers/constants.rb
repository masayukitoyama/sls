# rails側の定数クラス。

MENU_ACTIVE = "active"

INCLUDE_BLANK_MESSAGE = "選択して下さい。"

# 検索データ対象
EXISTDATA = "exist_data"
AWSDATA = "aws_data"

# 検索対象カラム
BOOK_COLUMN = [
  {key: "isbn_10", value: "ISBN10桁"},
  {key: "isbn_13", value: "ISBN13桁"},
  {key: "asin", value: "ASIN"},
  {key: "title", value: "書籍名"},
  {key: "author", value: "著者名"},
]

# ユーザー権限
AUTHORITY_TYPE = [
  {id: 0, label: "管理者", value: "admin"},
  {id: 1, label: "閲覧者", value: "view"},
  {id: 2, label: "通常利用者", value: "normal"}
]
