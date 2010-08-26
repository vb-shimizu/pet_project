require "logger"
require "utility"
class ContributesController < ApplicationController
  
  LOGGER = Logger.new(STDOUT)
  LOGGER.level = Logger::DEBUG
  # コンストラクタ
  def initialize
  end

  
  def test
    #@contributes = Contribute.find_all
    @contributes = Contribute.find(:all)
  end
 
  def add_cont
    # 画面より値を取得
    @cont = Contribute.new(params["new_cont"])
    f = params[:attachment]
#    f.original_filename  # => ファイル名
#    f.content_type       # => Content-Type
#    f.size               # => ファイルサイズ
#    f.read               # => ファイルの内容
    

    # 画面からの値、およびファイルのエラーチェック
#    logger.debug("拡張子チェック！！！" + Utility.checkFileExtension(f.original_filename))
    
    #LOGGER.debug("Test----->" + f)
    
    if( f.size != 0) then 
    
      # ファイル名を一意のファイル名に変換する
      String filename = Time.now.strftime("%Y%m%d%H%M%S") + Utility.getRandomString(10) +  f.original_filename
      
      
      # アップロードファイルのエラーチェック
      if (Utility.checkFileExtension(filename) == "false") then
          render :text  => "画像ファイルではない可能性があります。拡張子が「.jpg」「.jpeg」「.gif」である必要があります。"
      
      elsif (Utility.checkFileSize(f.size) == "false") then
          render :text  => "画像ファイルは、ⅠMB以下にしてください。"
        
      else
          # ファイル名、ファイルサイズ格納
        @cont.file_name = filename
        @cont.file_size = f.size
      
          # ファイルを保存する（フォルダ保存）
         File.open(RAILS_ROOT+"/public/images/upload/" + filename, 'w') do |of|
          of.write(f.read)
        end
      
      end
    end


    if @cont.save
      redirect_to(:action => "test")
    else
      render :text  => "Couldn't add new Contribute"
    end
    
   
  end
  
  
  
  
  
  
  # GET /contributes
  # GET /contributes.xml
  def index
    @contributes = Contribute.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contributes }
    end
  end

  # GET /contributes/1
  # GET /contributes/1.xml
  def show
    @contribute = Contribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contribute }
    end
  end

  # GET /contributes/new
  # GET /contributes/new.xml
  def new
    @contribute = Contribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contribute }
    end
  end

  # GET /contributes/1/edit
  def edit
    @contribute = Contribute.find(params[:id])
  end

  # POST /contributes
  # POST /contributes.xml
  def create
    @contribute = Contribute.new(params[:contribute])

    respond_to do |format|
      if @contribute.save
        flash[:notice] = 'Contribute was successfully created.'
        format.html { redirect_to(@contribute) }
        format.xml  { render :xml => @contribute, :status => :created, :location => @contribute }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contributes/1
  # PUT /contributes/1.xml
  def update
    @contribute = Contribute.find(params[:id])

    respond_to do |format|
      if @contribute.update_attributes(params[:contribute])
        flash[:notice] = 'Contribute was successfully updated.'
        format.html { redirect_to(@contribute) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contributes/1
  # DELETE /contributes/1.xml
  def destroy
    @contribute = Contribute.find(params[:id])
    @contribute.destroy

    respond_to do |format|
      format.html { redirect_to(contributes_url) }
      format.xml  { head :ok }
    end
  end
end
