# -*- coding: utf-8 -*-

class BusStop < ActiveRecord::Base
    has_many :time_tables
    validates :name, uniqueness: {message: "重複しています"}, presence: {message: "入力してください"}
end
