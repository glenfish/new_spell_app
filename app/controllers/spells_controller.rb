class SpellsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    # @@spells = [
    #     {id:1, name:"Fireball", description: "Ball of fire!", type: "fire"},
    #     {id:2, name: "Magic Missle", description: "A missle of magic", type: "force"},
    #     {id:3, name: "Avada Kedava", description: "It kills everyone except harry potter", type: "death"}   
    # ]
    # run set_spell method  before show, update and edit
    before_action :set_spell, only: [:show, :update, :edit]
    before_action :permit_params, only: [:create, :update]

    def new
        
    end

    def edit
        # @spell = find fromparams and update this variable
    end
    
    def index 
        # only instance variables can be accessed in the corresponding html files
        @spells = @@spells
        puts "spells #{@spells}"
        # render json: @@spells
    end
    
    def show
        puts "spell #{@spell}"
        # render "spells/spell"
    #    render json: @spell
    end
    
    def create
        # puts "params in create method----- #{params}"
        # spell = {
        #     id: @@spells.last[:id] + 1, 
        #     name: params[:name], 
        #     description: params[:description],
        #     type: params[:type]
        #  } 
        #  created_spell = @@spells.push(spell).last
        # #  render just return a json or a html page
        # # render json: created_spell, status: 201
        # # redirect to index page
        # # redirect navigates all the way to the route and back to html
        # puts "spell ID --- #{spell[:id]}"
        # # show page: padd dynamic id as an argument to the path
        # redirect_to spell_path(spell[:id])
        # redirect_to spells_path

        # store to db
        puts "params in create------ #{params}"
        @spell = Spell.create(name: params[:name], description: params[:description], category: params[:category])
    end
    
    def update
        puts "update method----"
         updated_spell = {
             id: @spell[:id],
             name: params[:name],
             description: params[:description],
             type: params[:type]
         }
         @@spells[@index] = updated_spell
        # render json: updated_spell, status: 200
        redirect_to spell_path(updated_spell[:id])
    end 

    private 

    def set_spell
        puts "set spell --- #{params[:id]}"
        id = params[:id].to_i
        @index = @@spells.index {|spell| spell[:id] == id}
        if !@index
            render json: {error: "Could not find spell"}, status: 404
        else
            @spell = @@spells[@index]
        end 
    end 

    def permit_params
        permitted_params = params.require(:spell).permit(:name,:description, :category)
    end
end
