class Api::V1::VideosController < ApplicationController

    before_action :find_video, only: [:update, :destroy]

    def index
        @videos = Video.all
        render json: @videos
        # render json: VideoSerializer.new(videos).serialized_json
    end

    def create
        video = Video.new(video_params)
        if product.save
            render json: VideoSerializer.new(video).serialized_json
        end
    end

    private

    # strong params 
    
    def video_params
        params.require(:video).permit(:name, :vid_url, :mood, :likes, :dislikes)
    end

    def find_video
        video = Video.find(params[:id])
    end

end