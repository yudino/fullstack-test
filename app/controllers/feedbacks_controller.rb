class FeedbacksController < ApplicationController 
    protect_from_forgery with: :null_session

    def new 
    end
    
  #  def show
  #      info = Info.find_by(id: params[:id])
  #      render json: InfoSerializer.new(info, options).serializable_hash.to_json
  #  end

    def create
        info = Info.new(info_params)
        
        if info.save
            after_save :retrieve_info_id
            message = Message.new(message_params)

            if mesage.save
                render json: InfoSerializer.new(info, options).serializable_hash.to_json
            else
                render json: {error: review.errors.messages}, status: unprocessable_entity
            end
            
        else
            render json: {error: review.errors.messages}, status: unprocessable_entity
        end
    end
    
    private

    def info_params
        params.require(:info).permit(:firstname,:lastname,:email)
    end
    def message_params
        params.require(:message).permit(:review,:info_id)
    end

    def options
        @options ||= { include: %i[message]}
    end 
    def retrieve_info_id
        info_id = id
     #   puts info_id.inspect
    end

end