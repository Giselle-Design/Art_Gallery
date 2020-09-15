class Api::V1::ArtsController < ApplicationController
 #API return just data we dont need to define new method 
 #here because new method return html form page
    def index
        #curl http://localhost:3000/api/v1/arts
        arts = Art.order(created_at: :desc)
        render(json: arts, each_serializer: ArtCollectionSerializer)
    end

    def show
        #curl http://localhost:3000/api/v1/arts/:id
        art = Art.find(params[:id])
        render(json: art)
    end


    def create
    end

    def destroy
    end

end
