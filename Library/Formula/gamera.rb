require 'formula'

class Gamera < Formula
  url 'http://surfnet.dl.sourceforge.net/project/gamera/gamera/gamera-3.3.0/gamera-3.3.0.tar.gz'
  homepage 'http://gamera.informatik.hsnr.de/'
  md5 'd1f46b093f3abe5709ad22150f432aa4'
  
  def caveats; <<-EOS.undent
    You should build according to the instructions at https://gist.github.com/985173.
    
    This recipe will not build everything for you, because WxPython, Matplotlib 
    and Numpy are too difficult.
    
    If it doesn't work the first time, go there and double check your steps. Then
    come back and we'll talk.
    
    EOS
  end
  # depends_on 'cmake'
  
  def patches
    # fixes gamera to install with wx 2.9, at least until they get it sorted out.
    "https://gist.github.com/raw/985185/97cafdfbc45852a6e6b67f3300ba7e37406e6438/gistfile1.txt"
  end
  
  def install
    system "python", "setup.py", "build"
    system "python", "setup.py", "install", "--prefix=#{prefix}"
    
  end
end
