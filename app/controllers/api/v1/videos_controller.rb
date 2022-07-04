class Api::V1::VideosController < ApplicationController
    
    # GET /api/v1/videos
    def index
        render json: Video.all
    end

    # GET /api/v1/video/:id
    def show
        render json: Video.find(params[:id])
    end
end
