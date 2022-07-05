require 'rails_helper'

RSpec.describe Api::V1::VideosController, type: :request do

  before(:each) do
    Video.create(titulo: "Death Star Explodes", descricao: "action", url: "http://local/boom")
    Video.create(titulo: "Shakespeare play", descricao: "drama", url: "http://local/tobe_or_nottobe")
  end

  describe "GET video#show" do
    it "should get a video" do
      get "/api/v1/videos"

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).length).to eq(2)
    end
  end

  describe "GET video#index" do
    it "should get a video" do
      expected_video = {
        "id" => 1,
        "titulo" => "Death Star Explodes",
        "descricao" => "action",
        "url" => "http://local/boom"
      }

      get "/api/v1/videos/1"

      expect(response.status).to eq(200)
      expect(JSON.parse(body)).to eq(expected_video)
    end
  end

  describe "POST video#create" do
    it "should get a video" do
      video_params = {
        video: {
          titulo: "Cat video",
          descricao: "super cute cat" ,
          url: "www.youtube.com/cat"
        }
      }

      expect{ post "/api/v1/videos", params: video_params }.to change { Video.count }.from(2).to(3)
      expect(response.status).to eq(200)
    end
  end
end
