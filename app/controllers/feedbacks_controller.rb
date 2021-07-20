class FeedbacksController < ApplicationController 
    protect_from_forgery with: :null_session

    def new 
    end
    
    def show
        info = Info.find_by(id: params[:id])
        render json: InfoSerializer.new(info, options).serializable_hash.to_json
    end

    def index
        db = Info.joins(:message)
        info = db
        esc_rows = (params[:n].to_i * params[:p].to_i) - params[:n].to_i 
        
        #feedbacks?s=keyword OK
        if params[:s] != nil 
        info = info.where(['firstname like :s or lastname like :s or email like :s or review like :s', {s: params[:s] + "%"}])
        end 

        #feedbacks?o=column&d=asc or desc OK
        if params[:o] != nil && params[:d] != nil && params[:d] === 'desc'.upcase || 'asc'.upcase
        info = info.order("#{params[:o]} #{params[:d]}")
        end

        #feedbacks?p=number&n=number  OK
        if params[:p] != nil && params[:n] != nil
        info = info.offset(esc_rows).limit(params[:n])
        end
        render json: InfoSerializer.new(info, options).serializable_hash.to_json
    end

    def create
        if Info.exists?(email: params[:info][:email])
            info = Info.find_by(email: params[:info][:email])
            info.update(info_params)
        else
            info = Info.new(info_params)
            if info.save
                render json: InfoSerializer.new(info, options).serializable_hash.to_json
            else
                render json: {error: info.errors.messages}, status: 422
            end
        end
    end
     
    private

    def info_params
        params.require(:info).permit(
            :firstname,:lastname,:email, 
            message_attributes: [:id, :review]
        )
    end
   
    def options
        @options ||= { include: %i[message]}
    end 
    

end