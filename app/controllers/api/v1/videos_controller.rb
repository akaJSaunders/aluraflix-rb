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
        video = Video.new(video_params)

        if video.save
            head :ok
        else
            head :unprocessable_entity
        end
    end

    # PATCH /api/vi/videos/:id
    def update
        video = Video.find(params[:id])

        if video.update!(video_params)
            head :ok
        else
            head :unprocessable_entity
        end
    end

    # DELETE /api/vi/videos/:id
    def destroy
        video = Video.find(params[:id])

        if video.destroy!
            head :ok
        else
            head :unprocessable_entity
        end
    end

    private

    def video_params
        params.require(:video).permit(:titulo, :descricao, :url)
    end
end
