require_dependency "big_cms/application_controller"

module BigCms
  class PagesController < ApplicationController
    before_action :set_page, only: [:show, :edit, :update, :destroy]
    
    # TODO - I hardcoded this for testing because it was using the BigCms layout and the javascripts for the Trix editor were in Application. I'm not quite sure how I want to resolve that long term.
    layout "application"

    # GET /pages
    def index
      @pages = Page.all
    end

    # GET /pages/1
    def show
    end

    # GET /pages/new
    def new
      @page = Page.new
    end

    # GET /pages/1/edit
    def edit
    end

    # POST /pages
    def create
      @page = Page.new(page_params)

      if @page.save
        redirect_to @page, notice: 'Page was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /pages/1
    def update
      if @page.update(page_params)
        redirect_to @page, notice: 'Page was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /pages/1
    def destroy
      @page.destroy
      redirect_to pages_url, notice: 'Page was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_page
        @page = Page.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def page_params
        params.require(:page).permit(:title, :content, :status, :version, :new_title, :new_content)
      end
  end
end
