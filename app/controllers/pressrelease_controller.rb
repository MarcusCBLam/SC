class PressreleaseController < ApplicationController
    def list
        @pressreleases = Pressrelease.find(:all)
    end
    
    def show
        @pressrelease = Pressrelease.find(params[:id])
    end
    
    def new
        @pressrelease = Pressrelease.new
        @pressreleasetypes = PressreleaseType.find(:all)
    end
    
    def create
        @pressrelease = Pressrelease.new(params[:book])
        if @pressrelease.save
            redirect_to :action => 'list'
            else
            @pressreleasetypes = PressreleaseType.find(:all)
            render :action => 'new'
        end
    end
    
    def edit
        @pressrelease = Pressrelease.find(params[:id])
        @pressreleasetypes = PressreleaseType.find(:all)
    end
    def update
        @pressrelease = Pressrelease.find(params[:id])
        if @pressrelease.update_attributes(params[:book])
            redirect_to :action => 'show', :id => @book
            else
            @pressreleasetypes = PressreleaseType.find(:all)
            render :action => 'edit'
        end
    end
    
    def delete
            Pressrelease.find(params[:id]).destroy
            redirect_to :action => 'list'
    end
end
