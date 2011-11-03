require 'csv'

class ChaptersController < ApplicationController
  # GET /chapters
  # GET /chapters.xml
  def index
    @chapters = Chapter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chapters }
    end
  end

  # GET /chapters/1
  # GET /chapters/1.xml
  def show
    @chapter = Chapter.find(params[:id])
    @book = Book.find_by_id(@chapter.book_id)
    @questions = @chapter.questions

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chapter }
    end
  end

  # GET /chapters/new
  # GET /chapters/new.xml
  def new
    @current_book = Book.find_by_id(params[:book_id])
    @chapter = Chapter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chapter }
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
        format.xml  { render :xml => @chapter, :status => :created, :location => @chapter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chapter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chapters/1
  # PUT /chapters/1.xml
  def update
    @chapter = Chapter.find(params[:id])
    book = Book.find_by_id(@chapter.book_id)
    puts book.to_json
    respond_to do |format|
      if @chapter.update_attributes(params[:chapter])
        format.html { redirect_to "/books/#{book.id}" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chapter.errors, :status => :unprocessable_entity }
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
  
  def export_to_csv
    puts "STARTED"
    @chapter = Chapter.find_by_id(params[:id])
    return if @chapter.nil?
    puts "DIDNT RETURN!!"
    @questions = Question.where("chapter_id = ?", @chapter.id)

    csv_string_test = CSV.generate do |csv|
      csv << ["id", "question", "correct answer", "incorrect answer1", "incorrect answer2", "incorrect answer3", "topic"]

     @questions.each do |q|
        next if q.question.nil? || q.question.length < 1

        row = [ q.id, 
                clean_markup_from_desc(q.question), 
                clean_markup_from_desc(q.correct_answer), 
                clean_markup_from_desc(q.incorrect_answer_1),
                clean_markup_from_desc(q.incorrect_answer_2),
                clean_markup_from_desc(q.incorrect_answer_3),
                clean_markup_from_desc(q.topic)]
        csv << row
      end
    end

    # send it to the browsah
    filename = @chapter.name.gsub(" ", "-")
    send_data csv_string_test,
              :type => 'text/csv; charset=iso-8859-1; header=present',
              :disposition => "attachment; filename=#{filename}.csv"
  end

  private

  def clean_markup_from_desc(str)
    return str if str.nil?
    str.gsub!("\s{2,}", " ")
    str.gsub!(" .", ".")
    str.gsub!("\n","")
    return str
  end
end
