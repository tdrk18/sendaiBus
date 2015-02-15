class TimeTablesController < ApplicationController
    def create
        @busStop = BusStop.find(params[:bus_stop_id])
        @timeTable = @busStop.time_tables.create(timeTable_params)
        redirect_to bus_stop_path(@busStop.id)
    end

    def destroy
        @timeTable = TimeTable.find(params[:id])
        @timeTable.destroy
        redirect_to bus_stop_path(params[:bus_stop_id])
    end

private
    def timeTable_params
        params[:time_table].permit(:dow, :routes, :destination, :time)
    end
end
