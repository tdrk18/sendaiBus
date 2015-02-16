# -*- coding: utf-8 -*-

class TimeTable < ActiveRecord::Base
    belongs_to :bus_stop
    validates :routes, uniqueness: {message: "重複しています"}, presence: {message: "入力してください"}

    def self.import(file, bus_stop_id)
        CSV.foreach(file.path, headers: true) do |row|
            # 一致するroutesをもつレコードを探す。なければ新規作成
            time_table = find_by(routes: row["routes"], bus_stop_id: bus_stop_id) || new
            # CSVからデータを取得、設定する
            row = row.to_hash
            row["bus_stop_id"] = bus_stop_id
            time_table.attributes = row.slice(*updatable_attributes)
            # レコードを保存
            p time_table
            time_table.save
        end
    end

    def self.updatable_attributes
        ["dow", "routes", "destination", "time", "bus_stop_id"]
    end
end
