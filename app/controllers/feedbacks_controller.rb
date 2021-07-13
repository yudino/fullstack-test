class FeedbacksController < ApplicationController 
   # protect_from_forgery with: :null_session

    def new 
    end
    
   # def show
   #    info = Info.find_by(id: params[:id])
   #     render json: InfoSerializer.new(info, options).serializable_hash.to_json
   # end

    def create
        info = Info.new(info_params)
        
        if info.save
            render json: InfoSerializer.new(info, options).serializable_hash.to_json
        else
            render json: {error: review.errors.messages}, status: unprocessable_entity
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