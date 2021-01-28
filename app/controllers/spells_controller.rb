class SpellsController < ApplicationController
        skip_before_action :verify_authenticity_token
        
        # @@spells = [
        #     {id:1, name:"Fireball", description: "Ball of fire!", category: "fire"},
        #     {id:2, name: "Magic Missle", description: "A missle of magic", category: "force"},
        #     {id:3, name: "Avada Kedava", description: "It kills everyone except harry potter", category: "death"}   
        # ]

        before_action :set_spell, only: [:show, :update, :destroy, :edit]
        
        def index
            # render :index, locals: {spells: @@spells} 
            @spells = Spell.all
        end
        
        def show
    
        end
        
        def new 
    
        end
        
        def edit 

        end 
        
        def create
            @spell = Spell.create(spell_params)
    
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
            # @spell = Spell.find(params[:id])
        end

        def spell_params
            params.permit(:name, :category, :description)
        end
end  
 
