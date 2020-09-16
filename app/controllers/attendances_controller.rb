class AttendancesController < ApplicationController
    before_action :authenticate_user!

    before_action :find_event

    def new
        if already_attendant?
            redirect_to event_path(params[:event_id]), alert: "Vous participez déjà à l'évènement"
        end
    end

    def create
        if already_attendant?
            redirect_to new_event_attendance(params[:event_id]), alert: "Vous participez déjà à l'évènement"
        else
            @event.attendances.create(user_id: current_user.id)
            redirect_to event_path(@event), notice: "Vous êtes inscrit à l'évènement !"
        end
    end

    def destroy
        @attendance = @event.attendances.where(user_id: current_user.id)

        if !(already_attendant?)
            flash[:alert] = "Vous ne participez pas encore à l'évènement"
        else
            Attendance.destroy(params[:id])
            redirect_to event_path(params[:event_id]), notice: "Vous vous êtes désincrit de l'évènement"
        end
    end

    private

    def find_event
        @event = Event.find(params[:event_id])
    end

    def already_attendant?
        Attendance.where(user_id: current_user.id, event_id:params[:event_id]).exists?
    end
end