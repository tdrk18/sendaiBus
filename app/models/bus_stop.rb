# -*- coding: utf-8 -*-

class BusStop < ActiveRecord::Base
    has_many :time_tables
    validates :name, uniqueness: {message: "重複しています"}, presence: {message: "入力してください"}

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            # 一致するnameをもつレコードを探す。なければ新規作成
            bus_stop = find_by(name: row["name"]) || new
            # CSVからデータを取得、設定する
            bus_stop.attributes = row.to_hash.slice(*updatable_attributes)
            # レコードを保存
            bus_stop.save
        end
    end

    def self.updatable_attributes
        ["name"]
    end
end

