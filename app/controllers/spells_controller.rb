class SpellsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    @@spells = [
        {id:1, name:"Fireball", description: "Ball of fire!", type: "fire"},
        {id:2, name: "Magic Missle", description: "A missle of magic", type: "force"},
        {id:3, name: "Avada Kedava", description: "It kills everyone except harry potter", type: "death"}   
    ]
    
    def index 
        render json: @@spells
    end
    
    def show
        id = params[:id].to_i
        @spell = @@spells.find {|spell| spell[:id] == id}
        if @spell
            render json: @spell, status: 200
        else
            render json: {error: "Could not find spell"}, status: 404
        end

    end
    
    def create
        spell = {
            id: @@spells.last[:id] + 1, 
            name: params[:name], 
            description: params[:description],
            type: params[:type]
         } 
         created_spell = @@spells.push(spell).last

        render json: created_spell, status: 201
    end 
end
