# -*- coding: utf-8 -*-

class TimeTable < ActiveRecord::Base
    belongs_to :bus_stop
    validates :routes, uniqueness: {message: "重複しています"}, presence: {message: "入力してください"}
end
