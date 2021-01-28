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
            @spell = Spell.find(params[:id])
        end
        
        def new 
    
        end
        
        def edit 
            @spell = Spell.find(params[:id])
        end 
        
        def create
            @spell = Spell.create(spell_params)
            if @spell.save
                flash[:created] = "New Spell Created!"
                redirect_to spells_path
            else
                flash[:error] = @spell.errors.full_messages.to_sentence
                # render 'new'
                redirect_to spell_new_path
                # render :new
            end
        end
        
        def update
             @spell.update(spell_params)
             if @spell.save
                flash[:updated] = "New Spell Updated!"
                redirect_to spells_path
             else
                flash.now[:error] = @spell.errors.full_messages.to_sentence
            end
             
        end
        
        def destroy 
            @spell.destroy
            redirect_to spells_path
            
        end
    
        private 
    
        def set_spell
            @spell = Spell.find(params[:id])
        end

        def spell_params
            params.require(:spells).permit(:name, :category, :description)
        end
end  
 
