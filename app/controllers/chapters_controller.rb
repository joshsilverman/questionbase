class ChaptersController < ApplicationController
  # GET /chapters
  # GET /chapters.xml
  def index
    @chapters = Chapter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :json => @chapters }
    end
  end

  # GET /chapters/1
  # GET /chapters/1.xml
  def show
    @chapter = Chapter.find(params[:id])
    @book = Book.find_by_id(@chapter.book_id)
    @questions = @chapter.questions.sort!{|a, b| a.created_at <=> b.created_at}
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :json => @chapter }
    end
  end

  # GET /chapters/new
  # GET /chapters/new.xml
  def new
    @current_book = Book.find_by_id(params[:book_id])
    @chapter = Chapter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :json => @chapter }
    end
  end

  # GET /chapters/1/edit
  def edit
    @chapter = Chapter.find(params[:id])
    @current_book = Book.find_by_id(@chapter.book_id)
  end

  # POST /chapters
  # POST /chapters.xml
  def create
    @chapter = Chapter.new(params[:chapter])
    @chapter.book_id = params[:book_id]

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to(@chapter, :notice => 'Chapter was successfully created.') }
        format.xml  { render :json => @chapter, :status => :created, :location => @chapter }
      else
        format.html { render :action => "new" }
        format.xml  { render :json => @chapter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chapters/1
  # PUT /chapters/1.xml
  def update
    @chapter = Chapter.find(params[:id])
    book = Book.find_by_id(@chapter.book_id)
    respond_to do |format|
      if @chapter.update_attributes(params[:chapter])
        format.html { redirect_to "/books/#{book.id}" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :json => @chapter.errors, :status => :unprocessable_entity }
      end
    end 
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.xml
  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy

    respond_to do |format|
      format.html { redirect_to(chapters_url) }
      format.xml  { head :ok }
    end
  end
end
