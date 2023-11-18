# frozen_string_literal: true

require 'csv'

namespace :promotion_code do
  desc 'プロモーションコードをテーブルに挿入する'
  task generate: :environment do
    list = []
    CSV.foreach('db/csv/csv_data.csv', headers: true) do |row|
      list << {
        code: row['code'],
        discount_amount: row['discount_amount']
      }
    end

    puts 'インポート処理開始'
    begin
      PromotionCode.create!(list)
      puts 'インポート完了'
    rescue StandardError => e
      puts e.message
    end
  end
end
