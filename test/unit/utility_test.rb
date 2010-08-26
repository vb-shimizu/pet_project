
require "test/unit"
require "logger"
require "utility"

class UtilityTest < Test::Unit::TestCase

=begin
  def initialize
    super
  end
  
  
  def teardown
    super
  end
=end
  
  def setup
    @log = Logger.new(STDOUT)
    @log.level = Logger::DEBUG
  end
  
  def test_utility
    @log.debug("テスト開始します。")
    
    @log.debug("-----Utility.getRandomString Start-----")
    @log.debug("Utility.getRandomString():" + Utility.getRandomString())
    @log.debug("Utility.getRandomString(10):" + Utility.getRandomString(10))
    @log.debug("-----Utility.getRandomString End-----")
    
    @log.debug("-----Utility.checkFileExtension Start-----")
    @log.debug("Utility.checkFileExtension(nil):" + Utility.checkFileExtension(nil))
    @log.debug("Utility.checkFileExtension(file.csv):" + Utility.checkFileExtension("file.csv"))
    @log.debug("Utility.checkFileExtension(file.jpg):" + Utility.checkFileExtension("file.jpg"))
    @log.debug("Utility.checkFileExtension(file.jpeg):" + Utility.checkFileExtension("file.jpeg"))
    @log.debug("Utility.checkFileExtension(file.gif):" + Utility.checkFileExtension("file.gif"))
    @log.debug("Utility.checkFileExtension(file.zip):" + Utility.checkFileExtension("file.zip"))
    @log.debug("-----Utility.checkFileExtension End-----")
    
    @log.debug("-----Utility.checkFileSize Start-----")
    @log.debug("Utility.checkFileSize(nil):" + Utility.checkFileSize(nil))
    @log.debug("Utility.checkFileSize(2000000):" + Utility.checkFileSize(2000000))
    @log.debug("Utility.checkFileSize(10000):" + Utility.checkFileSize(10000))
    @log.debug("-----Utility.checkFileExtension End-----")
    
    
    @log.debug("テスト終了しました。")
  end
end