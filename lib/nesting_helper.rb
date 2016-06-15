require 'erb'
require 'sinatra/base'

class NestingHelper 
  
  
  def nest(args)
   args.count > 1 ? my_erb(args.pop){ nest(args) } : my_erb(args.last)
  end
  
  def my_erb(sym, &block)
    puts "================="
    puts sym
    block ||= Proc.new { "" }
    erb = ERB.new( find_file(sym) )
    unknown_crazy(erb, block)
  end
  
  private

  def find_file(sym, ext = ".erb", folder = "views")
    dir = File.join(Dir.pwd, folder, sym.to_s + ext)
    read_file(dir)
  end
  
  def read_file(dir)
    file = File.open(dir, 'r')
    result = file.read
    file.close
    result
  end
  
  class LayoutRenderer
  end
  
  def unknown_crazy(erb, block)
    erb.def_method(LayoutRenderer, :render)
    LayoutRenderer.new.render{ block.call }
  end

end
