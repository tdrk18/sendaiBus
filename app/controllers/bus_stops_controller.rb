# -*- coding: utf-8 -*-

class BusStopsController < ApplicationController
    def index
        @busStops = BusStop.all
    end

    def show
        @busStop = BusStop.find(params[:id])
    end

    def new
        @busStop = BusStop.new
    end

    def create
        @busStop = BusStop.new(busStop_params)
        if @busStop.save then
            redirect_to bus_stops_path
        else
            render 'new'
        end
    end

    def edit
        @busStop = BusStop.find(params[:id])
    end

    def update
        @busStop = BusStop.find(params[:id])
        if @busStop.update(busStop_params)
            redirect_to bus_stops_path
        else
            render 'edit'
        end
    end

    def destroy
        @busStop = BusStop.find(params[:id])
        @busStop.destroy
        redirect_to bus_stops_path
    end

    def import
        BusStop.import(params[:file])
        redirect_to bus_stops_path, notice: "CSVをインポートしました"
    end

private
    def busStop_params
        params[:bus_stop].permit(:name)
    end
end
