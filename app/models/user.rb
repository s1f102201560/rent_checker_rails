# frozen_string_literal: true

class User < ApplicationRecord
  # モジュール
  # 定数
  # アクセサ
  # 関連
  # 委譲
  # スコープ
  # フック
  # バリデーション
  validates :name,  presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 255 }
                    # format: { with: ConstantData::VALID_EMAIL_REGEX }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 255 },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  # クラス変数
  # クラスメソッド
  # クラスメソッド(private)
  # メソッド
  # メソッド(private)
end
