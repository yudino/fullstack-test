class FeedbacksController < ApplicationController 
    protect_from_forgery with: :null_session

    def new 
    end
    
    def show
        #feebacks?s=keyword OK
        if params[:s] != nil
        info = Info.joins(:message).where(["firstname like :s or lastname like :s or email like :s or review like :s", {s: "%" + params[:s] + "%"}])
        render json: InfoSerializer.new(info, options).serializable_hash.to_json

        #feebacks?o=column&d=asc or desc OK
        elsif params[:o] != nil && params[:d] != nil && params[:d] === 'DESC' || 'desc' || 'ASC' || 'asc'
        info = Info.joins(:message).order("#{params[:o]} #{params[:d]}")
        render json: InfoSerializer.new(info, options).serializable_hash.to_json

        # elsif params[:p] != nil&& params[:n] != nil
        # info = Info.joins(:message).select(params[:p]).order(params[:o]: :params[:n])
        # render json: InfoSerializer.new(info, options).serializable_hash.to_json
       else
        info = Info.find_by(id: params[:id])
        render json: InfoSerializer.new(info, options).serializable_hash.to_json
       end
    end

    def create
        # redirection fonctionne mais va sur la route GEt et pas PATCH/PUT...
        if Info.exists?(email: params[:info][:email])
            info = Info.find_by(email: params[:info][:email])
            redirect_to action: 'update', id: info.id, params: info_params, format: 'json'
        else
            info = Info.new(info_params)
            if info.save
                render json: InfoSerializer.new(info, options).serializable_hash.to_json
            else
                render json: {error: info.errors.messages}, status: 422
            end
        end
    end

    def update
        #TODO trouver un moyen de récupérer les datas de la requête POST
        info = Info.find(params[:id])
        if info.update(info_params)
            render json: InfoSerializer.new(info, options).serializable_hash.to_json
        else
            render json: {error: info.errors.messages}, status: 422
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