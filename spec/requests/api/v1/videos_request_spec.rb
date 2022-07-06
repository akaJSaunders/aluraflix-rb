require 'rails_helper'

RSpec.describe Api::V1::VideosController, type: :request do

  before(:each) do
    Video.create(titulo: "Death Star Explodes", descricao: "action", url: "http://local/boom")
    Video.create(titulo: "Shakespeare play", descricao: "drama", url: "http://local/tobe_or_nottobe")
  end

  describe "GET video#show" do
    it "should get all videos" do
      get "/api/v1/videos"

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).length).to eq(2)
    end
  end

  describe "GET videos#index" do
    it "should get a videos" do
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

  describe "POST videos#create" do
    it "should create a video" do
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

  describe "PATCH videos#update" do
    it "should update a video" do
      video_params = {
        video: {
          titulo: "Death Star Destroys Alderaan",
          descricao: "oops" ,
        }
      }

      patch "/api/v1/videos/1", params: video_params

      actual = Video.find(1)
      expect(actual.titulo).to eq("Death Star Destroys Alderaan")
      expect(actual.descricao).to eq("oops")
      expect(actual.url).to eq("http://local/boom")

      expect(response.status).to eq(200)
    end
  end

  describe "DELETE videos#destroy" do
    it "should delete a video" do
      video_to_delete = Video.create!(titulo: "jump scare", descricao: "horror", url: "www.boo.com")

      expect{ delete "/api/v1/videos/#{video_to_delete.id}" }.to change { Video.count }.from(3).to(2)
      expect(response.status).to eq(200)
    end
  end
end
