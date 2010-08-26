class Utility
  
  # ランダムな文字列を生成する。
  # 引数 _length_ を指定すると生成桁数を指定することができます(デフォルト 8 桁)。
  def Utility.getRandomString (length = 8)
    source=("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a + ["_","-","."]
    key=""
    length.times{ key+= source[rand(source.size)].to_s }
    return key
  end
  
  # 拡張子をチェックする。
  def Utility.checkFileExtension (fname)

    if(fname == nil) then
      return "false"
    end
    
    # 拡張子を取得
    ext = File.extname(fname)
    ext = ext.downcase
    
    # 許可する拡張子の配列を生成
    extArray = [".jpg", ".jpeg", ".gif"]
    extArray.each do |exta|
      if(ext == exta)
        return "true"
      end
    end
    return "false"

  end

  # ファイルサイズをチェックする
  def Utility.checkFileSize (fsize)
    
    if(fsize == nil)
      return "false"
    end
    
    # 許可するファイルサイズ(Byte)
    oksize = 1024000
    if (fsize < oksize) then
      return "true"
    end
    
    return "false"
    
  end

  
end