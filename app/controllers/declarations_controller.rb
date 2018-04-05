class DeclarationsController < ApplicationController
    before_action :set_declaration, only: [:show, :update, :destroy]

    def index
        @declarations = Declaration.all
    end

    def show
        @declaration = Declaration.find(params[:id])
    end

    def new
        @declaration = Declaration.new
    end

    def create
        @declaration = Declaration.new(declaration_params)
        if @declaration.save
            json_response(@declaration.to_json(:include => [:entries]))
        else
            json_response(@declaration.errors, :unprocessable_entity)
        end
    end

    def update
        if @declaration.update(declaration_params)
            redirect_to @declaration
        else
            render 'edit'
        end
    end

    def destroy
        @declaration.destroy
    end

    private

        def declaration_params
            params.permit(:content, :created_by)
        end

        def set_declaration
            @declaration = Declaration.find(params[:id])
        end

end
