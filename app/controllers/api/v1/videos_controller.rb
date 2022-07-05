class Api::V1::VideosController < ApplicationController
    
    # GET /api/v1/videos
    def index
        render json: Video.all
    end

    # GET /api/v1/videos/:id
    def show
        render json: Video.find(params[:id])
    end

    # POST /api/vi/videos
    def create
        @video = Video.new(video_params)

        if @video.save
            render json: @video
        else
            render status: :unprocessable_entity
        end
    end

    private

    def video_params
        params.require(:video).permit(:titulo, :descricao, :url)
    end
end
