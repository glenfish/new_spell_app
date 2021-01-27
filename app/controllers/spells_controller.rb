class SpellsController < ApplicationController
        skip_before_action :verify_authenticity_token
        
        @@spells = [
            {id:1, name:"Fireball", description: "Ball of fire!", category: "fire"},
            {id:2, name: "Magic Missle", description: "A missle of magic", category: "force"},
            {id:3, name: "Avada Kedava", description: "It kills everyone except harry potter", category: "death"}   
        ]
        before_action :set_spell, only: [:show, :update, :destroy, :edit]
        
        def index
            render :index, locals: {spells: @@spells} 
        end
        
        def show
    
        end
        
        def new 
    
        end
        
        def edit 

        end 
        
        def create
            spell = {
                id: @@spells.last[:id] + 1, 
                name: params[:name], 
                description: params[:description],
                category: params[:category]
             } 
             @@spells.push(spell)
    
            redirect_to spells_path
        end
        
        def update
             updated_spell = {
                 id: @spell[:id],
                 name: params[:name],
                 description: params[:description],
                 category: params[:category]
             }
             @@spells[@index] = updated_spell
             redirect_to spells_path
        end
        
        def destroy 
            @@spells.delete_at(@index)
            redirect_to spells_path
            
        end
    
        private 
    
        def set_spell
            id = params[:id].to_i
            @index = @@spells.index {|spell| spell[:id] == id}
            if !@index
                render json: {error: "Could not find spell"}, status: 404
            else
                @spell = @@spells[@index]
            end 
        end
end  
 
